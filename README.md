Task 1: Building an API Endpoint

Task Description:
You are tasked with creating a RESTful API endpoint using Laravel. The API endpoint should allow users to retrieve a list of products. Each product should have the following attributes:

-   ID
-   Name
-   Description
-   Price
-   Stock Quantity

Requirements:

1. Create a Laravel project (you can use Laravel 8 or later).
2. Set up a database with a `products` table to store product data.
3. Create a migration to define the structure of the `products` table.
4. Create a model for the `Product` and set up the necessary database relationships.
5. Implement API routes for retrieving a list of products (GET request) and individual product details (GET request by ID).
6. Implement validation to ensure that the API can handle invalid requests gracefully (e.g., return appropriate error responses for missing data).

Evaluation Criteria:

-   Correctness of API implementation.
-   Proper use of Laravel features such as migrations, models, and routes.
-   Validation and error handling.

---

Task 2: User Authentication and Authorization

Task Description:
You are tasked with implementing user authentication and authorization in a Laravel application. The application has two types of users: "Admin" and "Regular User." Admin users have additional privileges, such as managing user accounts and content.

Requirements:

1. Create a Laravel project (Laravel 8 or later).
2. Implement user registration and login functionality.
3. Create a migration for the `users` table.
4. Implement user roles and permissions using Laravel's built-in features or a package like Spatie's Laravel Permission.
5. Create routes and views to allow users to register, log in, and log out.
6. Implement an admin panel that only admin users can access. Admins should be able to manage user accounts and view a list of registered users.
7. Implement middleware to handle user authentication and authorization throughout the application.
8. Use Laravel Blade for views and ensure that they are well-styled and user-friendly.

Evaluation Criteria:

-   Correct implementation of user authentication and authorization.
-   Proper use of Laravel features for user management.
-   Clear and secure user role management.
-   Design and functionality of user interfaces.
-   Validation and error handling

---

Task 3: Array Operations
Create a Laravel route named "merge-arrays" that accepts two arrays as query parameters, array1 and array2. Merge these arrays into a single array and return it as a JSON response.
Implement a Laravel route named "filter-odd-numbers" that accepts an array of integers as a query parameter called numbers. This route should filter out all the odd numbers from the input array and return the resulting array as a JSON response.
Create a Laravel route named "calculate-average" that accepts an array of numbers as a query parameter called numbers. Calculate and return the average of the numbers in the array as a JSON response.
Create a Laravel route named "find-common-elements" that accepts two arrays as query parameters, array1 and array2. Find and return an array containing elements that are common to both input arrays.

Task 4: String Manipulation (OPTIONAL TASK)
Create a Laravel route named "reverse-string" that accepts a string as a query parameter called text. This route should return the input string reversed.
Create a Laravel route named "count-vowels" that accepts a string as a query parameter called text. This route should return the count of vowels (a, e, i, o, u) in the input string.
Implement a Laravel route named "truncate-text" that accepts two query parameters: text (a string) and length (an integer). This route should truncate the input text to the specified length and add "..." at the end if the text was truncated.

Evaluation Criteria:

-   Code correctness and functionality.
-   Proper error handling.
-   Code readability and organization.
-   Efficient use of PHP array and string functions.
-   Proper usage of Laravel routes and response methods.
