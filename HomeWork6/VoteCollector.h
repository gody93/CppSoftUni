#ifndef HOMEWORK6_VOTECOLLECTOR_H_
#define HOMEWORK6_VOTECOLLECTOR_H_

#include <vector>
#include <map>
#include <utility>
#include "Voter.h"

class VoteCollector
{
public:
	VoteCollector();
	virtual ~VoteCollector();

	void resultsInPercent(std::vector<Voter> &);
	void resultsInNumbers(std::vector<Voter> &);
	void resultsBasedOnAge(std::vector<Voter> &);

};

#endif /* HOMEWORK6_VOTECOLLECTOR_H_ */
