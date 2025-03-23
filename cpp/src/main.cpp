#include <iostream>
#include <vector>
#include "vision.h"
#include "priority_vision.h"
#include "uart.h"

#define EXTERNAL_CAMERA 4
#define INTERNAL_CAMERA 0
#define CAMERA_IN_USE EXTERNAL_CAMERA

int main() {
    PrioVision vision;
    vision.tracking(CAMERA_IN_USE);

    // std::string usb_debugger = "/dev/ttyACM0";
    // std::string usb_to_tty = "/dev/ttyUSB0";
    // UartConfig config = {
    //     .baud_rate = 9600,
    //     .data_bits = 8,
    //     .stop_bits = 1,
    //     .parity = 0,
    //     .flow_control = 0
    // };

    // Uart uart;
    // bool success = uart.init(config, usb_to_tty.c_str());
    // const std::vector<uint8_t> data = {'h', 'h', 'a', 'b'};
    // uint8_t rec;
    // uint8_t old_rec = '\n';
    // if (success){
    //     while (true) {
    //         uart.listen(&rec);
    //         if (rec != old_rec) {
    //             //uart.listen(&rec);
    //             std::cout << rec << std::endl;
    //             old_rec = rec;
    //         }
    //     }
    // }

    return 0;
}
