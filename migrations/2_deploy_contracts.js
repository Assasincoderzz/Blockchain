const EmployeeDetails = artifacts.require("EmployeeDetails"); //imports the compiled contract

module.exports = function(deployer) { // migrating a function/contract from the compiled form to the blockchain using the module function present in truffle migration system
  deployer.deploy(EmployeeDetails); // tells truffle to export this contract to the BC
};

// the reason the file name is like that is because the files are executed in numerical order. when `truffle migrate` is run, it follows the same numerical order