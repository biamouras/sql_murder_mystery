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
witness 1: 14887 (person id)
TRANSCRIPT RESULT
    I heard a gunshot and then saw a man run out. 
    He had a "Get Fit Now Gym" bag. 
    The membership number on the bag started with "48Z". 
    Only gold members have those bags. 
    The man got into a car with a plate that included "H42W".
*/

/* get the interview of second witness */
select a.*
from interview a, person b
where a.person_id = b.id
	and b.name like 'Annabel%' /* person with the name Annabel */
	and b.address_street_name = 'Franklin Ave'; /* that lives in the mentioned address */

/*
witness 2: 16371 (person id)
TRANSCRIPT RESULT
    I saw the murder happen, and I recognized the killer from my gym 
    when I was working out last week on January the 9th.
*/

/* get the suspect */
select a.id as person_id, a.name, b.id as member_id, 
	b.membership_status, c.plate_number, d.check_in_date
from person a, 
	get_fit_now_member b,
	drivers_license c,
	get_fit_now_check_in d 
where a.id = b.person_id /* join tables */
	and a.license_id = c.id /* join tables */
	and b.id like '48Z%' /* 1st witness: membership number on the bag started with "48Z" */
	and b.membership_status = 'gold' /* 1st witness: gold members have those bags*/
	and c.plate_number like '%H42W%' /* 1st witness: car with a plate that included "H42W" */
	and b.id = d.membership_id /* join tables */
	and d.check_in_date = 20180109; /* 2nd witness: January the 9th */

/*
SUSPECT
    person_id: 67318
    name: Jeremy Bowers
    member_id: 48Z55
    membership_status: gold
    plate_number: 0H42W2
    check_in_date: 20180109					
*/

/*
Congrats, you found the murderer! But wait, there's more... 
If you think you're up for a challenge, try querying the interview transcript of the murderer 
to find the real villain behind this crime. If you feel especially confident in your SQL skills, 
try to complete this final step with no more than 2 queries. Use this same INSERT statement with 
your new suspect to check your answer.
*/

/* MURDERER INTERVIEW */
select *
from interview
where person_id = 67318;

/*
TRANSCRIPT
	I was hired by a woman with a lot of money. 
    I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
    She has red hair and she drives a Tesla Model S. 
    I know that she attended the SQL Symphony Concert 3 times in December 2017. 
*/