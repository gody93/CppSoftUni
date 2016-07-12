/*
 * Brexit.h
 *
 *  Created on: Jul 12, 2016
 *      Author: default
 */
#include <iostream>
#include <set>
#include "Voter.h"
#include "VoteCollector.h"

#ifndef HOMEWORK6_BREXIT_H_
#define HOMEWORK6_BREXIT_H_


class Brexit
{
public:
	Brexit();
	virtual ~Brexit();

	void start();
private:

	std::set<Voter> voters;
};

#endif /* HOMEWORK6_BREXIT_H_ */
