#include <iostream>
#include <vector>
#include "vision.h"
#include "priority_vision.h"
#include "uart.h"


#define UART_DEBUGGER "/dev/ttyACM0"
#define UART_TO_TTY "/dev/ttyUSB0"

int main() {

<<<<<<< HEAD
=======

>>>>>>> 6e1c230e2979b4beddadf921c18161519cccdec3
    // /*INITILISES UART*/
    std::string usb_debugger = "/dev/ttyACM0";
    std::string usb_to_tty = "/dev/ttyUSB0";
    Uart uart;
<<<<<<< HEAD
    UartConfig config = {
        .baud_rate = 115200 ,
        .data_bits = 8,
        .stop_bits = 1,
        .parity = 0,
        .flow_control = 0
    };
    bool success = uart.init(config, usb_debugger.c_str());
=======
    // UartConfig config = {
    //     .baud_rate = 115200 ,
    //     .data_bits = 8,
    //     .stop_bits = 1,
    //     .parity = 0,
    //     .flow_control = 0
    // };
    // bool success = uart.init(config, usb_debugger.c_str());
    bool success = true;
>>>>>>> 6e1c230e2979b4beddadf921c18161519cccdec3
    /*IF UART SUCCESSFULLY INITIALISED WE START TRACKING*/
    if (success){
        PrioVision vision;
        vision.tracking(uart);
    }
    else{
        std::cerr << "Failed to initialize UART." << std::endl;
        return -1;
    }

    return 0;
}
