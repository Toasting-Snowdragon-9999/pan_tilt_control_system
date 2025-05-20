#include <iostream>
#include <bitset>
#include <chrono>
#include <thread>
#include "uart.h"

#define UART_DEBUGGER "/dev/ttyACM0"
#define UART_TO_TTY "/dev/ttyUSB0"

int main()
{
    Uart uart;
    UartConfig config = {
        .baud_rate    = 115200,
        .data_bits    = 8,
        .stop_bits    = 1,
        .parity       = 0,
        .flow_control = 0
    };

    if (!uart.init(config, UART_DEBUGGER)) {
        std::cerr << "Failed to initialize UART!" << std::endl;
        return 1;
    }

    uint16_t value = 0x1000;       // Start value
    uint16_t last_echoed = 0xFFFF; // Set to an invalid value initially

    while (true)
    {
        const uint8_t* bytes = reinterpret_cast<uint8_t*>(&value);

        std::cout << "Sending: 0x" << std::hex << value << std::dec
                  << "  [MSB: " << std::bitset<8>(bytes[1])
                  << ", LSB: " << std::bitset<8>(bytes[0]) << "]" << std::endl;

        uart.speak(bytes, 2);  // Send 16-bit value as 2 bytes

        // Wait for a response (should be 2 bytes if echoed)
        uint16_t response = 0;
        uart.listen(reinterpret_cast<uint8_t*>(&response), 2);

        if (response != last_echoed) {
            std::cout << " Echoed back: 0x" << std::hex << response << std::dec << std::endl;
            last_echoed = response;
        } else {
            std::cout << "⏸ No new echo (value same as last)." << std::endl;
        }

        // Next value
        value++;

        std::this_thread::sleep_for(std::chrono::milliseconds(50));
    }

    return 0;
}
