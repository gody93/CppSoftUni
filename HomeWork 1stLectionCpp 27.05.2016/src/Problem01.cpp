#include <iostream>
#include <string>

#define STRMAXLEN 10 //text lenght limit

using namespace std;

void textToNum() {
	string input;
	cout << "Enter text" << endl;
	cin >> input;
	for (short i = 0; i < input.size(); i++) {
		cout << (short)input[i] << " ";
	}
	cout << endl;
}

void NumToText() {
	short remainingChars = STRMAXLEN;
	char result[STRMAXLEN];
	short currentIndex = 0;
	short currentChar; //number representation of character
	cout << "Enter numbers [32-126]; Enter 0 to end;" << endl;
	while (remainingChars > 0) {
		cout << "Next char (remaining " << remainingChars << ")" << endl;
		cin >> currentChar;
		if ((currentChar >= 32 && currentChar <= 126)) {
			result[currentIndex] = currentChar;
			currentIndex++;
			remainingChars--;
		}
		else if (currentChar == 0) break;
	}
	for (short i = 0; i < STRMAXLEN - remainingChars; i++) { //print the result
		cout << result[i];
	}
	cout << endl;
}

void printMenu() {
	cout << "1. Text to Numbers" << endl;
	cout << "2. Numbers to Text" << endl;
	cout << "3. Exit" << endl;
}

int main() {
	char choice;
	while (true) {
		printMenu();
		cin >> choice;
		switch (choice) {
		case '1': textToNum(); break;
		case '2': NumToText(); break;
		case '3': return 0;
		default: break;
		}
	}
	return 0;
}
