#include <iostream>
#include <typeinfo>

auto deduce_return(float param) {
    return param * 3.14;
}

int main() {
    float f{42.42};
    auto output = deduce_return(f);
    std::cout << "return type deduction: " << output << " - declared type: " << typeid(output).name() << std::endl;
    return EXIT_SUCCESS;
}
