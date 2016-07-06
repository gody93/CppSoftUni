#ifndef HOMEWORK5_CALCULATIONS_H_
#define HOMEWORK5_CALCULATIONS_H_

#include "Character.h"
#include "Environment.h"
#include <iostream>
namespace Calculator
{
	class Calculations
	{
	public:
		Calculations(Environment&);
		virtual ~Calculations();

		float maxJumpHeight(Character&);
		float airTime(Character&);
		bool canItJump(Character&,float);
	private:
		Environment environment;
	};
}

#endif /* HOMEWORK5_CALCULATIONS_H_ */
