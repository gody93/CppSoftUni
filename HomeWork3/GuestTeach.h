#ifndef GUESTTEACH_H_
#define GUESTTEACH_H_

#include "Person.h"

class GuestTeach : public Person
{
public:
	GuestTeach();
	virtual ~GuestTeach();

	float getSalary() { return this->courseSalary;}
	void setSalary(float);

	void getData();
	void setData();

private:
	float courseSalary;
};

#endif /* GUESTTEACH_H_ */
