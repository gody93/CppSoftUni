#ifndef TEACHER_H_
#define TEACHER_H_
#include "Person.h"

class Teacher : public Person
{
public:
	Teacher();
	virtual ~Teacher();

	float getSalary() const;
	unsigned short getDays() const;

	void setSalary(float);
	void setDays(unsigned short);

	void getData();
	void setData();
private:
	float salary;
	unsigned short days;
};

#endif /* TEACHER_H_ */
