#include<iostream>
#include<string>
#include<sstream>
#include<vector>

struct Version {
  uint32_t major;
  uint32_t minor;
  uint32_t revision;
  
  std::string toString(void) {
    std::ostringstream oss;
    oss << major << "." << minor << "." << revision;
    return oss.str();
  }
};

int main() {
  Version v{0, 1, 0};
  std::cout << "Version v{0, 1, 0}: " << v.toString() << std::endl;
  std::vector<Version> vArray{{0, 1, 0}, {0, 1, 1}, {0, 1, 2}};
  std::cout << "std::vector<Version> vArray{{0, 1, 0}, {0, 1, 1}, {0, 1, 2}}: " << std::endl;
  for (auto v : vArray) {
    std::cout << "  " << v.toString() << std::endl;
  }
  return 0;
}
