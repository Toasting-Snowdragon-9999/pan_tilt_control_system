#include <iostream>
#include <vector>
// #include "vision.h"
// #include "priority_vision.h"
#include "uart.h"
#include <bitset>

#define UART_DEBUGGER "/dev/ttyACM0"
#define UART_TO_TTY "/dev/ttyUSB0"

int main()
{

    // /*INITILISES UART*/
    std::string usb_debugger = "/dev/ttyACM0";
    std::string usb_to_tty = "/dev/ttyUSB0";
    Uart uart;
    UartConfig config = {
        .baud_rate = 115200,
        .data_bits = 8,
        .stop_bits = 1,
        .parity = 0,
        .flow_control = 0};
    bool success = uart.init(config, usb_to_tty.c_str());
    // bool success = true;
    UartReader ur(uart);
    ur.start();
    while (success)
    {
        std::cout << "Type a 16-bit integer to send in decimal value: " << std::endl;
        uint16_t input;
        while (!(std::cin >> input) || input > 65535) {
            std::cout << "Invalid input. Please enter a valid 16-bit integer (0-65535): " << std::endl;
            std::cin.clear(); // Clear the error flag
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // Discard invalid input
        }
        const uint8_t* bytes = reinterpret_cast<uint8_t*>(&input);
        std::cout << "MSB: " << std::bitset<8>(bytes[1]) << std::endl;
        std::cout << "LSB: " << std::bitset<8>(bytes[0]) << std::endl;
        
        uart.speak(bytes, 2); // Send the input as bytes

    }
    ur.stop();


    return 0;
}
