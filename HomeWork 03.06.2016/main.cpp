#include <iostream>
#include "Building.h"

void menu()
{
	int choice = -1;

	do
	{
		std::cout << "Choose one of the following(press 0 for exit): \n 1.Most employees";
		std::cin >> choice;

		switch(choice)
		{
			case 0:
				break;
			case 1:
				std::cout <<"EHEHEH"<< std::endl;
			default:
				break;
		}

	}while(choice != 0);

}

int main ()
{
	Building BusinesPark[3];
	Building XYZ("XYZ",6,127,600,196);
	Building RPD("Rapid Development Crew",8,210,822,85);
	Building ASD("SoftUni",11,106,200,60);

	BusinesPark[0] = XYZ;
	BusinesPark[1] = RPD;
	BusinesPark[2] = ASD;

	menu();
	return 0;
}

