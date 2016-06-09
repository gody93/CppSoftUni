#include <iostream>
#include "Building.h"

int main ()
{
  Building SoftUni ("Softuni",10,5,6,7);

  std::cout	<< SoftUni.getEmployees() << " " << SoftUni.getFloors() << " " << SoftUni.getName() << " " << SoftUni.getWorkingSeats();
  return 0;
}

