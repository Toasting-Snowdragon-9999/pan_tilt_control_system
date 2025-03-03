#ifndef FILE_NAME_H
#define FILE_NAME_H

#include <iostream>
#include <memory>

/**
 * 
 * TO MAKE A CLASS
 * 
 */

class MyClass{
    private: 
        int _private_member;

        void _private_func(std::string &argument);

    public: 
        int public_member;

        void public_func(std::string &argument);
};

#endif // FILE_NAME_H

// #include "file_name.h"

void MyClass::_private_func(std::string &argument){
    /*
    a private function can only be accessed inside the class
    Therefore they should be used as helper function to a public function.
    */
    argument = "Something cool";
    _private_member = 10;
}

void MyClass::public_func(std::string &argument){
    /*
    A public function is something you call when using instances of the class.
    They can run multiple private helper functions
    */
    argument = "Something cool";
    public_member = 20;
}   


/**
 * 
 * STUFF FOR STORING DATA 
 * 
 */


enum InfoLevel {
    CRITICAL =  -2,
    WARNING = -1,
    STABIL = 0,
    ERROR = 1
};

enum InfoLevel {
    CRITICAL,
    WARNING,
    STABIL,
    ERROR
};

struct Info {
    int level;
    std::string message;
};

struct Info {
    int level;
    std::string message;

    void print_info(){
        std::cout << "Level: " << level << ", Message: " << message << std::endl;
    }
};

int main() {
    Info info;
    std::shared_ptr<MyClass> ptr1 = std::make_shared<MyClass>();
    std::string input = "argument";
    ptr1->public_func(input);

    info.level = WARNING;
    info.message = "This is a warning message.";
  
    info.print_info();
  
    return 0;
}


/**
 * 
 * MAKING A TEMPLATE CLASS AND NAMESPACE
 * USING DOXYGEN 
 * 
 */

template <typename T>
class MyTempClass {
private:
    T _private_member;

public:
    MyTempClass(T val) : _private_member(val) {}
};


#include <iostream>

namespace name {
    /**
     * @brief Method description, shortly about what it do
     * @param argument Type: argument type - short description of what it do
     * @return Type: return type - short description of what the return represents 
     */
    void displayMessage() {
        std::cout << "Hello from MyNamespace!" << std::endl;
    }

    int myVar = 10;

    class MyClass {
    public:
        void show() {
            std::cout << "This is MyClass inside MyNamespace." << std::endl;
        }
    };
}

int main(){
    name::displayMessage();
    name::myVar = 20;
    name::MyClass some_name;
    some_name.show();
}

/// @brief Method description, shortly about what it do
/// @param argument Type: argument type - short description of what it do
/// @return Type: return type - short description of what the return represents 
bool error_function(){
    bool success = true;

    for(;;){
        // do something
        int oh_no = 1;
        if (oh_no == 1){
            success = false;
        } 
        break;
    }
    return success;
}




#define MAX 200             // Define all caps 
int _private_member;        // private member with an _
int my_variable;            // normal variable
MyClass instance;           // class with capital beginning
int g_global_variable;      // global with a g_ in front

int main(){

    while(true); 

    for(int i = 0; i < MAX; i++);

    // Giving them a clear body 

    while(true)
    {
        // body
    } 

    for(int i = 0; i < MAX; i++)
    {
        // body
    }

}


#include <iostream>
#include <chrono>
#include <thread>

void someFunction() {
    std::this_thread::sleep_for(std::chrono::milliseconds(500));  // Simulate work
}

int main() {
    std::chrono::high_resolution_clock::time_point start = std::chrono::high_resolution_clock::now();
    // here the std::chrono::high_resolution_clock::time_point is not that important of a type 
    // and the use of start is very clear from the context
    auto end = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start);

    std::cout << "Execution time: " << duration.count() << " ms" << std::endl;

    return 0;
}


/**
 * 
 * USING EXCEPTIONS
 * 
 */

#include <exception>

class MyException : public std::exception {
public:
    const char* what() const noexcept override {
        return "My custom exception occurred!";
    }
};

