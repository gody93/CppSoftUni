/*
 * VoteCollector.h
 *
 *  Created on: Jul 12, 2016
 *      Author: default
 */

#ifndef HOMEWORK6_VOTECOLLECTOR_H_
#define HOMEWORK6_VOTECOLLECTOR_H_

#include <vector>
#include <map>
#include "Voter.h"

class VoteCollector
{
public:
	VoteCollector();
	virtual ~VoteCollector();

	void resultsInPercent(std::vector<Voter> &);
	void resultsInNumbers(std::vector<Voter> &);
	void resultsBasedOnAge(std::vector<Voter> &);
private:

};

#endif /* HOMEWORK6_VOTECOLLECTOR_H_ */
