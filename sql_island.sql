/*
https://sql-island.informatik.uni-kl.de/
ME: Oh dear, what happened? It seems that I am the only survivor of the air crash. Wow, there are some villages on this island.
*/

SELECT * FROM village

/* ME: It seems there are a few people living in these villages. How can I see a list of all inhabitants? */
SELECT * FROM inhabitant

/* ME: Man! I'm hungry. I will go and find a butcher to ask for some free sausages.*/

SELECT * FROM inhabitant WHERE job = 'butcher'

/* 
BUTCHER:
    There you are! Enjoy your meal! But take care of yourself. 
    As long as you are unarmed, stay away from villains. 
    Not everyone on this island is friendly.
ME:
    Thank you, Edward! Okay, let's see who is friendly on this island...
*/

SELECT * 
FROM inhabitant
WHERE state = 'friendly';

/*
ME:
    There is no way around getting a sword for myself. 
    I will now try to find a friendly weaponsmith to forge me one. 
    (Hint: You can combine predicates in the WHERE clause with AND)
*/

SELECT *
FROM inhabitant
WHERE state = 'friendly'
    AND job = 'weaponsmith';

/*
RESULT
personid	name	villageid	gender	job	gold	state
2	Ernest Perry	3	m	weaponsmith	280	friendly
*/

/*
BUTCHER:
    Oh, that does not look good. 
    Maybe other friendly smiths can help you out, e.g. a blacksmith. 
    Try out: job LIKE '%smith' to find all inhabitants whose job ends with 'smith' (% is a wildcard for any number of characters).
*/

SELECT *
FROM inhabitant
WHERE state = 'friendly'
    AND job LIKE '%smith';

/* RESULT
personid	name	villageid	gender	job	gold	state
2	Ernest Perry	3	m	weaponsmith	280	friendly
10	Peter Drummer	1	m	smith	600	friendly
18	Ryan Horse	3	m	blacksmith	390	friendly
*/

/*
ME:
    No need to call me stranger! 
    What's my personid? 
    (Hint: In former queries, the * stands for: all columns. 
    Instead of the star, you can also address one or more columns (seperated by a comma) and you will only get the columns you need.)
*/

SELECT personid
FROM inhabitant
WHERE name = 'Stranger';

/*
ME:
    Hi Ernest! How much is a sword?
ERNEST:
    I can offer to make you a sword for 150 gold. That's the cheapest you will find! How much gold do you have?
*/

SELECT gold
FROM inhabitant
WHERE name = 'Stranger';

/* 
RESULT: 0
ME:
    Damn! No mon, no fun. 
    There has to be another option to earn gold other than going to work. 
    Maybe I could collect ownerless items and sell them! 
    Can I make a list of all items that don't belong to anyone? 
    (Hint: You can recognize ownerless items by: WHERE owner IS NULL)
*/

SELECT *
FROM item
WHERE owner IS NULL;

/* 
ME:
    Do you know a trick how to collect all the ownerless items?
*/

UPDATE item 
SET owner = 20 
WHERE item IN (
    SELECT item
    FROM item
    WHERE owner IS NULL 
);

/* 
ME:
    Find a friendly inhabitant who is either a dealer or a merchant. 
    Maybe they want to buy some of my items. 
    (Hint: When you use both AND and OR, don't forget to put brackets correctly!)
*/