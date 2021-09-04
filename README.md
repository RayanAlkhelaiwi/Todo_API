# Todo API

[![made-with-python](https://img.shields.io/badge/Backend-Ruby_on_Rails-b40202.svg)](https://rubyonrails.org//)
[![License: MIT](https://img.shields.io/badge/License-MIT-Green.svg)](https://opensource.org/licenses/MIT)

A RESTful API that implements public todos on the fly.

### Getting Started

- Base URL: <https://todo-ror-api.herokuapp.com/>

- Authentication: Not Applicable Currently.

From the `/` base folder run `bundle install` to install all the gems (a.k.a packages), then run `rails server` or simply `rails s`. All required packages are included in the Gemifle.

```shell
bundle install
rails server # Or just 'rails s'
```

**Frontend** (Not Applicable)

If applicable; inside the `/frontend` folder, run the following commands to start the client:

```shell
npm install # Only once to install dependencies
npm start
```

By default, the frontend will run on `localhost:3000`.

**Tests** (Not Applicable Currently)

This section will be updated when RSpec Tests are included.

**Roles and Permissions** (Not Applicable Currently)

This section will be updated when authentication is included.
<!-- The current permissions are: `get:todos`, `post:todos`, `patch:todos`, and `delete:todos`.
The current roles for this web app are `user` and `admin` in the following arrangement:
- `user` role has the following permissions: `get:todos` and `post:todos`.
- `admin` role has *all* the permissions listed above. -->

### Error Handling

Errors are returned as JSON obejcts in the following format:

```json
{
  "error": 404, 
  "message": "not found",
  "success": false
}
```

The Error types the API returns when requests fail are:
| HTTP Status Code | Response |
| ----------- | ----------- |
| 404 | Not Found |
| 422 | Unprocessable Entity |
<!-- | 400 | Bad Request | -->
<!-- | 401 | Auth Error | -->
<!-- | 403 | Unauthorized | -->
<!-- | 405 | Method Not Allowed | -->

### Endpoints

**GET /api/v1/todos**

Returns a list of todos.
<!-- Results are paginated in groups of 5. Include a query argument to choose page number (e.g. `?page=1`). -->

- Sample Request:

```shell
curl -X GET https://todo-ror-api.herokuapp.com/api/v1/todos
```

- Sample Response:

```json
{
    "status": 200,
    "success": true,
    "message": "fetched successfully",
    "data": [
        {
            "id": 5,
            "title": "Sample Article",
            "body": "Lorem lorem lorem",
            "created_at": "2021-08-31T14:55:31.545Z",
            "updated_at": "2021-08-31T14:55:31.545Z"
        },
        {
            "id": 4,
            "title": "Of Human Bondage",
            "body": "Laboriosam fugit accusantium. Provident aut porro. Nulla dolorem qui.",
            "created_at": "2021-08-31T14:03:13.792Z",
            "updated_at": "2021-08-31T14:03:13.792Z"
        },
        {
            "id": 3,
            "title": "East of Eden",
            "body": "Ut ad qui. Dolor laborum facilis. Placeat quam at.",
            "created_at": "2021-08-31T14:03:13.787Z",
            "updated_at": "2021-08-31T14:03:13.787Z"
        },
        {
            "id": 2,
            "title": "The Mirror Crack'd from Side to Side",
            "body": "Soluta atque et. Quod dignissimos minima. Aut nisi accusantium.",
            "created_at": "2021-08-31T14:03:13.782Z",
            "updated_at": "2021-08-31T14:03:13.782Z"
        },
        {
            "id": 1,
            "title": "Tiger! Tiger!",
            "body": "Nulla facere hic. Autem hic itaque. Ad impedit quaerat.",
            "created_at": "2021-08-31T14:03:13.777Z",
            "updated_at": "2021-08-31T14:03:13.777Z"
        }
    ]
}
```

**GET /api/v1/todos/{todo_id}**

Returns the todo item with the specified ID.

- Sample Request:

```shell
curl -X GET https://todo-ror-api.herokuapp.com/api/v1/todos/1
```

- Sample Response:

```json
{
    "status": 200,
    "success": true,
    "message": "fetched successfully",
    "data": {
        "id": 1,
        "title": "Tiger! Tiger!",
        "body": "Nulla facere hic. Autem hic itaque. Ad impedit quaerat.",
        "created_at": "2021-08-31T14:03:13.777Z",
        "updated_at": "2021-08-31T14:03:13.777Z"
    }
}
```

**POST /api/v1/todos**

Creates a new todo item by submitting the information for a title and its body. It returns the success value, message, and the created todo item.

- Sample Request:

```shell
curl -X POST -H "Content-Type: application/json" -d '{"title":"Sample Todo", "body":"Lorem ipsum dolor sit amet consectetur adipisicing elit."}' https://todo-ror-api.herokuapp.com/api/v1/todos
```

- Sample Response:

```json
{
    "status": 200,
    "success": true,
    "message": "created successfully",
    "data": {
        "id": 10,
        "title": "Sample Todo",
        "body": "Lorem ipsum dolor sit amet consectetur adipisicing elit.",
        "created_at": "2021-09-01T12:24:05.883Z",
        "updated_at": "2021-09-01T12:24:05.883Z"
    }
}
```

**PATCH /api/v1/todos/{todo_id}**

Updates the todo item info using the its ID; it updates partially or fully, depending on the passed attributes. Returns the success value and the updated todo item.

- Sample Request:

```shell
curl -X PATCH -H "Content-Type: application/json" -d '{"title":"Updated Title"}' https://todo-ror-api.herokuapp.com/api/v1/todos/10
```

- Sample Response:

```json
{
    "status": 200,
    "success": true,
    "message": "updated successfully",
    "data": {
        "title": "Updated Title",
        "id": 10,
        "body": "Lorem ipsum dolor sit amet consectetur adipisicing elit.",
        "created_at": "2021-09-01T12:37:07.902Z",
        "updated_at": "2021-09-01T12:44:12.980Z"
    }
}
```

**DELETE api/v1/todos/{todo_id}**

Deletes the todo item with the given ID. Returns the success value and the ID of the deleted todo item.

- Sample Request:

```shell
curl -X DELETE https://todo-ror-api.herokuapp.com/api/v1/todos/5
```

- Sample Response:

```json
{
    "status": 200,
    "data": "deleted successfully",
    "id": 5
}
```
