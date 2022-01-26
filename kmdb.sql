-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy
-- - Movie data includes the movie title, year released, MPAA rating,
--   and director
-- - A movie has a single director
-- - A person can be the director of and/or play a role in a movie
-- - Everything you need to do in this assignment is marked with TODO!

-- Rubric
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
--   (10 points)
-- - Insertion of "Batman" sample data into tables (5 points)
-- - Selection of data, so that something similar to the following sample
--   "report" can be achieved (5 points)

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Christopher Nolan
-- The Dark Knight        2008           PG-13  Christopher Nolan
-- The Dark Knight Rises  2012           PG-13  Christopher Nolan

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers on
    -- Student note - changed to headers on, like this output better

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!
drop table if exists 'movies';
drop table if exists 'cast';

-- Create new tables, according to your domain model
-- TODO!

CREATE TABLE movies (
  movie_id INTEGER PRIMARY KEY AUTOINCREMENT,
  title varchar(50),
  year INTEGER,
  mpaa_rating varchar(50),
  director varchar(50)
);

CREATE TABLE cast (
  cast_id integer primary key autoincrement,  
  movie_id INTEGER,
  actor varchar(50),
  character varchar(50)
);

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

insert into movies (
        title,
        year,
        mpaa_rating,
        director
    ) 
    values  ("Batman Begins",2005,"PG-13","Christopher Nolan"),
            ("The Dark Knight",2008,"PG-13","Christopher Nolan"),
            ("The Dark Knight Rises",2012,"PG-13","Christopher Nolan");

insert into cast (
        movie_id,
        actor,
        character
    )
    values 
            (1,"Christian Bale","Bruce Wayne"),
            (1,"Michael Caine","Alfred"),
            (1,"Liam Neeson","Ra's Al Ghul"),
            (1,"Katie Holmes","Rachel Dawes"),
            (1,"Gary Oldman","Commissioner Gordon"),
            (2,"Christian Bale","Bruce Wayne"),
            (2,"Heath Ledger","Joker"),
            (2,"Aaron Eckhart","Harvey Dent"),
            (2,"Michael Caine","Alfred"),
            (2,"Maggie Gyllenhaal","Rachel Dawes"),
            (3,"Christian Bale","Bruce Wayne"),
            (3,"Gary Oldman","Commissioner Gordon"),
            (3,"Tom Hardy","Bane"),
            (3,"Joseph Gordon-Levitt","John Blake"),
            (3,"Anne Hathaway","Selina Kyle")

    ;

;

-- Prints a header for the movies output
.print "Movies"
.print "======"
.print ""


-- The SQL statement for the movies output
-- TODO!
select * from movies;

-- Prints a header for the cast output
.print ""
.print "Top Cast"
.print "========"
.print ""


select b.title, a.actor, a.character
from cast as A
inner join movies as b
on a.movie_id = b.movie_id
order by a.movie_id; 