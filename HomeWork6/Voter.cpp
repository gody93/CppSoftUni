#include "Voter.h"

Voter::Voter(int age,std::string city,std::string ethnos, char gender, std::string name, std::string vote)
{
	setAge(age);
	setCity(city);
	setEthnos(ethnos);
	setGender(gender);
	setName(name);
	setVote(vote);
}

Voter::~Voter()
{
}
int Voter::getAge() const
{
	return age;
}

void Voter::setAge(int age)
{
	this->age = age;
}

const std::string& Voter::getCity() const
{
	return city;
}

void Voter::setCity(const std::string& city)
{
	this->city = city;
}

const std::string& Voter::getEthnos() const
{
	return ethnos;
}

void Voter::setEthnos(const std::string& ethnos)
{
	this->ethnos = ethnos;
}

std::string Voter::getGender() const
{
	return gender;
}

void Voter::setGender(char gender)
{
	if(tolower(gender) == 'm')
	{
		this->gender = "Male";
	}
	else if(tolower(gender) == 'f')
	{
		this->gender = "Female";
	}
	else
	{
		this->gender = "Other";
	}
}

const std::string& Voter::getName() const
{
	return name;
}

void Voter::setName(const std::string& name)
{
	this->name = name;
}

const std::string& Voter::getVote() const
{
	return vote;
}

void Voter::setVote(std::string& vote)
{
	std::transform(vote.begin(),vote.end(),vote.begin(),::tolower);
	this->vote = vote;
}




