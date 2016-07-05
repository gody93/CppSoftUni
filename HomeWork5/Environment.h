#ifndef HOMEWORK5_ENVIRONMENT_H_
#define HOMEWORK5_ENVIRONMENT_H_

#include <iostream>
class Environment
{
public:
	Environment(float,std::string);
	virtual ~Environment();

	std::string getName();
	float getGravity();

private:
	std::string name;
	float gravity;
};

#endif /* HOMEWORK5_ENVIRONMENT_H_ */
