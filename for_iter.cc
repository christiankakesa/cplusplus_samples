#include<iostream>
#include<vector>
#include<string>

int main() {
  std::vector<std::string> data{"first", "second", "third"};//uniform brace notation
  for(const auto item : data) {
    std::cout << "Item value: " << item << std::endl;
  }  
  return 0;
}
