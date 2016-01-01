#include <iostream>
#include <vector>

int main() {
    const int* p = nullptr;
    std::vector<int> data{0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    for (const auto item : data) {
        p = &item;
        std::cout << "Item pointer: " << *p << std::endl;
    }
    return 0;
}
