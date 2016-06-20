#include <iostream>
#include "Person.h"
#include "Student.h"
#include "Teacher.h"

using namespace std;


int main()
{
	Teacher canko;
	canko.setName("canko");
	canko.setCourse(1);
	canko.setSalary(0.33);
	canko.getData();
	return 0;
}
