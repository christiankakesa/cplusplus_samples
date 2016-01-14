#include <iostream>
#include <tuple>

int main() {
    std::tuple<int, std::string, std::string> person(1, "Christian", "Kakesa");

    std::cout << "get<0>(person):   => " << std::get<0>(person) << std::endl;
    std::cout << "get<int>(person): => " << std::get<int>(person) << std::endl;

    std::cout << std::endl;

    // If data index is ambiguous, use numeric position ; look the both std::string
    std::cout << "get<0>(person):id         => " << std::get<0>(person) << std::endl;
    std::cout << "get<1>(person):first_name => " << std::get<1>(person) << std::endl;
    std::cout << "get<2>(person):last_name  => " << std::get<2>(person) << std::endl;
    return EXIT_SUCCESS;
}
