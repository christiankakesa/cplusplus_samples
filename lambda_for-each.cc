#include<iostream>
#include<vector>
#include<algorithm>

int main() {
	std::vector<std::string> data{"first", "second", "third"};
	std::string one = "one!!";
	std::string two = "two";
	std::string three = "three";
	std::cout << std::endl;
	// Process data vector with lambda function
	for_each(begin(data), end(data), [one, &two, &three](std::string &item) mutable {
		item  += "_append";
		one   += "_another value now"; // We use "mutable" for variable passed by copy.
		two   += "_two";
		three += "_three";
	});
	// Print data vector after processing
	std::cout << "after:" << std::endl << " - ";
	for (const auto d : data) {
		std::cout << d << " ";
	}
	std::cout << std::endl;
	std::cout << " - one: " << one << " - two: " << two << " - three: " << three;
	std::cout << std::endl;
	return 0;
}
