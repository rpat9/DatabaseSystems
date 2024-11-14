# Project 2 - Physical Design Project

Create a physical design in the form of a SQL script for your project using your entity-relationship diagram from project 1.  The physical design should include:

* A statement that creates the database.
* Statements to define a minimum of three tables that are required to implement the database.  Table definitions should include primary key constraints and foreign key constraints with referential integrity actions.  Attributes should have appropriate data types and constraints.
* Statements to define indexes for columns frequently queried but are not primary keys or foreign keys since MySQL automatically creates indexes for those columns.
* Statements that insert at least three rows of sample data into each table.
* Statements that create a user and grants the user appropriate access to the database. This user will access the database in your Python program.

Your SQL script should readable (use whitespace and multiline statements) and not contain any text other than SQL statements and comments.  It should be executable using the `source` command, so be sure to define tables that are referred to in a foreign key constraint first.

**To submit this assignment, commit your SQL script to this repository and then submit the related Blackboard assignment.**
