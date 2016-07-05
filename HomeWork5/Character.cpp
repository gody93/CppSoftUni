/*
 * Character.cpp
 *
 *  Created on: 5.07.2016 г.
 *      Author: Gody
 */

#include "Character.h"

static unsigned charId = 0;

Character::Character()
{
	charId++;
	this->id = charId;
}

Character::Character(std::string charName,int charMass,float charSpeed)
					: name(charName), mass(charMass), jSpeed(charSpeed)
{
	charId++;
	this->id = charId;
}
Character::~Character()
{
}

std::string Character::getName()
{
	return this->name;
}
int Character::getMass()
{
	return this->mass;
}
float Character::getJumpSpeed()
{
	return this->jSpeed;
}
unsigned Character::getID()
{
	return this->id;
}
