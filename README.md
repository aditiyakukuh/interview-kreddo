# interview-kreddo

## Description of this project

This project is created with Laravel framework (PHP). The structure of the `tasks` table is as follows:

| Column      | Type                                           |
| ----------- | ---------------------------------------------- |
| id          | unsigned bigint                                |
| title       | varchar                                        |
| description | longtext                                       |
| priority    | enum ('low', 'medium', 'high')                 |
| status      | enum ('pending', 'in-progress', 'completed')   |
| expired_at  | timestamp                                      |
| created_at  | timestamp                                      |
| updated_at  | timestamp                                      |
| user_id     | unsigned bigint (foreign key references users) |

## Features

-   REST API endpoints for managing tasks
-   User authentication for secure access to the API
-   CRUD operations for tasks:
    -   Create a new task
    -   Retrieve tasks
    -   Update a task
    -   Delete a task

### Login

-   Login endpoint for user authentication:
    -   URL: `/api/login`
-   Method: `POST`
-   Headers:
    -   Accept: `application/json`
    -   Content-Type: `application/json`
-   Data:
    -   email: user's email
    -   password: user's password
-   Response: Returns user data including `id`, `name`, `email`, and a `token`

### Register

-   URL: `/api/register`
-   Method: `POST`
-   Headers:
    -   Accept: `application/json`
    -   Content-Type: `application/json`
-   Data:
    -   name: user's name
    -   email: user's email
    -   password: user's password
-   Response: Returns user data including `id`, `name`, `email`, and a `token`

### My Profile

-   URL: `/api/profile`
-   Method: `GET`
-   Headers:
    -   Accept: `application/json`
    -   Authorization: Bearer {token}
-   Response: Returns user data including `id`, `name`, and `email`

### Logout

-   URL: `/api/logout`
-   Method: `POST`
-   Headers:
    -   Accept: `application/json`
    -   Authorization: Bearer {token}
-   Response: Returns a message indicating successful logout

### Task List

-   URL: `/api/task?status=&priority=&expires=&text=`
-   Method: `GET`
-   Parameters:
    -   status: Filter tasks by status (pending, in-progress, completed)
    -   priority: Filter tasks by priority (low, medium, high)
    -   expires: Filter tasks by expiration (date or week)
    -   text: Filter tasks by searching text in title or description
-   Headers:
    -   Accept: `application/json`
    -   Authorization: Bearer {token}
-   Response: Returns a list of tasks with the following data:
    -   title: Task title
    -   description: Task description
    -   priority: Task priority (low, medium, high)
    -   status: Task status (pending, in-progress, completed)
    -   expired_at: Task expiration date
    -   user: Task owner information

### Get Task by ID

-   URL: `/api/task/{id}`
-   Method: `GET`
-   Parameters:
    -   id: ID of the task
-   Headers:
    -   Accept: `application/json`
    -   Authorization: Bearer {token}
-   Response: Returns the task with the specified ID with the following data:
    -   title: Task title
    -   description: Task description
    -   priority: Task priority (low, medium, high)
    -   status: Task status (pending, in-progress, completed)
    -   expired_at: Task expiration date
    -   user: Task owner information

### Create Task

-   URL: `/api/task`
-   Method: `POST`
-   Headers:
    -   Accept: `application/json`
    -   Content-Type: `application/json`
    -   Authorization: Bearer {token}
-   Body:
    -   title: Task title (string)
    -   description: Task description (string)
    -   priority: Task priority (low, medium, high)
    -   status: Task status (pending, in-progress, completed)
    -   expired_at: Task expiration date (format: YYYY-MM-DD)
-   Response: Returns the newly created task with the following data:
    -   title: Task title
    -   description: Task description
    -   priority: Task priority (low, medium, high)
    -   status: Task status (pending, in-progress, completed)
    -   expired_at: Task expiration date
    -   user: Task owner information

### Update Task

-   URL: `/api/task/{id}`
-   Method: `PUT`
-   Parameters:
    -   id: Task ID (integer)
-   Headers:
    -   Accept: `application/json`
    -   Authorization: Bearer {token}
-   Body:
    -   title: Updated task title (string)
    -   description: Updated task description (string)
    -   priority: Updated task priority (low, medium, high)
    -   status: Updated task status (pending, in-progress, completed)
    -   expired_at: Updated task expiration date (format: YYYY-MM-DD)
-   Response: Returns the updated task with the following data:
    -   title: Task title
    -   description: Task description
    -   priority: Task priority (low, medium, high)
    -   status: Task status (pending, in-progress, completed)
    -   expired_at: Task expiration date
    -   user: Task owner information

## Delete Task

-   URL: `/api/task/{id}`
-   Method: `DELETE`
-   Parameters:
    -   id: Task ID (integer)
-   Headers:
    -   Accept: `application/json`
    -   Authorization: Bearer {token}
-   Response: Returns a success message upon successful deletion:
    -   message: "Task deleted successfully"
