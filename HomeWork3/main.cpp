#include <iostream>
#include "Person.h"
#include "Student.h"
#include "Teacher.h"
#include "GuestTeach.h"

#include <vector>

using namespace std;

void menu();

void checkVector(vector<Person>,unsigned short);

Person addPerson(int);

int main()
{
	menu();

//Здравей, задачата не работи пълноценно, тъй като не можах да я доизмисля и изкарва датата само на базовия клас :/
//И не съм правил валидация на данните, така че ако не искаш да влезеш в while(true) въведи коректни данни. Съжалявам че е недовършена :/ Успех :D :D
// Ако след като я разгледаш имаш препоръки, очаквам feedback ! :)
	return 0;
}

void menu()
{
	int choice = -1;

	vector<Person> people;
	do
	{
		unsigned short id;
		std::cout
				<< "\nChoose one of the following(press 0 for exit): \n1.Get student data with ID\n2.Get teacher data with ID\n3.Get guest teacher data with ID"
				<< "\n4.Add new student data\n5.Add new teacher data\n6.Add new guest teacher data\n";
		std::cin >> choice;

		switch (choice)
		{
		case 0:
			break;
		case 1:
		case 2:
		case 3:
			cout << "\nEnter ID: ";
			cin >> id;
			checkVector(people,id);
			break;
		case 4:
		case 5:
		case 6:
			people.push_back(addPerson(choice));
			break;
		default:
			std::cout << "Please enter a valid number";
			break;
		}

	} while (choice != 0);

}

void checkVector(vector<Person> givenVector, unsigned short id)
{
	Person randomGuy;
	if(givenVector.size() < 1)
	{
		std::cout << "No person with that ID\n";
	}
	else
	{
		for(std::vector<Person>::iterator it = givenVector.begin(); it != givenVector.end(); it++)
		{
			if(it->getId() == id)
			{
				randomGuy = *it;
				randomGuy.setUse();
				break;
			}
		}
		if(!randomGuy.isInUse())
		{
			std::cout << "No person with that ID\n";
		}
		else
		{
			randomGuy.getData();
		}
	}

}

Person addPerson(int type)
{
	switch(type - 3)
	{
		case 1:
		{
			Student guy;
			guy.setData();
			return guy;
		}
		break;

		case 2:
		{
			Teacher teach;
			teach.setData();
			return teach;

		}
		break;
		case 3:
		{
			GuestTeach gTeach;
			gTeach.setData();
			return gTeach;
		}
		break;
		default:
			break;
	}
}




