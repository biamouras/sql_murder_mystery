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