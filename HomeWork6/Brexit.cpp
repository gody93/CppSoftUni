/*
 * Brexit.cpp
 *
 *  Created on: Jul 12, 2016
 *      Author: default
 */

#include "Brexit.h"

Brexit::Brexit()
{

}

Brexit::~Brexit()
{

}

void Brexit::start()
{
	std::string secretCode;
	std::cout << "Welcome to the voting system for Brexit! To continue press Enter: ";
	std::cin >> secretCode;

	if(secretCode == "12344321")
	{
		collectorsMenu();
	}
	else
	{
		votersMenu();
	}

}

void Brexit::collectorsMenu()
{
	int choice = -1;
	do
	{
		std::cout << "Congratulations you entered the code correct!\nChoose one of the following: " << std::endl;
		std::cout << "1.Results in percent.\n2.Results by numbers.\n3.Results by age.\n4.Results based on name.\n"
					 "5.Results based on city.\n6.Results based on either age/name/ethnos/gender/city" << std::endl;
		std::cin >> choice;

		switch (choice)
		{
		case 1:

			break;
		default:
			std::cout << "Please enter a valid number";
			break;
		}

	} while (choice != 0);
}

Voter Brexit::votersMenu()
{
	std::string name,city,ethnos,vote;
	int age;
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
	std::cin >> gender;

	std::cin.clear();
	std::cout << "Enter your vote(LEAVE/STAY): ";
	std::cin >> vote;

	Voter user(age,city,ethnos,gender,name,vote);
	std::cout << user.getGender();
	return user;
}
