#include <iostream>
#include <fstream>
#include <string>
#include <vector>

// takes in an ifstream and counts the number of lines, returns the number of lines (an int)
int countLines(std::ifstream &file, std::string fileName) {
	std::string _;
	int numLines = 0;
	while (std::getline(file, _)) {
		++numLines;
	}
	return numLines;
}

std::vector<std::string> createArray(int numLines, std::ifstream &file, std::string fileName) {
	std::vector<std::string> vec;
	std::string _;
	std::string str;
	for(int i = 0; i < numLines; i++) {
		file >> str;
		vec.push_back(str);
	}
	return vec;
}

// main func, do file io here also
int main(int argc, char** argv) {

	// get file name
	std::cout << "Please enter file name: " << std::endl;
	std::string fileName;
	std::cin >> fileName;
	std::ifstream myFile;

	myFile.open(fileName);
	int numLines = countLines(myFile, fileName);
	std::cout << numLines << std::endl;
	myFile.close();

	myFile.open(fileName);
	std::vector<std::string> arr = createArray(numLines, myFile, fileName);
	myFile.close();

	for(int i = 0; i < arr.size(); i++) {
		std::cout << arr[i] << std::endl;
	}

	myFile.close();
	return 1;
	
}