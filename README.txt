merchants_guide_to_galaxy
=========================

Calculator to convert numbers and units for intergalactic transactions that follow similar convention to the roman numerals.

Application architecture
=========================
The application follows a layered architecture, the domain layer deals with 'What the system is' and the application layer deals with 'What the system does.' The domain layer captures the concepts/entities in the business domain using OO principles of abstraction and encapsulation to represent them as a set of classes and objects.

The application layer provides an API for clients to use the functionality of the domain layer. The domain layer code is hidden from the client code.
The application layer provides a use-case driven API. One API for each use-case. In our application we have two use-cases. One for entering the conversion notes and the other for entering the query. For each API there is a request object, interactor and a response object. The request object is a simple wrapper of the input required for the operation and the response object is a simple wrapper for the results. The interactor object is the one that interacts with the domain layer objects to get the work done.

The client code in this case is a simple console application implemented in the file 'merchants_guide_to_galaxy.rb'.
If we package the application layer and domain layer as a gem then we can reuse this functionality and provide a desktop client or web interface to the same application with no changes to the core functionality.


Development Approach
=========================
I have used an inside-out TDD approach. I wrote unit tests before writing the production code. I didn't use TDD to evolve an architecture but definitely used TDD to incrementally build the system and leveraged the safety net it provides to refactor the code multiple times. I used an inside-out approach because I was able to break down the problem into smaller pieces and come up with a few abstractions to capture the concepts in the domain. If I had difficulty in breaking down the problem, I would have used outside-in TDD and let the tests guide me to an architecture.


High Level Design
=========================
I didn't do commonality-variability analysis or try to see which aspects of the requirements would change in the future and apply design patterns. Instead I tried to follow a simpler approach 'Make small things (smaller classes, smaller methods) and let them know as little as possible about each other'. I hope this helps me avoid over-engineering the solution and still gives me enough flexibility to adapt the code as the requirements change. I used Rubocop as tool to watch my code for Ruby coding conventions and for keeping things small in size. I focussed more on SRP (Single Responsibility Principle) from the SOLID OO design principles.


Runtime dependencies
===========================
I am using Ruby Version Manager (RVM) to manage different versions of Ruby and Gems for each application. I created .ruby-version and .ruby-gemset files in the project root folder. You will probably need to change the ruby version in the .ruby-version file. If you have rvm installed and cd to the project root folder, the appropriate gemset will be created and set as the current one. Running 'bundle install' command will install the required gems. All the gem dependencies are for development and testing purposes.


How to run the application
===========================
You can go to the bin folder in the project root folder and run the command ./merchants_guide_to_galaxy.rb. If required you have to make the file merchants_guide_to_galaxy.rb executable using the command 'chmod a+x merchants_guide_to_galaxy.rb'

Alternatively you can run the console application by using the command 'rake run'


How to run the tests
==========================
From the project root folder run the command 'rake'. Make sure you run 'bundle install' first to install the dependent gems. See Runtime dependencies above for more information.


Future enhancements
==========================
In the course of doing TDD and thinking through the problem, I took notes on some features that would be nice to have but I didn't want to get sidetracked until the core problem is solved. I am listing them here in no particular order.

1. Should support entering conversion notes and queries in any order.
2. Should support the ability to update the value (roman numeral) associated with a particular intergalactic symbol, by entering new conversion notes.
3. Should support the ability to associate one intergalactic symbol with multiple digit roman numeral.
4. Check case sensitivity.
5. Check for valid and invalid conversion notes and queries and give appropriate error messages.

Above all, I really enjoyed working on this application. Thank You for the opportunity.