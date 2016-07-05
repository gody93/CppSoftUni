#include <iostream>
#include <iomanip>
#include "Calculations.h"
#include "Character.h"
#include "Environment.h"

static const float EARTH_GRAVITY = 9.81;

int main()
{
	Character person("Pesho",10,5.2);
	Environment Earth(EARTH_GRAVITY,"Earth");
	Calculations calculator(Earth);

	std::cout << "The max height on " << Earth.getName() << " that " << person.getName() << " can jump is: "
			  << std::setprecision(3) << calculator.maxJumpHeight(person) << "m" << std::endl;

	std::cout << "The air time on " << Earth.getName() << " of " << person.getName() << " is: "
				  << std::setprecision(3) << calculator.airTime(person) << "s" << std::endl;


	return 0;
}
