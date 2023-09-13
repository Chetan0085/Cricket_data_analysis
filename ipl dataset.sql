select * from ipl..Ball_By_Ball;
select * from ipl..Match;
alter table ipl..Ball_By_Ball
alter column MatchDateSK int;



select * from ipl..Ball_By_Ball a, ipl..Player_match b
where a.Striker_match_SK=b.Player_match_SK;

select * from ipl..Ball_By_Ball a, ipl..Match b
where a.Match_id = b.match_id

select * from ipl..Player

select a.player_name,a.Country_Name, round((b.total_runs_scored*100)/b.balls_faced,2) strike_rate,b.* from( 
	select Striker, sum(Runs_Scored) as total_runs_scored,count(Ball_id) as balls_faced 
from ipl..Ball_By_Ball 
group by Striker)b, ipl..Player a
where a.Player_Id=b.Striker
order by total_runs_scored desc

select * from ipl..Ball_By_Ball
select * from ipl..Team

select striker, count(runs_scored) as no_of_fours, Match_id
from ipl..Ball_By_Ball
where Runs_Scored=4
group by striker, Match_id
order by count(runs_scored) desc



select a.player_name,a.Country_Name,b.* from( 
select striker, count(runs_scored) as fours_in_one_match, Match_id
from ipl..Ball_By_Ball
where Runs_Scored=4
group by striker, Match_id)b, ipl..Player a
where a.Player_Id=b.Striker
order by fours_in_one_match desc



select striker, count(runs_scored) as no_of_six, Match_id
from ipl..Ball_By_Ball
where Runs_Scored=6
group by Match_id,striker
order by count(runs_scored) desc


select a.player_name,a.Country_Name,b.* from( 
	select striker, count(runs_scored) as no_of_six, Match_id
from ipl..Ball_By_Ball
where Runs_Scored=6
group by Match_id,striker)b, ipl..Player a
where a.Player_Id=b.Striker
order by no_of_six desc


select count(bowler_wicket) as no_of_wickets, Match_id, Season,Bowler
from ipl..Ball_By_Ball
where bowler_wicket =1
group by bowler,Match_id, Season 
order by no_of_wickets desc

select count(bowler_wicket) as no_of_wickets
from ipl..Ball_By_Ball
where Match_id=335987 and Bowler_Wicket = 1;

select count(runs_scored) as runs_in_one_match,Striker, Match_id
	from ipl..Ball_By_Ball a
	group by Striker, Match_id
	order by Striker desc 



select round(avg(b.runs_in_one_match),1) as batting_avg, striker from(
	select count(runs_scored) as runs_in_one_match,Striker, Match_id
	from ipl..Ball_By_Ball a
	group by Striker, Match_id)b
group by striker
having avg(b.runs_in_one_match) >25
--order by batting_avg desc)d


select a.player_name,a.Country_Name,b.* from( 
select round(avg(b.runs_in_one_match),1) as batting_avg, striker from(
	select count(runs_scored) as runs_in_one_match,Striker, Match_id
	from ipl..Ball_By_Ball a
	group by Striker, Match_id)b
group by striker
having avg(b.runs_in_one_match) >25)b, ipl..Player a
where a.Player_Id=b.Striker



select a.Striker,a.runs_from_fours,b.runs_from_sixes from(
	select striker, count(runs_scored) as no_of_fours, (count(runs_scored)*4) as runs_from_fours
	from ipl..Ball_By_Ball
	where Runs_Scored=4
	group by striker)a inner join

	(select striker, count(runs_scored) as no_of_sixes, (count(runs_scored)*6) as runs_from_sixes
	from ipl..Ball_By_Ball
	where Runs_Scored=6
	group by striker)b
on a.Striker=b.Striker


select a.player_name,a.Country_Name,b.* from( 
select a.Striker,a.runs_from_fours,b.runs_from_sixes from(
	select striker, count(runs_scored) as no_of_fours, (count(runs_scored)*4) as runs_from_fours
	from ipl..Ball_By_Ball
	where Runs_Scored=4
	group by striker)a inner join

	(select striker, count(runs_scored) as no_of_sixes, (count(runs_scored)*6) as runs_from_sixes
	from ipl..Ball_By_Ball
	where Runs_Scored=6
	group by striker)b
on a.Striker=b.Striker)b, ipl..Player a
where a.Player_Id=b.Striker
--order by fours_in_one_match desc



