#include<iostream>//std::cout, std::endl
#include<random>//std::mt19937, std::uniform_int_distribution
#include<functional>//std::bind
#include<ctime>//std::time

std::mt19937 engine;
std::uniform_int_distribution<uint32_t> distribution{1, 10};// uniform brace notation

int main() {
  engine.seed(static_cast<uint32_t>(std::time(nullptr)));
  auto generator = std::bind(distribution, engine);
  uint32_t random = generator();
  std::cout << "1st random: " << random << std::endl;
  random = generator();
  std::cout << "2nd random: " << random << std::endl;
  return 0;
}
