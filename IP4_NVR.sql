USE henry;

#1
SELECT firstName as "First Name", lastName as "Last Name"
FROM author; 

#2
SELECT title as "Book Title", TYPE as "Book Type"
FROM book;


#3
SELECT publisherCode as "Publisher Code"
FROM book
GROUP BY publisherCode;

#4
SELECT title as price, ROUND(((1-0.25)*price), 2) as discount
FROM book
LIMIT 5;

#5
SELECT title, price
FROM book
WHERE price > 20.00;

#6
SELECT publisherName as "Publisher Name"
FROM publisher
WHERE city = "New York";

#7
SELECT publisherName as "Publisher Name"
FROM publisher
WHERE city != "New York";

#8
SELECT bookCode as "Book Code", onHand as "Number on hand", branchNum as "Branch Number"
FROM inventory
WHERE onHand BETWEEN 2 AND 4;

#9
SELECT count(title) as "Penguin Books"
FROM publisher, book
WHERE publisherName = "Penguin USA" AND (publisher.publisherCode = book.publisherCode)
GROUP BY publisherName;

#10
SELECT count(title) as "Number of Books Priced $20.00 and Under"
FROM book
WHERE price <= 20.00;

#11
SELECT bookCode as "Book Code", title as "Book Title", TYPE as "Type of Book", price as "Price", paperback as "Paperback", book.publisherCode as "Publisher Code",  publisherName "Publisher Name", city as "Publisher City"
FROM book
JOIN publisher
WHERE book.publisherCode = publisher.publisherCode;

#12
SELECT bookCode as "Book Code", title as "Book Title", TYPE as "Type of Book", price as "Price",  paperback as "Paperback", book.publisherCode as "Publisher Code",  publisherName "Publisher Name", city as "Publisher City"
FROM book
JOIN publisher ON
book.publisherCode = publisher.publisherCode;

#13
SELECT title AS "Book Title", city as "Publication City"
FROM book
JOIN publisher ON
book.publisherCode = publisher.publisherCode
ORDER BY title;

#14
SELECT title AS "Book Title", branchNum AS "Branch Number", onHand AS "Onhand Inventory"
FROM book
JOIN inventory ON
book.bookCode = inventory.bookCode
ORDER BY title;

#15
SELECT title AS "Book Title", SUM(onHand) as "Inventory"
FROM book
JOIN inventory ON
book.bookCode = inventory.bookCode
GROUP BY title
ORDER by Inventory DESC
LIMIT 2;


#16
SELECT firstName as "First Name", lastName as "Last Name", title as "Book Title"
FROM author
JOIN wrote ON 
author.authorNUM = wrote.authorNum
JOIN book ON 
wrote.bookCode = book.bookCode
WHERE paperback="Y"
ORDER BY lastName, title;

#BONUS
SELECT title as "Book Title", lastName as "Author Last Name"
FROM book 
JOIN wrote ON
book.bookCode = wrote.bookCode
JOIN author ON
wrote.authorNum = author.authorNum
ORDER BY lastName;