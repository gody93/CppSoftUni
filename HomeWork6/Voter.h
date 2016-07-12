/*
 * Voter.h
 *
 *  Created on: Jul 12, 2016
 *      Author: default
 */

#ifndef HOMEWORK6_VOTER_H_
#define HOMEWORK6_VOTER_H_

#include <iostream>

class Voter
{
public:
	Voter(int,std::string,std::string,char,std::string,std::string);
	virtual ~Voter();


	bool operator<(const Voter&) const; //You have to overload < operator in order to insert custom object into a set

	int getAge() const;
	void setAge(int age);

	const std::string& getCity() const;
	void setCity(const std::string& city);

	const std::string& getEthnos() const;
	void setEthnos(const std::string& ethnos);

	std::string getGender() const;
	void setGender(char gender);

	const std::string& getName() const;
	void setName(const std::string& name);

	const std::string& getVote() const;
	void setVote(const std::string& vote);

private:
	int age;
	std::string name;
	std::string gender;
	std::string city;
	std::string ethnos;
	std::string vote;
};

#endif /* HOMEWORK6_VOTER_H_ */
