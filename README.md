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

## Task List

-   URL: `/api/task`
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
