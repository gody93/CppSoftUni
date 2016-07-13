/*
 * VoteCollector.cpp
 *
 *  Created on: Jul 12, 2016
 *      Author: default
 */

#include "VoteCollector.h"

VoteCollector::VoteCollector()
{
	// TODO Auto-generated constructor stub

}

VoteCollector::~VoteCollector()
{
	// TODO Auto-generated destructor stub
}

void VoteCollector::resultsInPercent(std::vector<Voter> &voters)
{
	int peopleVoted = voters.size();
	float pplStay = 0;
	float pplLeave = 0;

	for(int i = 0; i < peopleVoted; i++)
	{
		if(voters.at(i).getVote() == "leave")
		{
			pplLeave++;
		}
		else if(voters.at(i).getVote() == "stay")
		{
			pplStay++;
		}
	}

	float percentLeave = (pplLeave / peopleVoted) * 100;
	float percentStay = (pplStay / peopleVoted) * 100;

	std::cout << "Total people voted: " << peopleVoted << std::endl;
	std::cout << "Percent leave: " << percentLeave << "%\n";
	std::cout << "Percent stay: " << percentStay << "%\n";
}

void VoteCollector::resultsInNumbers(std::vector<Voter>& voters)
{
	int peopleVoted = voters.size();
	float pplStay = 0;
	float pplLeave = 0;

	for(int i = 0; i < peopleVoted; i++)
	{
		if(voters.at(i).getVote() == "leave")
		{
			pplLeave++;
		}
		else if(voters.at(i).getVote() == "stay")
		{
			pplStay++;
		}
	}

	std::cout << "Total people voted: " << peopleVoted << std::endl;
	std::cout << "People voted leave: " << pplLeave << "\n";
	std::cout << "People voted stay: " << pplStay << "\n";
}

void VoteCollector::resultsBasedOnAge(std::vector<Voter>& voters)
{
	std::map<int,int> ageVoters;
	std::map<int,int>::iterator hasAge = ageVoters.begin();

	for(unsigned i = 0; i < voters.size(); i++)
	{
		if(ageVoters.find( voters.at(i).getAge() ) != ageVoters.end() )
		{
			hasAge->second++;
			hasAge++;
		}
		else
		{
			ageVoters.insert(std::pair<int,int>(voters.at(i).getAge(),1));
//			hasAge->first = voters.at(i).getAge();
//			hasAge->second++;
			hasAge++;
		}
	}

	for(std::map<int,int>::iterator it = ageVoters.begin(); it != ageVoters.end(); it++)
	{
		std::cout << it->first << " years -- " << it->second << " voters.";
	}
}




