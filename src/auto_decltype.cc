#include <iostream>
#include <vector>
#include <string>
#include <algorithm>  // for_each
#include <typeinfo>   // typeid

int main() {
    std::vector <std::string> data{"first", "second", "third"};  // uniform brace notation
    for (const auto item : data) {  // Range based for loop
        std::cout << "Iterate =>" << std::endl;
        std::cout << "  Automatic item type: " << typeid(item).name() << " - Item value: " << item << std::endl;
        decltype(item) dynamic_value = item;
        std::cout << "  Dynamic type: " << typeid(dynamic_value).name() << " - Dynamic value: " << dynamic_value << std::endl;
        std::cout << std::endl;
    }
    return 0;
}
