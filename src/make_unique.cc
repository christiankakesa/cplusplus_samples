#include <iostream>
#include <memory>
#include <string>

using namespace std::string_literals;

struct Car {
    std::string name;
    std::string model;
    int year;

    Car(std::string n, std::string m, int y): name(n), model(m), year(y) {}
};

int main() {
    auto car = std::make_unique<Car>("Toyota"s, "Yaris"s, 2016);

    std::cout << "[CARS]: " << std::endl;
    std::cout << "  [1]: " << std::endl;
    std::cout << "    => name:  " << car->name << std::endl;
    std::cout << "    => model: " << car->model << std::endl;
    std::cout << "    => year:  " << car->year << std::endl;

    return EXIT_SUCCESS;
}
