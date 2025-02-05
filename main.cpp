#include <iostream>
#include <string>

std::string hello(const std::string& user);

int main() {
    std::string user;
    std::cout << "Enter your name: ";
    std::getline(std::cin, user);
    
    std::cout << hello(user) << std::endl;
    return 0;
}

std::string hello(const std::string& user) {
    return "Hello, " + user;
}