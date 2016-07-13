#include "Brexit.h"

Brexit::Brexit()
{

}

Brexit::~Brexit()
{

}

void Brexit::start()
{
	int secretCode;
	do
	{
		std::cout << "Welcome to the voting system for Brexit!Enter 1 to continue or 0 to exit: ";
		std::cin >> secretCode;
		if(secretCode == 12344321)
		{
			collectorsMenu(voters);
		}
		else if(secretCode != 0)
		{
			voters.push_back(votersMenu());
			continue;
		}

	}while(secretCode != 0 );

}

void Brexit::collectorsMenu(std::vector<Voter> &voters)
{
	VoteCollector stamat;
	int choice = -1;
	std::cout << "Congratulations you entered the code correct!\n";
	do
	{
		std::cout << "\nChoose one of the following(Enter 0 to go back to main menu): " << std::endl;
		std::cout << "1.Results in percent.\n2.Results by numbers.\n3.Results by age.\n4.Results based on name.\n"
					 "5.Results based on city.\n6.Results based on either age/name/ethnos/gender/city" << std::endl;
		std::cin >> choice;

		switch (choice)
		{
		case 1:
			stamat.resultsInPercent(voters);
			break;
		case 2:
			stamat.resultsInNumbers(voters);
			break;
		case 3:
			stamat.resultsBasedOnAge(voters);
			break;
		default:
			std::cout << "Please enter a valid number\n";
			break;
		}

	} while (choice != 0);
}

Voter Brexit::votersMenu()
{
	std::string name,city,ethnos,vote;
	int age;
	std::string genderInput; // Couldn't figure out how to bypass if user enters more than one char, so I get the first char of this string ^^
	char gender;
	std::cout << "Enter your name: ";
	std::cin >> name;
	std::cout << "Enter your city: ";
	std::cin >> city;
	std::cout << "Enter your ethnos: ";
	std::cin >> ethnos;
	std::cout << "Enter your age: ";
	std::cin  >> age;
	std::cout << "Enter your gender: ";
	std::cin >> genderInput;
	gender = genderInput[0];
	std::cout << "Enter your vote(LEAVE/STAY): ";
	std::cin >> vote;

	Voter user(age,city,ethnos,gender,name,vote);
	return user;
}



























