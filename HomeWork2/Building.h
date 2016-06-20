#include <string>
class Building
{
public:
	Building(std::string, float, int, float, int);
	Building();
	virtual ~Building();
	float getFloors();
	int getOffices();
	float getEmployees();
	int getWorkingSeats();
	std::string getName();


private:
	std::string name;
	int floors, offices, employes, workingSeats;

};
