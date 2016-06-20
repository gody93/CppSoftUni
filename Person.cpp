#include "Person.h"

Person::Person()
{
}
Person::~Person()
{

}
void Person::setId(unsigned short id)
{
	this->id = id;
}

void Person::setName(std::string name)
{
	this->name = name;
}

void Person::setCourse(unsigned short course)
{
	this->currCourse = course;
}

void Person::setData()
{
	unsigned short id;
	std::string name;
	unsigned short course;

	std::cout << "Please enter id: ";
	std::cin >> id;
	this->id = id;

	std::cout << "Please enter name: ";
	std::cin >> name;
	this->name = name;

	std::cout << "Please enter course: ";
	std::cin >> course;
	this->currCourse = course;
}

void Person::getData()
{
	std::cout << "Name - " << this->name << std::endl;
	std::cout << "Id - " << this->id << std::endl;
	std::cout << "Course - " << this->currCourse << std::endl;
}
