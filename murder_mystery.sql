/*
DESCRIPTION OF THE CHALLENGE
A crime has taken place and the detective needs your help. 
The detective gave you the crime scene report, but you somehow lost it. 
You vaguely remember that the crime was a ​murder​ that occurred sometime on ​Jan.15, 2018​ and that it took place in ​SQL City​. 
Start by retrieving the corresponding crime scene report from the police department’s database.
*/

/* find the name of the tables*/
SELECT name 
  FROM sqlite_master
 where type = 'table'

/* identify the crime scene report */
select *
from crime_scene_report
where date = 20180115
	and type = 'murder'
	and city = 'SQL City';

/* 
DESCRIPTION RESULT
Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/ 

/* get the interview of first witness */
select a.*
from interview a, person b
where a.person_id = b.id
	and b.address_street_name = 'Northwestern Dr' /* identify the address */
order by b.address_number desc /* order by the address number in descending order */
limit 1; /* get the first line (last house) */

/*
TRANSCRIPT RESULT
I heard a gunshot and then saw a man run out. 
He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". 
Only gold members have those bags. The man got into a car with a plate that included "H42W".
*/