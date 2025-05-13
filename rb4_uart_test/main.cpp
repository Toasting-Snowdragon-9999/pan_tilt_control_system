#include <iostream>
#include "uart_test.h"

//#define UART_PORT "/dev/ttyUSB0"
#define UART_PORT "/dev/ttyACM0"
int main() {
    Uart uart;
    UartConfig config = {
        .baud_rate = 115200,
        .data_bits = 8,
        .stop_bits = 1,
        .parity = 0,
        .flow_control = 0
    };

    if (!uart.init(config, UART_PORT)) {
        std::cerr << "Failed to initialize UART\n";
        return 1;
    }

    stream_test_data(uart);

    return 0;
}
