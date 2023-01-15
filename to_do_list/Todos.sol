// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./StructDeclaration.sol";


contract Todos {
    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo(_text, false));
    }

    function get(uint _index) public view returns(string memory text, bool isCompleted) {
        Todo storage todo = todos[_index];
        return (todo.text, todo.isCompleted);
    }

    function updateText(uint _index, string calldata _text) public {
        todos[_index].text = _text;
    }

    function completeToggle(uint _index) public {
        Todo storage todo = todos[_index];
        todo.isCompleted = !todo.isCompleted;
    }
}