#include <iostream>
#include <vector>
#include "vision.h"
#include "priority_vision.h"
#include "uart.h"

int main() {
    // PrioVision vision;
    // vision.tracking();
    UartConfig config = {
        .baud_rate = 9600,
        .data_bits = 8,
        .stop_bits = 1,
        .parity = 0,
        .flow_control = 0
    };

    Uart uart;
    uart.init(config, "/dev/ttyACM0");
    const std::vector<uint8_t> data = {'h', 'h', 'a', 'b'};
    std::vector<uint8_t> rec;
    int size = data.size();
    int success = uart.communicate(data, rec, size);

    if(success == 0) {
        for (int i = 0; i < size; i++) {
            std::cout << rec[i] << " ";
        }    
        std::cout << std::endl;
    }

    return 0;
}
