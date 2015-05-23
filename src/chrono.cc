#include <iostream>
#include <chrono>
#include <thread>

int main() {
    auto start = std::chrono::steady_clock::now();
    std::this_thread::sleep_for(std::chrono::seconds(2));
    auto end = std::chrono::steady_clock::now();
    auto elapsed = end - start;
    std::cout << " Elapsed time: " << elapsed.count() << std::endl;
    std::cout << std::endl;
    return 0;
}
