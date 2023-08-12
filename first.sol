// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract register {

    address payable manager = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    // student's info
    struct StudentInfo {
        address payable addres;
        string name;
        uint schoolNumber;
        string className;
        uint balance;
    }

    StudentInfo[] public studentInfo;

    mapping (address => StudentInfo) getNameWithAddress;

    modifier notTheManager() {
        require(msg.sender != manager, "not the manager");
        _;
    }

    // register students
    function registerStudent(address payable _adres, string memory _name, uint _schoolNumber, string memory _className, uint _balance) public notTheManager {
        studentInfo.push(StudentInfo(payable (_adres), _name, _schoolNumber, _className, _balance));
        getNameWithAddress[_adres] = studentInfo[_schoolNumber];
    }

    // view the student's info
    function viewStudent(uint _schoolNumber) public view returns(StudentInfo memory) {
        return studentInfo[_schoolNumber];
    }

    function changeTheName(uint _schoolNumber, string memory newName) public {
        studentInfo[_schoolNumber].name = newName;
    }

    function changeTheSchoolNumber(uint _schoolNumber, uint newSchoolNumber) public {
        studentInfo[_schoolNumber].schoolNumber = newSchoolNumber;
    }

    function changeTheClassName(uint _schoolNumber, string memory newClassName) public {
        studentInfo[_schoolNumber].className = newClassName;
    }

    // delete student
    function deleteStudent(uint _schoolNumber) public {
        delete studentInfo[_schoolNumber];
    }

}