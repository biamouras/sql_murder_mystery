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
