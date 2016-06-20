#include "GuestTeach.h"

GuestTeach::GuestTeach()
{

}

GuestTeach::~GuestTeach()
{
}

void GuestTeach::setSalary(float salary)
{
	this->courseSalary = salary;
}

void GuestTeach::getData()
{
	Person::getData();

	std::cout << "Salary - " << this->courseSalary << std::endl;
}

void GuestTeach::setData()
{
	float salary;

	Person::setData();

	std::cout << "Please enter salary: ";
	std::cin >> salary;
	this->courseSalary = salary;

}
