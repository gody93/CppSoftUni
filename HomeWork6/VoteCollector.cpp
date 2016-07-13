#include "VoteCollector.h"

VoteCollector::VoteCollector()
{
}

VoteCollector::~VoteCollector()
{
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
	std::map<int,std::pair<int,int>> ageVoters;
	std::map<int,std::pair<int,int>>::iterator hasAge = ageVoters.begin();


	for(unsigned i = 0; i < voters.size(); i++)
	{
		if(ageVoters.find( voters.at(i).getAge() ) != ageVoters.end() )
		{
			if(voters.at(i).getVote() == "leave")
			{
				hasAge->second.first++;
			}
			else if(voters.at(i).getVote() == "stay")
			{
				hasAge->second.second++;
			}
			hasAge++;
		}
		else
		{
			if(voters.at(i).getVote() == "leave")
			{
				ageVoters.insert(std::make_pair(voters.at(i).getAge(),std::make_pair(1,0)));
			}
			else if(voters.at(i).getVote() == "stay")
			{
				ageVoters.insert(std::make_pair(voters.at(i).getAge(),std::make_pair(0,1)));
			}
			hasAge++;
		}
	}

	for(std::map<int,std::pair<int,int>>::iterator it = ageVoters.begin(); it != ageVoters.end(); it++)
	{
		std::cout << it->first << " years -- " << it->second.first << " leave.\t" << it->second.second << " stay\n";
	}
}


