#include "uart.h"

Uart::Uart(): _handler(-1) {}

Uart::~Uart() {
    if (_handler >= 0) {
        close(_handler);
    }
}

speed_t Uart::_get_baudrate(uint32_t baud_rate){
    switch(baud_rate) {
        case 9600:    return B9600;
        case 19200:   return B19200;
        case 38400:   return B38400;
        case 57600:   return B57600;
        case 115200:  return B115200;
        // Add additional cases if needed
        default:
            std::cerr << "Warning: Unsupported baud rate " << baud_rate
                      << ", defaulting to 115200.\n";
            return B115200;
    }
}

void Uart::_set_data_bits(uint8_t data_bits, struct termios& tty) {
    tty.c_cflag &= ~CSIZE;
    switch(data_bits) {
        case 5: tty.c_cflag |= CS5; break;
        case 6: tty.c_cflag |= CS6; break;
        case 7: tty.c_cflag |= CS7; break;
        case 8: tty.c_cflag |= CS8; break;
        default:
            std::cerr << "Warning: Unsupported data bits " << data_bits
                      << ", defaulting to 8.\n";
            tty.c_cflag |= CS8;
    }

}

void Uart::_set_parity(uint8_t parity, struct termios& tty) {
    switch(parity) {
        case 0: tty.c_cflag &= ~PARENB; break;
        case 1: tty.c_cflag |= PARENB; tty.c_cflag &= ~PARODD; break;
        case 2: tty.c_cflag |= PARENB; tty.c_cflag |= PARODD; break;
        default:
            std::cerr << "Warning: Unsupported parity " << parity
                      << ", defaulting to none.\n";
            tty.c_cflag &= ~PARENB;
    }

}


void Uart::speak(const uint8_t* data, int size) {
    // uint8_t size = 3;
    if (_handler < 0) {
        std::cerr << "Error: Serial port not open for writing." << std::endl;
        return;
    }
    ssize_t written = write(_handler, data, size);
    if (written < 0) {
        std::cerr << "Write error: " << strerror(errno) << std::endl;
    }
}

void Uart::listen(uint8_t* data, int size){

    if (_handler < 0) {
        std::cerr << "Error: Serial port not open for reading." << std::endl;
        return;
    }
    ssize_t bytes_read = read(_handler, data, size);
    if (bytes_read < 0) {
        std::cerr << "Read error: " << strerror(errno) << std::endl;
    }
}

int Uart::communicate(const std::vector<uint8_t>& data, std::vector<uint8_t>& rec, int size){
    if (size == 0) {
        std::cerr << "Error: Cannot communicate with 0 bytes." << std::endl;
        return -1;
    }
    if (_handler < 0) {
        std::cerr << "Error: Serial port not open for communication." << std::endl;
        return -1;
    }
    if (data.size() != size) {
        std::cerr << "Error: Data size does not match expected size." << std::endl;
        return -1;
    }
    rec.resize(size);

    for(int i = 0; i < size; i++){
        speak(&data[i], 1);
        listen(&rec[i], 1);
    }

    return 0;

}


bool Uart::init(const UartConfig& config, const char* port) {
    _handler = open(port, O_RDWR | O_NOCTTY | O_SYNC); // O_RDWR
    if (_handler < 0) {
        std::cerr << "Error: Cannot open port " << port 
                  << ", error: " << strerror(errno) << std::endl;
        return 0;
    }

    // Get current serial port settings
    struct termios tty;
    memset(&tty, 0, sizeof(tty));

    if (tcgetattr(_handler, &tty) != 0) {
        std::cerr << "Error from tcgetattr: " << strerror(errno) << std::endl;
        close(_handler);
        _handler = -1;
        return 0;
    }

    speed_t speed = _get_baudrate(config.baud_rate);
    cfsetospeed(&tty, speed);
    cfsetispeed(&tty, speed);
    
    tty.c_cflag |= (CLOCAL | CREAD);    // Enable receiver and set local mode
    tty.c_cflag &= ~CSIZE;              // clear current data bits

    _set_data_bits(config.data_bits, tty);

    if (config.stop_bits == 2) {
        tty.c_cflag |= CSTOPB;
    }
    else{
        tty.c_cflag &= ~CSTOPB;
    }

    _set_data_bits(config.data_bits, tty);

    // Flow control (hardware or software)
    tty.c_cflag &= ~CRTSCTS; 
    tty.c_iflag &= ~(IXON | IXOFF | IXANY);

    if (config.flow_control == 1) {
        // HW flow control
        tty.c_cflag |= CRTSCTS;
    } else if (config.flow_control == 2) {
        // SW flow control
        tty.c_iflag |= (IXON | IXOFF);
    }

     // Raw input
     tty.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);

     // Raw output
     tty.c_oflag &= ~OPOST;
 
     // Set VMIN & VTIME for read() blocking behavior
     tty.c_cc[VMIN]  = 1;    // no minimum # of bytes
     tty.c_cc[VTIME] = 10;   // 1 second timeout (10 * 0.1s)
 
     // Apply settings
     if (tcsetattr(_handler, TCSANOW, &tty) != 0) {
         std::cerr << "Error from tcsetattr: " << strerror(errno) << std::endl;
         close(_handler);
         _handler = -1;
         return 0;
     }
 
     // Flush old data
     tcflush(_handler, TCIFLUSH);
 
     std::cout << "Successfully opened and configured " << port << std::endl;
     return 1;
}


UartReader::UartReader(Uart& uart) : _uart(uart), _running(false) {}

UartReader::~UartReader() {
    stop();
}

void UartReader::start() {
    _running = true;
    _thread = std::thread(&UartReader::run, this);
}

void UartReader::stop() {
    _running = false;
    if (_thread.joinable()) {
        _thread.join();
    }
}

void UartReader::run() {
    uint8_t byte;
    while (_running) {
        _uart.listen(&byte, 1);
        std::cout << static_cast<char>(byte) << std::flush;  // print as char
        
    } 
}
