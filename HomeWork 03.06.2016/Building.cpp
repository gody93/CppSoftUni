#include "Building.h"

Building::Building(std::string name, int floors,int offices,int employes,int workingSeats)
{
	this->name = name;
	this->floors = floors;
	this->offices = offices;
	this->employes = employes;
	this->workingSeats = workingSeats;
}

Building::~Building()
{
}

int Building::getEmployees()
{
	return this->employes;
}

int Building::getFloors()
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
