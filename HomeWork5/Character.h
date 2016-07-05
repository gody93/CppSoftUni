#ifndef HOMEWORK5_CHARACTER_H_
#define HOMEWORK5_CHARACTER_H_

#include <iostream>
class Character
{
public:
	Character();
	Character(std::string,int,float);
	virtual ~Character();

	std::string getName();
	int getMass();
	float getJumpSpeed();
	unsigned getID();

private:
	std::string name;
	int mass;
	float jSpeed;
	unsigned id;
};

#endif /* HOMEWORK5_CHARACTER_H_ */
