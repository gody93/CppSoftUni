#include <iostream>
#include <iomanip>
#include "Calculations.h"
#include "Character.h"
#include "Environment.h"

static const float EARTH_GRAVITY = 9.81;

using namespace Calculator;

int main()
{
	Character person("Pesho",10,5.2);
	Environment Earth(EARTH_GRAVITY,"Earth");
	Calculations calculator(Earth);

	std::cout << "The max height on " << Earth.getName() << " that " << person.getName() << " can jump is: "
			  << std::setprecision(3) << calculator.maxJumpHeight(person) << "m" << std::endl;

	std::cout << "The air time on " << Earth.getName() << " of " << person.getName() << " is: "
				  << std::setprecision(3) << calculator.airTime(person) << "s" << std::endl;

	float height;
	std::cout << "Enter height: ";
	std::cin >> height;

	if(calculator.canItJump(person,height))
	{
		std::cout << "On " << Earth.getName() << person.getName() << " can jump "
				  << std::setprecision(3) << height << "m" << std::endl;
	}
	else
	{
		std::cout << "On " << Earth.getName() << " " << person.getName() << " cannot jump "
						   << std::setprecision(3) << height << "m" << std::endl;
	}


	return 0;
}
