#include <iostream>

[[deprecated("You must use the new function void grace()")]] void wrong() {
    std::cout << "Don't use me anymore." << std::endl;
}

void grace() {
    std::cout << "I'm the new one" << std::endl;
}

int main() {
    wrong();
    grace();
    return EXIT_SUCCESS;
}

//[When compiling...]
//g++ -std=c++1y -O2 -static -Wall -Wextra -fno-omit-frame-pointer  -o build/bin/deprecated_attribute src/deprecated_attribute.cc
//src/deprecated_attribute.cc: In function ‘int main()’:
//src/deprecated_attribute.cc:12:5: warning: ‘void wrong()’ is deprecated (declared at src/deprecated_attribute.cc:3): You must use the new function void grace() [-Wdeprecated-declarations]
//     wrong();
//     ^
//src/deprecated_attribute.cc:12:11: warning: ‘void wrong()’ is deprecated (declared at src/deprecated_attribute.cc:3): You must use the new function void grace() [-Wdeprecated-declarations]
//     wrong();
//           ^
