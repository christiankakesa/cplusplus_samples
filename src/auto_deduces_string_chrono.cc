#include <iostream>
#include <chrono>

int main() {
    using namespace std::string_literals;
    auto str = "auto deduced string"s;
    std::cout << "[STRING]: " << str << std::endl;

    using namespace std::chrono_literals;
    auto hour   = 24h;
    auto minute = 60min;
    auto second = 30s;
    auto milli  = 100ms;
    auto micro  = 200us;
    auto nano   = 300ns;
    std::cout << "[HOUR  ]: " << hour.count()   << "  hours" << std::endl;
    std::cout << "[MINUTE]: " << minute.count() << "  minutes" << std::endl;
    std::cout << "[SECOND]: " << second.count() << "  seconds" << std::endl;
    std::cout << "[MILLI ]: " << milli.count()  << " milliseconds" << std::endl;
    std::cout << "[MICRO ]: " << micro.count()  << " microseconds" << std::endl;
    std::cout << "[NANO  ]: " << nano.count()   << " nanoseconds" << std::endl;
    return EXIT_SUCCESS;
}
