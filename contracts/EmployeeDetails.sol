// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //version to be used

contract EmployeeDetails { //name od the contract
    struct Employee { //the structure of the contract
        string name;
        uint age;
        string position;
    }

    mapping(uint => Employee) public employees; //Mapping an index which is unsigned int to an instance of Employee struct 


    //following are the functions for setting, getting, updating the employees
    function setEmployee(uint _id, string memory _name, uint _age, string memory _position) public { // we use memory for data that are dynamically sized
        employees[_id] = Employee(_name, _age, _position); //assigning a struct
    }

    function getEmployee(uint _id) public view returns (string memory, uint, string memory) { //what it  should return is also given, and the view keyword tells that it simply reads and doesnt modify the blockchain
        Employee memory employee = employees[_id]; // the data retrieved is stored in the memory rather than the storage as storage is a persistent one and costs more to change than memory
        return (employee.name, employee.age, employee.position);
    }

    function updateEmployee(uint _id, string memory _name, uint _age, string memory _position) public {
        require(bytes(employees[_id].name).length != 0, "Employee does not exist");
        // require makes the transaction atomic, 
        employees[_id] = Employee(_name, _age, _position);
    }
}
