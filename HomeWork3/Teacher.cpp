#include "Teacher.h"

Teacher::Teacher()
{

}

Teacher::~Teacher()
{
}

void Teacher::setSalary(float salary)
{
	this->salary = salary;
}
void Teacher::setDays(unsigned short days)
{
	this->days = days;
}
void Teacher::setData()
{
	float salary;
	unsigned short days;

	Person::setData();

	std::cout << "Please enter salary: ";
	std::cin >> salary;
	this->salary = salary;

	std::cout << "Please enter days: ";
	std::cin >> days;
	this->days = days;

}

void Teacher::getData()
{
	Person::getData();

	std::cout << "Salary - " << this->salary << std::endl;
	std::cout << "Days - " << this->days << std::endl;
}
