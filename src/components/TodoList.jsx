import React from 'react'

function TodoList({ todos, onToggle, onDelete }) {
  return (
    <ul className="todo-list">
      {todos.map(todo => (
        <li
          key={todo.id}
          className={`todo-item ${todo.completed ? 'completed' : ''}`}
        >
          <input
            type="checkbox"
            checked={todo.completed}
            onChange={() => onToggle(todo.id)}
          />
          <span>{todo.text}</span>
          <button
            onClick={() => onDelete(todo.id)}
            className="delete-button"
          >
            Delete
          </button>
        </li>
      ))}
    </ul>
  )
}

export default TodoList
