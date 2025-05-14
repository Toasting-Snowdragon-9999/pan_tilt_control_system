#ifndef UART_TEST_H
#define UART_TEST_H

#include <stdint.h>
#include <fcntl.h>      // O_RDWR, O_NOCTTY, etc.
#include <unistd.h>     // read, write, close
#include <termios.h>    // termios, TCSANOW, etc.
#include <cstring>      // memset, strerror
#include <iostream>
#include <cerrno>       // errno
#include <string>       // strerror
#include <vector>

// for class UartReader 
#include <atomic>
#include <thread>
#include <iomanip>
struct UartConfig {
  uint32_t baud_rate;
  uint8_t data_bits;
  uint8_t stop_bits;
  uint8_t parity;
  uint8_t flow_control;
};

class Uart {
    private: 
        int _handler;
         /**
        * @brief This method will return a baudrate usable for the underlying system
        * @param baud_rate Type: unsigned 32 bit integer - This is the desired baudrate 
        * @return Type: speed_t - This is the baudrate that the system can use 
        */
        speed_t _get_baudrate(uint32_t baud_rate);
        /**
         * @brief This method will set the data bits for the UART communication
         * @param data_bits Type: uint8_t - This is the number of data bits
         * @param tty Type: struct termios - This is the configuration for the UART communication
         * @return Type: void - 
         */
        void _set_data_bits(uint8_t data_bits, struct termios& tty);
        /**
         * @brief This method will set the stop bits for the UART communication
         * @param stop_bits Type: uint8_t - This is the number of stop bits
         * @param tty Type: struct termios - This is the configuration for the UART communication
         * @return Type: void - 
         */
        void _set_parity(uint8_t parity, struct termios& tty);

    public:
        /**
        * @brief This method will construct the UART communication
        * @param none Type: void -
        * @return Type: void - 
        */
        Uart();
                /**
        * @brief This method will deconstruct the UART communication
        * @param none Type: void -
        * @return Type: void - 
        */
        ~Uart();
        /**
        * @brief This method will initialise the UART communication with a port and a config
        * @param condif Type: custom struct UartConfig - This is the configuration for the UART communication
        * @param port Type: const char * - This is a pointer to the port that the UART communication will be on
        * @return Type: void - 
        */
        bool init(const UartConfig& config, const char* port);
        /**
        * @brief This method will send 1 byte of data
        * @param data Type: const uint8_t - This is a reference to the data that will be sent
        * @return Type: void - 
        */
        void speak(const uint8_t* data, int size);
        /**
        * @brief This method will recieve 1 byte of data
        * @param data Type: uint8_t - This is a reference to where the recieved data will be stored
        * @return Type: void - 
        */
        void listen(uint8_t* data, int size);
        /**
        * @brief This method will send the data 1 byte at a time and check to recieve a byte after each send
        * @param data Type: vector of uint8_t - this is a vector to the data that will be sent
        * @param rec Type: vector of uint8_t - This is a reference to where the recieved data will be stored
        * @param size Type: int - The size of data and rec
        * @return Type: int - This will either be 1, 0 or -1
        * 1 represent that the communication was successful, but the recieved data
        * was not the same size as the send data
        * 0 represent that the communication was successful
        * -1 represent that the communication was not successful
        */
        int communicate(const std::vector<uint8_t>& data, std::vector<uint8_t>& rec, int size);

	
	
};


class UartReader {
public:
    UartReader(Uart& uart);
    ~UartReader();

    void start();
    void stop();

private:
    void run();

    Uart& _uart;
    std::atomic<bool> _running;
    std::thread _thread;
};

void stream_test_data(Uart& uart);
#endif // UART_TEST_H
