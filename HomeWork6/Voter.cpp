/*
 * Voter.cpp
 *
 *  Created on: Jul 12, 2016
 *      Author: default
 */

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

void Voter::setVote(const std::string& vote)
{
	this->vote = vote;
}

//We predefine this operator, so even if there's a change in one parameter only it gets pushed back in the set.
bool Voter::operator<(const Voter& v) const
{
	if(age < v.age && city[0] < v.city[0] && ethnos[0] < v.ethnos[0] &&
	   gender < v.gender && name[0] < v.name[0] && vote[0] < v.vote[0] )
	{
		return age;
	}
	return v.age;
}





