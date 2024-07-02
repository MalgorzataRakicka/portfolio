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

