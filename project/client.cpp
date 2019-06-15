#include <iostream>

int main() {
    std::cout << "This is a client!" << std::endl;
    
    std::cerr << "Client: Reading from WD..." << std::endl;

    std::string str;    
    std::cin >> str;
    std::cerr << "Client: WD said: " << str << std::endl;
}
