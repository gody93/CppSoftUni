#include "Environment.h"

Environment::Environment(float envGravity, std::string newName) : gravity(envGravity), name(newName)
{
}

Environment::~Environment()
{
}


std::string Environment::getName()
{
	return this->name;
}
float Environment::getGravity()
{
	return this->gravity;
}
