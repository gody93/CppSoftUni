#ifndef STUDENT_H_
#define STUDENT_H_
#include "Person.h"

class Student : public Person
{
public:
	Student();
	virtual ~Student();

	const int getPoints();
	const float getMark();

	void setPoints(int);
	void setMark(float);

	void getData();
	void setData();
protected:
	int currPoints;
	float avgMark;
};

#endif /* STUDENT_H_ */
