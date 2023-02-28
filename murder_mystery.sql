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