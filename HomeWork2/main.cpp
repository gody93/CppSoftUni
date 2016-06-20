#include <iostream>
#include "Building.h"

void menu(Building[]);

void mostEmployees(Building,Building,Building);

void mostFreeSeats(Building,Building,Building);

void highestCoef(Building,Building,Building);

void mostPplPerFloor(Building,Building,Building);

void leastPplPerFloor(Building,Building,Building);

void mostOfficesPerFloor(Building,Building,Building);

void leastOfficesPerFloor(Building,Building,Building);

void mostPplPerOffice(Building,Building,Building);

void leastPplPerOffice(Building,Building,Building);


int main ()
{
	Building BusinesPark[3];

				//name,floors,offices,employees,free seats

	Building XYZ("XYZ",6.0,127,600.0,196);
	Building RPD("Rapid Development Crew",7.0,210,822.0,85);
	Building ASD("SoftUni",11.0,106,200.0,60);

	BusinesPark[0] = XYZ;
	BusinesPark[1] = RPD;
	BusinesPark[2] = ASD;

	menu(BusinesPark);
	return 0;
}

void menu(Building park[])
{
	int choice = -1;

	do
	{
		std::cout << "\nChoose one of the following(press 0 for exit): \n1.Most employees\n2.Most free working seats\n3.Highest coef. employees"
				  << "\n4.Most people per floor\n5.Least people per floor\n6.Most offices per floor\n7.Least offices per floor\n8.Most people per office"
				  << "\n9.Least people per office\n";
		std::cin >> choice;

		switch(choice)
		{
			case 0:
				break;
			case 1:
				mostEmployees(park[0],park[1],park[2]);
				break;
			case 2:
				mostFreeSeats(park[0],park[1],park[2]);
				break;
			case 3:
				highestCoef(park[0],park[1],park[2]);
				break;
			case 4:
				mostPplPerFloor(park[0],park[1],park[2]);
				break;
			case 5:
				leastPplPerFloor(park[0],park[1],park[2]);
				break;
			case 6:
				mostOfficesPerFloor(park[0],park[1],park[2]);
				break;
			case 7:
				leastOfficesPerFloor(park[0],park[1],park[2]);
				break;
			case 8:
				mostPplPerOffice(park[0],park[1],park[2]);
				break;
			case 9:
				leastPplPerOffice(park[0],park[1],park[2]);
				break;
			default:
				std::cout << "Please enter a valid number";
				break;
		}

	}while(choice != 0);

}

void mostEmployees(Building one, Building two, Building three)
{
	float mostPeople = one.getEmployees();
	std::string buildName = one.getName();

	if(two.getEmployees() > mostPeople)
	{
		mostPeople = two.getEmployees();
		buildName = two.getName();
	}

	if(three.getEmployees() > mostPeople)
	{
		mostPeople = three.getEmployees();
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with most employees is: " << buildName << ": " << mostPeople << " employees\n\n";
}

void mostFreeSeats(Building one,Building two,Building three)
{
	float mostFreeSeats = one.getWorkingSeats();
	std::string buildName = one.getName();

	if (two.getWorkingSeats() > mostFreeSeats)
	{
		mostFreeSeats = two.getWorkingSeats();
		buildName = two.getName();
	}

	if (three.getWorkingSeats() > mostFreeSeats)
	{
		mostFreeSeats = three.getWorkingSeats();
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with most free seats is: " << buildName<< ": " << mostFreeSeats << " working seats\n\n";;

}

void highestCoef(Building one, Building two, Building three)
{
	float highestConf = one.getEmployees() + one.getWorkingSeats();
	std::string buildName = one.getName();

	if( (two.getEmployees()  + two.getWorkingSeats()) > highestConf)
	{
		highestConf = two.getEmployees()  + two.getWorkingSeats();
		buildName = two.getName();
	}

	if( (three.getEmployees() + three.getWorkingSeats()) > highestConf)
	{
		highestConf = three.getEmployees() + three.getWorkingSeats();
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with highest coefficient employees is: " << buildName;
}

void mostPplPerFloor(Building one, Building two, Building three)
{
	float mostPeople = (one.getFloors() / one.getEmployees());
	std::string buildName = one.getName();

	if(mostPeople < (two.getFloors() / two.getEmployees() ))
	{
		mostPeople = (two.getFloors() / two.getEmployees());
		buildName = two.getName();
	}

	if (mostPeople < (three.getFloors() / three.getEmployees() ))
	{
		mostPeople = (three.getFloors() / three.getEmployees());
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with most people per floor is: " << buildName << ": " << mostPeople << " people per floor\n\n";;
}

void leastPplPerFloor(Building one, Building two, Building three)
{
	float leastPeople = (one.getFloors() / one.getEmployees());
	std::string buildName = one.getName();

	if(leastPeople > (two.getFloors() / two.getEmployees() ))
	{
		leastPeople = (two.getFloors() / two.getEmployees());
		buildName = two.getName();
	}

	if (leastPeople > (three.getFloors() / three.getEmployees() ))
	{
		leastPeople = (three.getFloors() / three.getEmployees());
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with least people per floor is: " << buildName << ": " << leastPeople << " people per floor\n\n";;
}

void mostOfficesPerFloor(Building one, Building two, Building three)
{
	float mostOffices = (one.getOffices() / one.getEmployees());
	std::string buildName = one.getName();

	if(mostOffices < (two.getOffices() / two.getEmployees() ))
	{
		mostOffices = (two.getOffices() / two.getEmployees());
		buildName = two.getName();
	}

	if (mostOffices < (three.getOffices() / three.getEmployees() ))
	{
		mostOffices = (three.getOffices() / three.getEmployees());
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with most offices per floor is: " << buildName << ": " << mostOffices << " offices per floor\n\n";;
}

void leastOfficesPerFloor(Building one, Building two, Building three)
{
	float leastOffices = (one.getOffices() / one.getEmployees());
	std::string buildName = one.getName();

	if(leastOffices > (two.getOffices() / two.getEmployees() ))
	{
		leastOffices = (two.getOffices() / two.getEmployees());
		buildName = two.getName();
	}

	if (leastOffices > (three.getOffices() / three.getEmployees() ))
	{
		leastOffices = (three.getOffices() / three.getEmployees());
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with least offices per floor is: " << buildName << ": " << leastOffices << " offices per floor\n\n";;
}

void mostPplPerOffice(Building one, Building two, Building three)
{
	float mostPeople = (one.getOffices() / one.getEmployees());
	std::string buildName = one.getName();

	if(mostPeople < (two.getOffices() / two.getEmployees() ))
	{
		mostPeople = (two.getOffices() / two.getEmployees());
		buildName = two.getName();
	}

	if (mostPeople < (three.getOffices() / three.getEmployees() ))
	{
		mostPeople = (three.getOffices() / three.getEmployees());
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with most people per office is: " << buildName << ": " << mostPeople << " people per office\n\n";;
}

void leastPplPerOffice(Building one, Building two, Building three)
{
	float leastPeople = (one.getOffices() / one.getEmployees());
	std::string buildName = one.getName();

	if(leastPeople > (two.getOffices() / two.getEmployees() ))
	{
		leastPeople = (two.getOffices() / two.getEmployees());
		buildName = two.getName();
	}

	if (leastPeople > (three.getOffices() / three.getEmployees() ))
	{
		leastPeople = (three.getOffices() / three.getEmployees());
		buildName = three.getName();
	}

	std::cout << "\n\nThe building with least people per office is: " << buildName << ": " << leastPeople << " people per office\n\n";;
}






















