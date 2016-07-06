/*
 * Calculations.cpp
 *
 *  Created on: 5.07.2016 г.
 *      Author: Gody
 */

#include "Calculations.h"
using namespace Calculator;
Calculations::Calculations(Environment &newEnv) : environment(newEnv)
{
}

Calculations::~Calculations()
{
}

float Calculations::maxJumpHeight(Character &object)
{
	float gravity =  2 * environment.getGravity() ;
	int jumpSpeed =  object.getJumpSpeed() * object.getJumpSpeed() ;

	float maxHeight = jumpSpeed / gravity;

	return maxHeight;
}

float Calculations::airTime(Character &object)
{
	float airTime = ( object.getJumpSpeed() / environment.getGravity() ) * 2;

	return airTime;
}

bool Calculations::canItJump(Character &object,float height)
{
	if(maxJumpHeight(object) >= height)
	{
		return true;
	}
	return false;
}
