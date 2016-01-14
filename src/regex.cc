#include <iostream>
#include <iterator>
#include <regex>
#include <string>

inline void print_with_padding(const std::string &text, const size_t padding = 8, const char mark = ' ') {
  std::string tmp = "";
  std::cout << tmp.insert(0, padding, mark) << text << std::endl;
}

inline void regex_search_all(const std::string &text, const std::regex &re) {
    std::string tmp = text;
    std::smatch my_matches;
    std::cout << "[I found all emails]" << std::endl;
    while (std::regex_search(tmp, my_matches, re)) {
      print_with_padding(my_matches[0]);
      tmp = tmp.substr(my_matches.position() + my_matches.length());
    }
}

int main() {
    std::string text{
            R"(christian kakesa christian.kakesa123@example.com ckakesa@domain.com kakesa_c@fr.mylocal-part.com)"};
    std::cout << "[Initial text]: \"" << text << "\"" << std::endl;
    std::cout << std::endl;
    try {
        static const std::regex my_regex{R"(\b([a-zA-Z0-9._%+-]+)(@)([a-zA-Z0-9.-]+\.[a-zA-Z]{2,6})\b)",
                                         std::regex_constants::icase};
        std::smatch my_matches;
        if (std::regex_search(text, my_matches, my_regex)) {
            std::cout << "[I found an email]" << std::endl;
        print_with_padding(my_matches[0]);
        } else {
            std::cout << "[No email match!!!]" << std::endl;
        }
        // Find all emails in a string
        regex_search_all(text, my_regex);
    } catch (const std::regex_error &e) {
        std::cout << "Code: " << e.code() << " - Message: " << e.what() << std::endl;
    }
    return 0;
}
