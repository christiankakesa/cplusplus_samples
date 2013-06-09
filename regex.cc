#include<iostream>
#include<regex>
#include<string>

int main() {
    const std::string text{R"(christian kakesa christian.kakesa123@example.com ckakesa@domain.com kakesa_c@fr.mylocal-part.com)"};
    static const std::regex my_regex{R"(\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b)"};
    std::smatch my_matches;
    if (std::regex_search(text, my_matches, my_regex)) {
      std::cout << "I found email:" << std::endl;
      std::copy(begin(my_matches),
		end(my_matches),
		std::ostream_iterator<std::string>(std::cout, std::endl));
      std::cout << std::endl;
    } else {
      std::cout << "No email match!!!" << std::endl;
    }
    return 0;
}
