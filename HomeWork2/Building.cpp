#include "Building.h"

Building::Building(std::string name, float floors,int offices,float employes,int workingSeats)
{
	this->name = name;
	this->floors = floors;
	this->offices = offices;
	this->employes = employes;
	this->workingSeats = workingSeats;
}
Building::Building()
{

}

Building::~Building()
{
}

float Building::getEmployees()
{
	return this->employes;
}

float Building::getFloors()
{
	return this->floors;
}

std::string Building::getName()
{
	return this->name;
}

int Building::getWorkingSeats()
{
	return this->workingSeats;
}

int Building::getOffices()
{
	return this->offices;
}
