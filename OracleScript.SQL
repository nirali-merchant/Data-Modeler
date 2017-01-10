/*
Created: 12/3/2016
Modified: 12/3/2016
Model: Oracle 11g Release 2
Database: Oracle 11g Release 2
*/


-- Create tables section -------------------------------------------------

-- Table Movies

CREATE TABLE "Movies"(
  "movie_id" Integer NOT NULL,
  "movie_name" Varchar2(30 ),
  "movie_rating" Varchar2(5 ),
  "movie_duration" Integer,
  "metascore_value" Integer,
  "movie_description" Varchar2(255 ),
  "release_date" Date,
  "movie_image" Blob,
  "imdb_rating" Float,
  "movie_votes" Integer,
  "is_oscar_winner" Char(1 ),
  "dvd_link" Varchar2(255 ),
  "bluray_link" Varchar2(255 )
)
/

-- Add keys for table Movies

ALTER TABLE "Movies" ADD CONSTRAINT "Key1" PRIMARY KEY ("movie_id")
/

-- Table Genre

CREATE TABLE "Genre"(
  "genre_id" Integer NOT NULL,
  "genre_name" Varchar2(20 )
)
/

-- Add keys for table Genre

ALTER TABLE "Genre" ADD CONSTRAINT "Key2" PRIMARY KEY ("genre_id")
/

-- Table Metacritic_Review

CREATE TABLE "Metacritic_Review"(
  "review_id" Integer NOT NULL,
  "review_score" Integer,
  "review_description" Varchar2(255 ),
  "movie_id" Integer,
  "magazine_id" Integer,
  "author_id" Integer
)
/

-- Create indexes for table Metacritic_Review

CREATE INDEX "IX_Relationship7" ON "Metacritic_Review" ("movie_id")
/

CREATE INDEX "IX_Relationship8" ON "Metacritic_Review" ("magazine_id")
/

CREATE INDEX "IX_Relationship10" ON "Metacritic_Review" ("author_id")
/

-- Add keys for table Metacritic_Review

ALTER TABLE "Metacritic_Review" ADD CONSTRAINT "Key3" PRIMARY KEY ("review_id")
/

-- Table Magazine

CREATE TABLE "Magazine"(
  "magazine_id" Integer NOT NULL,
  "magazine_name" Varchar2(30 )
)
/

-- Add keys for table Magazine

ALTER TABLE "Magazine" ADD CONSTRAINT "Key4" PRIMARY KEY ("magazine_id")
/

-- Table Author

CREATE TABLE "Author"(
  "author_id" Integer NOT NULL,
  "author_name" Varchar2(20 ),
  "magazine_id" Integer NOT NULL
)
/

-- Create indexes for table Author

CREATE INDEX "IX_Relationship9" ON "Author" ("magazine_id")
/

-- Add keys for table Author

ALTER TABLE "Author" ADD CONSTRAINT "Key5" PRIMARY KEY ("author_id")
/

-- Table Person

CREATE TABLE "Person"(
  "person_id" Integer NOT NULL,
  "first_name" Varchar2(20 ),
  "last_name" Varchar2(20 ),
  "birth_date" Integer,
  "birth_month" Varchar2(9 ),
  "birth_year" Integer,
  "city_id" Integer NOT NULL
)
/

-- Create indexes for table Person

CREATE INDEX "IX_Relationship18" ON "Person" ("city_id")
/

-- Add keys for table Person

ALTER TABLE "Person" ADD CONSTRAINT "Key6" PRIMARY KEY ("person_id")
/

-- Table City

CREATE TABLE "City"(
  "city_id" Integer NOT NULL,
  "city_name" Varchar2(20 ),
  "state_id" Integer NOT NULL
)
/

-- Create indexes for table City

CREATE INDEX "IX_Relationship19" ON "City" ("state_id")
/

-- Add keys for table City

ALTER TABLE "City" ADD CONSTRAINT "Key7" PRIMARY KEY ("city_id")
/

-- Table State

CREATE TABLE "State"(
  "state_id" Integer NOT NULL,
  "state_name" Varchar2(20 ),
  "country_id" Integer NOT NULL
)
/

-- Create indexes for table State

CREATE INDEX "IX_Relationship20" ON "State" ("country_id")
/

-- Add keys for table State

ALTER TABLE "State" ADD CONSTRAINT "Key8" PRIMARY KEY ("state_id")
/

-- Table Country

CREATE TABLE "Country"(
  "country_id" Integer NOT NULL,
  "country_name" Varchar2(20 )
)
/

-- Add keys for table Country

ALTER TABLE "Country" ADD CONSTRAINT "Key9" PRIMARY KEY ("country_id")
/

-- Table Director

CREATE TABLE "Director"(
  "director_id" Integer NOT NULL,
  "director_bio" Varchar2(255 ),
  "director_image" Blob,
  "person_id" Integer NOT NULL
)
/

-- Create indexes for table Director

CREATE INDEX "IX_Relationship14" ON "Director" ("person_id")
/

-- Add keys for table Director

ALTER TABLE "Director" ADD CONSTRAINT "Key10" PRIMARY KEY ("director_id")
/

-- Table Star

CREATE TABLE "Star"(
  "star_id" Integer NOT NULL,
  "star_bio" Varchar2(255 ),
  "star_image" Blob,
  "person_id" Integer NOT NULL
)
/

-- Create indexes for table Star

CREATE INDEX "IX_Relationship15" ON "Star" ("person_id")
/

-- Add keys for table Star

ALTER TABLE "Star" ADD CONSTRAINT "Key11" PRIMARY KEY ("star_id")
/

-- Table Trailer

CREATE TABLE "Trailer"(
  "trailer_id" Integer NOT NULL,
  "trailer_duration" Varchar2(5 ),
  "trailer_link" Varchar2(255 ),
  "movie_id" Integer NOT NULL
)
/

-- Create indexes for table Trailer

CREATE INDEX "IX_Relationship22" ON "Trailer" ("movie_id")
/

-- Add keys for table Trailer

ALTER TABLE "Trailer" ADD CONSTRAINT "Key12" PRIMARY KEY ("trailer_id")
/

-- Table User

CREATE TABLE "User"(
  "user_id" Integer NOT NULL,
  "email_id" Varchar2(30 ) NOT NULL,
  "password" Varchar2(32 ),
  "person_id" Integer NOT NULL
)
/

-- Create indexes for table User

CREATE INDEX "IX_Relationship17" ON "User" ("person_id")
/

-- Add keys for table User

ALTER TABLE "User" ADD CONSTRAINT "Key13" PRIMARY KEY ("user_id")
/

ALTER TABLE "User" ADD CONSTRAINT "email_id" UNIQUE ("email_id")
/

-- Table Address

CREATE TABLE "Address"(
  "address_id" Integer NOT NULL,
  "address_line1" Varchar2(50 ),
  "zipcode" Varchar2(6 ),
  "city_id" Integer NOT NULL
)
/

-- Create indexes for table Address

CREATE INDEX "IX_Relationship23" ON "Address" ("city_id")
/

-- Add keys for table Address

ALTER TABLE "Address" ADD CONSTRAINT "Key15" PRIMARY KEY ("address_id")
/

-- Table Theatre

CREATE TABLE "Theatre"(
  "theatre_id" Integer NOT NULL,
  "theatre_name" Varchar2(30 ),
  "phone_no" Varchar2(10 ) NOT NULL,
  "address_id" Integer NOT NULL
)
/

-- Create indexes for table Theatre

CREATE INDEX "IX_Relationship24" ON "Theatre" ("address_id")
/

-- Add keys for table Theatre

ALTER TABLE "Theatre" ADD CONSTRAINT "Key16" PRIMARY KEY ("theatre_id")
/

ALTER TABLE "Theatre" ADD CONSTRAINT "phone_no" UNIQUE ("phone_no")
/

-- Table Rating

CREATE TABLE "Rating"(
  "rating_id" Integer NOT NULL,
  "rating_score" Float,
  "movie_id" Integer,
  "user_id" Integer NOT NULL,
  "tvshow_id" Integer
)
/

-- Create indexes for table Rating

CREATE INDEX "IX_Relationship27" ON "Rating" ("movie_id")
/

CREATE INDEX "IX_Relationship28" ON "Rating" ("user_id")
/

CREATE INDEX "IX_Relationship1" ON "Rating" ("tvshow_id")
/

-- Add keys for table Rating

ALTER TABLE "Rating" ADD CONSTRAINT "Key17" PRIMARY KEY ("rating_id")
/

-- Table Writer

CREATE TABLE "Writer"(
  "writer_id" Integer NOT NULL,
  "writer_bio" Varchar2(255 ),
  "writer_image" Blob,
  "person_id" Integer NOT NULL
)
/

-- Create indexes for table Writer

CREATE INDEX "IX_Relationship16" ON "Writer" ("person_id")
/

-- Add keys for table Writer

ALTER TABLE "Writer" ADD CONSTRAINT "Key18" PRIMARY KEY ("writer_id")
/

-- Table Collection

CREATE TABLE "Collection"(
  "collection_id" Integer NOT NULL,
  "collection_amount" Float,
  "collection_date" Date,
  "collection_day" Varchar2(9 ),
  "movie_id" Integer NOT NULL
)
/

-- Create indexes for table Collection

CREATE INDEX "IX_Relationship29" ON "Collection" ("movie_id")
/

-- Add keys for table Collection

ALTER TABLE "Collection" ADD CONSTRAINT "Key19" PRIMARY KEY ("collection_id")
/

-- Table Channel

CREATE TABLE "Channel"(
  "channel_id" Integer NOT NULL,
  "channel_name" Varchar2(20 ),
  "channel_logo" Blob
)
/

-- Add keys for table Channel

ALTER TABLE "Channel" ADD CONSTRAINT "Key20" PRIMARY KEY ("channel_id")
/

-- Table TV_Shows

CREATE TABLE "TV_Shows"(
  "tvshow_id" Integer NOT NULL,
  "tvshow_name" Varchar2(30 ),
  "tvshow_rating" Varchar2(5 ),
  "tvshow_duration" Integer,
  "tvshow_release_year" Date,
  "tvshow_end_year" Date,
  "tvshow_imdb_rating" Float,
  "tvshow_description" Varchar2(255 ),
  "watchnow_link" Varchar2(255 ),
  "tvshow_image" Blob,
  "tvshow_votes" Integer
)
/

-- Add keys for table TV_Shows

ALTER TABLE "TV_Shows" ADD CONSTRAINT "Key21" PRIMARY KEY ("tvshow_id")
/

-- Table Creator

CREATE TABLE "Creator"(
  "creator_id" Integer NOT NULL,
  "creator_bio" Varchar2(255 ),
  "creator_image" Blob,
  "person_id" Integer NOT NULL
)
/

-- Create indexes for table Creator

CREATE INDEX "IX_Relationship" ON "Creator" ("person_id")
/

-- Add keys for table Creator

ALTER TABLE "Creator" ADD CONSTRAINT "Key22" PRIMARY KEY ("creator_id")
/

-- Table Episodes

CREATE TABLE "Episodes"(
  "episode_id" Integer NOT NULL,
  "episode_no" Integer,
  "episode_name" Varchar2(50 ),
  "episode_description" Varchar2(255 ),
  "season_id" Integer NOT NULL
)
/

-- Create indexes for table Episodes

CREATE INDEX "IX_Relationship38" ON "Episodes" ("season_id")
/

-- Add keys for table Episodes

ALTER TABLE "Episodes" ADD CONSTRAINT "Key23" PRIMARY KEY ("episode_id")
/

-- Table Release_List

CREATE TABLE "Release_List"(
  "list_id" Integer NOT NULL,
  "list_name" Varchar2(30 ),
  "list_author" Varchar2(20 ),
  "list_published_on" Date,
  "list_image" Blob
)
/

-- Add keys for table Release_List

ALTER TABLE "Release_List" ADD CONSTRAINT "Key24" PRIMARY KEY ("list_id")
/

-- Table News

CREATE TABLE "News"(
  "news_id" Integer NOT NULL,
  "news_title" Varchar2(255 ),
  "published_date" Date,
  "news_image" Blob,
  "news_description" Varchar2(255 ),
  "news_source_name" Varchar2(50 ),
  "recent_source_name_news" Varchar2(50 ),
  "permalink" Varchar2(50 ),
  "full_article_link" Varchar2(255 ),
  "movie_id" Integer,
  "director_id" Integer,
  "star_id" Integer,
  "tvshow_id" Integer
)
/

-- Create indexes for table News

CREATE INDEX "IX_Relationship59" ON "News" ("movie_id")
/

CREATE INDEX "IX_Relationship60" ON "News" ("director_id")
/

CREATE INDEX "IX_Relationship61" ON "News" ("star_id")
/

CREATE INDEX "IX_Relationship62" ON "News" ("tvshow_id")
/

-- Add keys for table News

ALTER TABLE "News" ADD CONSTRAINT "Key25" PRIMARY KEY ("news_id")
/

-- Table News_Type

CREATE TABLE "News_Type"(
  "type_id" Integer NOT NULL,
  "type_name" Varchar2(30 )
)
/

-- Add keys for table News_Type

ALTER TABLE "News_Type" ADD CONSTRAINT "Key26" PRIMARY KEY ("type_id")
/

-- Table Award

CREATE TABLE "Award"(
  "award_id" Integer NOT NULL,
  "award_name" Varchar2(50 ),
  "award_date" Date,
  "award_description" Varchar2(255 )
)
/

-- Add keys for table Award

ALTER TABLE "Award" ADD CONSTRAINT "Key27" PRIMARY KEY ("award_id")
/

-- Table Award_Category

CREATE TABLE "Award_Category"(
  "category_id" Integer NOT NULL,
  "category_name" Varchar2(50 )
)
/

-- Add keys for table Award_Category

ALTER TABLE "Award_Category" ADD CONSTRAINT "Key28" PRIMARY KEY ("category_id")
/

-- Table Award_Nominations

CREATE TABLE "Award_Nominations"(
  "nominations_id" Integer NOT NULL,
  "is_winner" Char(1 ),
  "movie_id" Integer,
  "director_id" Integer,
  "star_id" Integer,
  "tvshow_id" Integer
)
/

-- Create indexes for table Award_Nominations

CREATE INDEX "IX_Relationship46" ON "Award_Nominations" ("movie_id")
/

CREATE INDEX "IX_Relationship47" ON "Award_Nominations" ("director_id")
/

CREATE INDEX "IX_Relationship48" ON "Award_Nominations" ("star_id")
/

CREATE INDEX "IX_Relationship49" ON "Award_Nominations" ("tvshow_id")
/

-- Add keys for table Award_Nominations

ALTER TABLE "Award_Nominations" ADD CONSTRAINT "Key29" PRIMARY KEY ("nominations_id")
/

-- Table Poll

CREATE TABLE "Poll"(
  "poll_id" Integer NOT NULL,
  "poll_name" Varchar2(50 ),
  "created_by" Varchar2(20 ),
  "poll_description" Varchar2(255 ),
  "poll_image" Blob,
  "is_featured_poll" Char(1 ),
  "is_hotly_poll" Char(1 )
)
/

-- Add keys for table Poll

ALTER TABLE "Poll" ADD CONSTRAINT "Key30" PRIMARY KEY ("poll_id")
/

-- Table Poll_Nominations

CREATE TABLE "Poll_Nominations"(
  "nominations_id" Integer NOT NULL,
  "is_winner" Char(1 ),
  "movie_id" Integer,
  "tvshow_id" Integer
)
/

-- Create indexes for table Poll_Nominations

CREATE INDEX "IX_Relationship52" ON "Poll_Nominations" ("movie_id")
/

CREATE INDEX "IX_Relationship54" ON "Poll_Nominations" ("tvshow_id")
/

-- Add keys for table Poll_Nominations

ALTER TABLE "Poll_Nominations" ADD CONSTRAINT "Key31" PRIMARY KEY ("nominations_id")
/

-- Table Movies_Genre

CREATE TABLE "Movies_Genre"(
  "movie_id" Integer NOT NULL,
  "genre_id" Integer NOT NULL
)
/

-- Add keys for table Movies_Genre

ALTER TABLE "Movies_Genre" ADD CONSTRAINT "Key32" PRIMARY KEY ("movie_id","genre_id")
/

-- Table Movies_Director

CREATE TABLE "Movies_Director"(
  "movie_id" Integer NOT NULL,
  "director_id" Integer NOT NULL
)
/

-- Add keys for table Movies_Director

ALTER TABLE "Movies_Director" ADD CONSTRAINT "Key33" PRIMARY KEY ("movie_id","director_id")
/

-- Table Movies_Star

CREATE TABLE "Movies_Star"(
  "movie_id" Integer NOT NULL,
  "star_id" Integer NOT NULL
)
/

-- Add keys for table Movies_Star

ALTER TABLE "Movies_Star" ADD CONSTRAINT "Key34" PRIMARY KEY ("movie_id","star_id")
/

-- Table Movies_Writer

CREATE TABLE "Movies_Writer"(
  "movie_id" Integer NOT NULL,
  "writer_id" Integer NOT NULL
)
/

-- Add keys for table Movies_Writer

ALTER TABLE "Movies_Writer" ADD CONSTRAINT "Key35" PRIMARY KEY ("movie_id","writer_id")
/

-- Table Showtimes

CREATE TABLE "Showtimes"(
  "theatre_id" Integer NOT NULL,
  "movie_id" Integer NOT NULL,
  "showtimes" Varchar2(8 ) NOT NULL,
  "show_date" Date NOT NULL
)
/

-- Add keys for table Showtimes

ALTER TABLE "Showtimes" ADD CONSTRAINT "Key36" PRIMARY KEY ("theatre_id","movie_id","showtimes","show_date")
/

-- Table TV_Shows_Star

CREATE TABLE "TV_Shows_Star"(
  "star_id" Integer NOT NULL,
  "tvshow_id" Integer NOT NULL
)
/

-- Add keys for table TV_Shows_Star

ALTER TABLE "TV_Shows_Star" ADD CONSTRAINT "Key37" PRIMARY KEY ("star_id","tvshow_id")
/

-- Table TVShows_Creator

CREATE TABLE "TVShows_Creator"(
  "tvshow_id" Integer NOT NULL,
  "creator_id" Integer NOT NULL
)
/

-- Add keys for table TVShows_Creator

ALTER TABLE "TVShows_Creator" ADD CONSTRAINT "Key38" PRIMARY KEY ("tvshow_id","creator_id")
/

-- Table Timeslots

CREATE TABLE "Timeslots"(
  "channel_id" Integer NOT NULL,
  "episode_id" Integer NOT NULL,
  "start_time" Varchar2(5 ),
  "date_value" Date,
  "end_time" Varchar2(5 )
)
/

-- Add keys for table Timeslots

ALTER TABLE "Timeslots" ADD CONSTRAINT "Key39" PRIMARY KEY ("channel_id","episode_id")
/

-- Table Seasons

CREATE TABLE "Seasons"(
  "season_id" Integer NOT NULL,
  "season_name" Varchar2(20 ),
  "tvshow_id" Integer NOT NULL
)
/

-- Create indexes for table Seasons

CREATE INDEX "IX_Relationship37" ON "Seasons" ("tvshow_id")
/

-- Add keys for table Seasons

ALTER TABLE "Seasons" ADD CONSTRAINT "Key40" PRIMARY KEY ("season_id")
/

-- Table Movies_List

CREATE TABLE "Movies_List"(
  "list_id" Integer NOT NULL,
  "movie_id" Integer NOT NULL
)
/

-- Add keys for table Movies_List

ALTER TABLE "Movies_List" ADD CONSTRAINT "Key41" PRIMARY KEY ("list_id","movie_id")
/

-- Table Award_AwardCategory

CREATE TABLE "Award_AwardCategory"(
  "award_id" Integer NOT NULL,
  "category_id" Integer NOT NULL
)
/

-- Add keys for table Award_AwardCategory

ALTER TABLE "Award_AwardCategory" ADD CONSTRAINT "Key42" PRIMARY KEY ("award_id","category_id")
/

-- Table Category_Nominations

CREATE TABLE "Category_Nominations"(
  "category_id" Integer NOT NULL,
  "nominations_id" Integer NOT NULL
)
/

-- Add keys for table Category_Nominations

ALTER TABLE "Category_Nominations" ADD CONSTRAINT "Key43" PRIMARY KEY ("category_id","nominations_id")
/

-- Table Poll_PollNominations

CREATE TABLE "Poll_PollNominations"(
  "poll_id" Integer NOT NULL,
  "nominations_id" Integer NOT NULL
)
/

-- Add keys for table Poll_PollNominations

ALTER TABLE "Poll_PollNominations" ADD CONSTRAINT "Key44" PRIMARY KEY ("poll_id","nominations_id")
/

-- Table News_List

CREATE TABLE "News_List"(
  "news_id" Integer NOT NULL,
  "type_id" Integer NOT NULL
)
/

-- Add keys for table News_List

ALTER TABLE "News_List" ADD CONSTRAINT "Key45" PRIMARY KEY ("news_id","type_id")
/

-- Table Movies_Watchlist

CREATE TABLE "Movies_Watchlist"(
  "movie_id" Integer NOT NULL,
  "user_id" Integer NOT NULL
)
/

-- Add keys for table Movies_Watchlist

ALTER TABLE "Movies_Watchlist" ADD CONSTRAINT "Key46" PRIMARY KEY ("user_id","movie_id")
/

-- Table TVShows_Watchlist

CREATE TABLE "TVShows_Watchlist"(
  "tvshow_id" Integer NOT NULL,
  "user_id" Integer NOT NULL
)
/

-- Add keys for table TVShows_Watchlist

ALTER TABLE "TVShows_Watchlist" ADD CONSTRAINT "Key47" PRIMARY KEY ("user_id","tvshow_id")
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE "News_List" ADD CONSTRAINT "FK_News_Type_News_List_TypeID" FOREIGN KEY ("type_id") REFERENCES "News_Type" ("type_id")
/

ALTER TABLE "News_List" ADD CONSTRAINT "FK_News_News_List_NewsID" FOREIGN KEY ("news_id") REFERENCES "News" ("news_id")
/

ALTER TABLE "Poll_Nominations" ADD CONSTRAINT "FK_TV_Poll_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "Poll_PollNominations" ADD CONSTRAINT "FK_Poll_Nominee_NominationsID" FOREIGN KEY ("nominations_id") REFERENCES "Poll_Nominations" ("nominations_id")
/

ALTER TABLE "Poll_PollNominations" ADD CONSTRAINT "FK_Poll_Nominations_PollID" FOREIGN KEY ("poll_id") REFERENCES "Poll" ("poll_id")
/

ALTER TABLE "Award_Nominations" ADD CONSTRAINT "FK_TV_Nominations_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "Award_Nominations" ADD CONSTRAINT "FK_Star_AwardNomination_StarID" FOREIGN KEY ("star_id") REFERENCES "Star" ("star_id")
/

ALTER TABLE "Award_Nominations" ADD CONSTRAINT "FK_Director_Nominee_DirectorID" FOREIGN KEY ("director_id") REFERENCES "Director" ("director_id")
/

ALTER TABLE "Category_Nominations" ADD CONSTRAINT "FK_Award_NominationsID" FOREIGN KEY ("nominations_id") REFERENCES "Award_Nominations" ("nominations_id")
/

ALTER TABLE "Category_Nominations" ADD CONSTRAINT "FK_Award_Nomination_CategoryID" FOREIGN KEY ("category_id") REFERENCES "Award_Category" ("category_id")
/

ALTER TABLE "Award_AwardCategory" ADD CONSTRAINT "FK_Award_Category_CategoryID" FOREIGN KEY ("category_id") REFERENCES "Award_Category" ("category_id")
/

ALTER TABLE "Award_AwardCategory" ADD CONSTRAINT "FK_Award_Category_AwardID" FOREIGN KEY ("award_id") REFERENCES "Award" ("award_id")
/

ALTER TABLE "Movies_List" ADD CONSTRAINT "FK_MoviesList_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Movies_List" ADD CONSTRAINT "FK_ReleaseList_ListID" FOREIGN KEY ("list_id") REFERENCES "Release_List" ("list_id")
/

ALTER TABLE "Episodes" ADD CONSTRAINT "FK_Seasons_Episodes_SeasonID" FOREIGN KEY ("season_id") REFERENCES "Seasons" ("season_id")
/

ALTER TABLE "Seasons" ADD CONSTRAINT "FK_TV_Shows_Seasons_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "Timeslots" ADD CONSTRAINT "FK_Episode_Timeslots_EpisodeID" FOREIGN KEY ("episode_id") REFERENCES "Episodes" ("episode_id")
/

ALTER TABLE "Timeslots" ADD CONSTRAINT "FK_Channel_Timeslots_ChannelID" FOREIGN KEY ("channel_id") REFERENCES "Channel" ("channel_id")
/

ALTER TABLE "TVShows_Creator" ADD CONSTRAINT "FK_Creator_TVShows_CreatorID" FOREIGN KEY ("creator_id") REFERENCES "Creator" ("creator_id")
/

ALTER TABLE "TVShows_Creator" ADD CONSTRAINT "FK_TVShows_Creator_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "TV_Shows_Star" ADD CONSTRAINT "FK_TV_Shows_Star_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "TV_Shows_Star" ADD CONSTRAINT "FK_Star_TV_Shows_StarID" FOREIGN KEY ("star_id") REFERENCES "Star" ("star_id")
/

ALTER TABLE "Rating" ADD CONSTRAINT "FK_User_Rating_UserID" FOREIGN KEY ("user_id") REFERENCES "User" ("user_id") ON DELETE CASCADE
/

ALTER TABLE "Rating" ADD CONSTRAINT "FK_Movies_Rating_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Showtimes" ADD CONSTRAINT "FK_Movies_Showtimes_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Showtimes" ADD CONSTRAINT "FK_Theatre_Showtimes_TheatreID" FOREIGN KEY ("theatre_id") REFERENCES "Theatre" ("theatre_id")
/

ALTER TABLE "Theatre" ADD CONSTRAINT "FK_Address_Theatre_AddressID" FOREIGN KEY ("address_id") REFERENCES "Address" ("address_id")
/

ALTER TABLE "Address" ADD CONSTRAINT "FK_City_Address_CityID" FOREIGN KEY ("city_id") REFERENCES "City" ("city_id")
/

ALTER TABLE "Trailer" ADD CONSTRAINT "FK_Movies_Trailer_MoviesID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "State" ADD CONSTRAINT "FK_Country_State_CountryID" FOREIGN KEY ("country_id") REFERENCES "Country" ("country_id")
/

ALTER TABLE "City" ADD CONSTRAINT "FK_State_City_StateID" FOREIGN KEY ("state_id") REFERENCES "State" ("state_id")
/

ALTER TABLE "Person" ADD CONSTRAINT "FK_City_Person_CityID" FOREIGN KEY ("city_id") REFERENCES "City" ("city_id")
/

ALTER TABLE "User" ADD CONSTRAINT "FK_Person_User_PersonID" FOREIGN KEY ("person_id") REFERENCES "Person" ("person_id")
/

ALTER TABLE "Writer" ADD CONSTRAINT "FK_Person_Writer_PersonID" FOREIGN KEY ("person_id") REFERENCES "Person" ("person_id")
/

ALTER TABLE "Star" ADD CONSTRAINT "FK_Person_Star_PersonID" FOREIGN KEY ("person_id") REFERENCES "Person" ("person_id")
/

ALTER TABLE "Director" ADD CONSTRAINT "FK_Person_Director_PersonID" FOREIGN KEY ("person_id") REFERENCES "Person" ("person_id")
/

ALTER TABLE "Movies_Writer" ADD CONSTRAINT "FK_Writer_Movies_WriterID" FOREIGN KEY ("writer_id") REFERENCES "Writer" ("writer_id")
/

ALTER TABLE "Movies_Writer" ADD CONSTRAINT "FK_MoviesWriter_MoviesID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Metacritic_Review" ADD CONSTRAINT "FK_Author_Review_AuthorID" FOREIGN KEY ("author_id") REFERENCES "Author" ("author_id")
/

ALTER TABLE "Author" ADD CONSTRAINT "FK_Magazine_Author_MagazineID" FOREIGN KEY ("magazine_id") REFERENCES "Magazine" ("magazine_id")
/

ALTER TABLE "Metacritic_Review" ADD CONSTRAINT "FK_Magazine_Review_MagazineID" FOREIGN KEY ("magazine_id") REFERENCES "Magazine" ("magazine_id")
/

ALTER TABLE "Metacritic_Review" ADD CONSTRAINT "FK_MoviesReview_MoviesID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Movies_Star" ADD CONSTRAINT "FK_Star_Movies_Star_StarID" FOREIGN KEY ("star_id") REFERENCES "Star" ("star_id")
/

ALTER TABLE "Movies_Star" ADD CONSTRAINT "FK_Movies_Star_MoviesID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Movies_Director" ADD CONSTRAINT "FK_Director_Movies_DirectorID" FOREIGN KEY ("director_id") REFERENCES "Director" ("director_id")
/

ALTER TABLE "Movies_Director" ADD CONSTRAINT "FK_Movies_Director_MoviesID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Movies_Genre" ADD CONSTRAINT "FK_Genre_Movies_GenreID" FOREIGN KEY ("genre_id") REFERENCES "Genre" ("genre_id")
/

ALTER TABLE "Movies_Genre" ADD CONSTRAINT "FK_Movies_Genre_MoviesID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Collection" ADD CONSTRAINT "FK_Movies_Collection_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Movies_Watchlist" ADD CONSTRAINT "FK_User_Watchlist_UserID" FOREIGN KEY ("user_id") REFERENCES "User" ("user_id") ON DELETE CASCADE
/

ALTER TABLE "Poll_Nominations" ADD CONSTRAINT "FK_Movies_PollNominee_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Movies_Watchlist" ADD CONSTRAINT "FK_Movies_Watchlist_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "TVShows_Watchlist" ADD CONSTRAINT "FK_TVShows_Watchlist_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "TVShows_Watchlist" ADD CONSTRAINT "FK_User_TVWatchlist_UserID" FOREIGN KEY ("user_id") REFERENCES "User" ("user_id") ON DELETE CASCADE
/

ALTER TABLE "News" ADD CONSTRAINT "FK_Movie_News_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "News" ADD CONSTRAINT "FK_Director_News_DirectorID" FOREIGN KEY ("director_id") REFERENCES "Director" ("director_id")
/

ALTER TABLE "News" ADD CONSTRAINT "FK_Star_News_StarID" FOREIGN KEY ("star_id") REFERENCES "Star" ("star_id")
/

ALTER TABLE "News" ADD CONSTRAINT "FK_TV_Shows_News_TV_ShowsID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "Award_Nominations" ADD CONSTRAINT "FK_Movies_Nominations_MovieID" FOREIGN KEY ("movie_id") REFERENCES "Movies" ("movie_id")
/

ALTER TABLE "Rating" ADD CONSTRAINT "FK_TVShows_Rating_TVShowID" FOREIGN KEY ("tvshow_id") REFERENCES "TV_Shows" ("tvshow_id")
/

ALTER TABLE "Creator" ADD CONSTRAINT "FK_Person_Creator_PersonID" FOREIGN KEY ("person_id") REFERENCES "Person" ("person_id")
/

