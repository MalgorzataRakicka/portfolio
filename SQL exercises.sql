/* Ex. 1. How can you produce a list of bookings on the day of 2012-09-14 which will cost the member (or guest) more than $30? Remember that guests have different costs 
to members (the listed costs are per half-hour 'slot'), and the guest user is always ID 0. Include in your output the name of the facility, the name of the member formatted 
as a single column, and the cost. Order by descending cost.*/ 

select mems.firstname || ' ' || mems.surname as member, 
	facs.name as facility, 
	case 
		when mems.memid = 0 then
			bks.slots*facs.guestcost
		else
			bks.slots*facs.membercost
	end as cost
        from
                cd.members mems                
                inner join cd.bookings bks
                        on mems.memid = bks.memid
                inner join cd.facilities facs
                        on bks.facid = facs.facid
        where
		bks.starttime >= '2012-09-14' and 
		bks.starttime < '2012-09-15' and (
			(mems.memid = 0 and bks.slots*facs.guestcost > 30) or
			(mems.memid != 0 and bks.slots*facs.membercost > 30)
		)
order by cost desc; 

/*Ex. 2. How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, 
and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by 
the facility name. */

SELECT DISTINCT cd.members.firstname || ' ' || cd.members.surname as member, cd.facilities.name AS facility
FROM ((cd.bookings
INNER JOIN cd.facilities ON cd.bookings.facid=cd.facilities.facid)
INNER JOIN cd.members ON cd.bookings.memid = cd.members.memid)
WHERE cd.facilities.name LIKE '%Tennis Court%'
ORDER BY member,facility

/* Ex. 3. Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table 
	consisting of facility id and slots, sorted by the number of slots.  */
	
SELECT cd.bookings.facid,SUM(slots) as Total
FROM cd.bookings 
LEFT JOIN cd.facilities ON cd.bookings.facid = cd.facilities.facid
WHERE DATE(starttime) BETWEEN '2012-09-01' AND '2012-09-30'
GROUP BY cd.bookings.facid
ORDER BY Total

/* Ex. 4. Let's try adding the spa to the facilities table again. This time, though, we want to automatically generate the value 
for the next facid, rather than specifying it as a constant. Use the following values for everything else:

    Name: 'Spa', membercost: 20, guestcost: 30, initialoutlay: 100000, monthlymaintenance: 800. */

INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) 
SELECT (SELECT MAX(facid) FROM cd.facilities)+1, 'Spa', 20, 30, 100000, 800;         

/* Ex. 5. Produce a count of the number of recommendations each member has made. Order by member ID. */
SELECT recommendedby, COUNT(*) FROM cd.members 
	WHERE recommendedby IS NOT NULL
	GROUP BY recommendedby
ORDER BY recommendedby

/* Ex. 6. Produce a list of the total number of slots booked per facility per month in the year of 2012. Produce an output table 
consisting of facility id and slots, sorted by the id and month. */

SELECT facid, EXTRACT(month FROM starttime) as month,SUM(slots) as Total
FROM cd.bookings 
WHERE DATE(starttime) BETWEEN '2012-01-01' AND '2012-12-31'
GROUP BY facid,month
ORDER BY facid,month 

/* Ex. 7. Produce a list of each member name, id, and their first booking after September 1st 2012. Order by member ID.  */

SELECT cd.members.surname,cd.members.firstname, cd.members.memid, MIN(starttime)
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE starttime>='2012-09-01 00:00:00'

/* https://pgexercises.com/questions/aggregates/nummembers.html 
