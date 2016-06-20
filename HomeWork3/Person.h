#ifndef PERSON_H_
#define PERSON_H_

#include <iostream>
#include <string>

class Person
{
public:
	Person();
	virtual ~Person();

	unsigned short getId(){ return this->id; };
	std::string getName(){ return this->name; };
	unsigned short getCourse(){ return this->currCourse; };

	void setId(unsigned short);
	void setName(std::string);
	void setCourse(unsigned short);

	virtual void setData();
	virtual void getData();

	bool isInUse();
	void setUse();
protected:
	unsigned short currCourse;


private:
	bool inUse;
	unsigned short id;
	std::string name;
};

#endif /* PERSON_H_ */
