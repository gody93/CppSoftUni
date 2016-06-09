#include <string>
class Building
{
public:
	Building(std::string, int, int, int, int);
	virtual ~Building();
	int getFloors();
	int getOffices();
	int getEmployees();
	int getWorkingSeats();
	std::string getName();


private:
	std::string name;
	int floors, offices, employes, workingSeats;

};
