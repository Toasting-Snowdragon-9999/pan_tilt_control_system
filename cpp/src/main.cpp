#include <iostream>
#include <vector>
#include "vision.h"
#include "priority_vision.h"
#include "uart.h"


#define UART_DEBUGGER "/dev/ttyACM0"
#define UART_TO_TTY "/dev/ttyUSB0"

int main() {


    // /*INITILISES UART*/
    std::string usb_debugger = "/dev/ttyACM0";
    std::string usb_to_tty = "/dev/ttyUSB0";
    Uart uart;
    // UartConfig config = {
    //     .baud_rate = 115200 ,
    //     .data_bits = 8,
    //     .stop_bits = 1,
    //     .parity = 0,
    //     .flow_control = 0
    // };
    // bool success = uart.init(config, usb_debugger.c_str());
    bool success = true;
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
