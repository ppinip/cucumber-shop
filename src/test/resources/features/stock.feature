Feature: Check Stock
  As a manager
  I want to check stock

Background:
   Given the store is ready to service customers
   And a product "Bread" with price 20.50 and stock of 5 exists
   And a product "Jam" with price 80.00 and stock of 10 exists
   And a product "Coffee" with price 75.00 and stock of 25 exists

Scenario: Buy one product remove product in stock
  When I buy "Bread" with quantity 2
  Then "Bread" stock should be 3

Scenario: Buy multiple products
  When I buy "Jam" with quantity 3
  And I buy "Coffee" with quantity 5
  Then "Jam" stock should be 7
  Then "Coffee" stock should be 20

Scenario Outline: Buy one product in table
  When I buy <product> with quantity <quantity>
  Then <product> stock should be <stock>
  Examples:
    | product  | quantity |  stock  |
    | "Bread"  |     1    |   4     |
    | "Jam"    |     2    |   8     |
    | "Coffee" |     3    |   22    |
