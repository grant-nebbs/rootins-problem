# ROOT
Test problem for the interview process at root insurance

## Navigation
### Running the Program
- To run the program, first navigate to the home directory (you should already be here)
- Run the command 'ruby main.rb input.txt'
- The text file can be the one already in existence, "input.txt". 
	- You can also modify this file or
	- You can create a new text file in which your new file would entered in the command line where 'input.txt' is

### Running Tests
- To run tests on the methods of this program:
	- Navigate to home directory
	- Run the command 'ruby -Itest testing/allTests.rb'
		- If you wish to run tests on a particular method or class, replace 'testing/allTests.rb' with 'testing/test_*.rb' where * is the name of the method or class you wish to test

## Design
- This program is designed with two main files, main.rb and methods.rb
	- Main.rb is the macro level thinking of the project. What needs to happen and when does it happen
	- Methods.rb is the micro level of functionality of the project. This handles specifically how things happen and the logistics of moving data around. 
		- Methods.rb also makes use of a class called 'Driver'
		- This is used to store data of multiple aspects about specific drivers

## Testing
- The simple methods and the Driver class are selected for testing currently. 
	- The class is tested by it's initialization method for consistency
	- The simple methods are methods that provide limited function aka. only do what their name says they do. These methods are tested because they handle the checking of data structure and consistency. 

