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
//	int choice = -1;
//
//	do
//	{
//		std::cout
//				<< "";
//		std::cin >> choice;
//
//		switch (choice)
//		{
//		case 1:
////			Voter user1(18,"Sofia","Caucasian",'m',"Pesho","Leave");
////			voters.insert(user1);
//			break;
//		default:
//			std::cout << "Please enter a valid number";
//			break;
//		}
//
//	} while (choice != 0);

	Voter user1(18,"Sofia","Caucasian",'m',"Pesho","Leave");
	voters.insert(user1);
	Voter user2(19,"Sofi","Caucasian",'m',"Pesho","Leave");
	voters.insert(user2);
	std::set<Voter>::iterator it = voters.begin();

	std::cout << it->getCity() << std::endl;
	it++;
	std::cout << it->getCity() << std::endl;
}
