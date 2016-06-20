#include "Student.h"

Student::Student()
{
}

Student::~Student()
{

}
void Student::setPoints(int points)
{
	bool isValid = false;
	do
	{
		if (points >= 0 || points <= 100)
		{
			this->currPoints = points;
			isValid = true;
		}
		else
		{
			std::cout << "Please enter a number from 0 to 100" << std::endl;
		}
	}
	while(isValid);
}
void Student::setMark(float mark)
{
	if(this->currCourse == 1)
	{
		this->avgMark = 0;
	}
	else
	{
		this->avgMark = mark;
	}
}
const float Student::getMark()
{
	return this->avgMark;
}

const int Student::getPoints()
{
	return this->currPoints;
}
void Student::setData()
{
	Person::setData();
	int points;
	float mark;

	std::cout << "Please enter points: ";
	std::cin >> points;
	this->currPoints = points;

	std::cout << "Please enter mark: ";
	std::cin >> mark;
	this->avgMark = mark;
}
void Student::getData()
{
	Person::getData();

	std::cout << "Points - " << this->currPoints << std::endl;
	std::cout << "Marks - " << this->avgMark << std::endl;

}
