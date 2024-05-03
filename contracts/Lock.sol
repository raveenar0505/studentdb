pragma solidity ^0.8.0;

contract StudentManagement {
    struct Student {
        uint256 id;
        string name;
        uint256 age;
    }

    mapping(uint256 => Student) public students;
    uint256 public studentsCount;

    event StudentAdded(uint256 id, string name, uint256 age);

    function addStudent(string memory _name, uint256 _age) public {
        studentsCount++;
        students[studentsCount] = Student(studentsCount, _name, _age);
        emit StudentAdded(studentsCount, _name, _age);
    }

    function getStudent(uint256 _id) public view returns (uint256, string memory, uint256) {
        return (students[_id].id, students[_id].name, students[_id].age);
    }

    function updateStudent(uint256 _id, string memory _name, uint256 _age) public {
        require(_id <= studentsCount && _id > 0, "Invalid student ID");
        students[_id].name = _name;
        students[_id].age = _age;
    }
}
