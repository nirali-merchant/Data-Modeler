/*
Created: 12/3/2016
Modified: 12/8/2016
Model: Microsoft SQL Server 2016
Database: MS SQL Server 2016
*/


-- Create tables section -------------------------------------------------

-- Table Movies

CREATE TABLE [Movies]
(
 [movie_id] Int NOT NULL,
 [movie_name] Varchar(30) NULL,
 [movie_rating] Varchar(5) NULL,
 [movie_duration] Int NULL,
 [metascore_value] Int NULL,
 [movie_description] Varchar(255) NULL,
 [release_date] Date NULL,
 [movie_image] Varbinary(max) NULL,
 [imdb_rating] Float NULL,
 [movie_votes] Int NULL,
 [is_oscar_winner] Char(1) NULL,
 [dvd_link] Varchar(30) NULL,
 [bluray_link] Varchar(30) NULL
)
go

-- Add keys for table Movies

ALTER TABLE [Movies] ADD CONSTRAINT [Key1] PRIMARY KEY ([movie_id])
go

-- Table Genre

CREATE TABLE [Genre]
(
 [genre_id] Int NOT NULL,
 [genre_name] Varchar(20) NULL
)
go

-- Add keys for table Genre

ALTER TABLE [Genre] ADD CONSTRAINT [Key2] PRIMARY KEY ([genre_id])
go

-- Table Metacritic_Review

CREATE TABLE [Metacritic_Review]
(
 [review_id] Int NOT NULL,
 [review_score] Int NULL,
 [review_description] Varchar(255) NULL,
 [movie_id] Int NULL,
 [magazine_id] Int NULL,
 [author_id] Int NULL
)
go

-- Create indexes for table Metacritic_Review

CREATE INDEX [IX_Relationship7] ON [Metacritic_Review] ([movie_id])
go

CREATE INDEX [IX_Relationship8] ON [Metacritic_Review] ([magazine_id])
go

CREATE INDEX [IX_Relationship10] ON [Metacritic_Review] ([author_id])
go

-- Add keys for table Metacritic_Review

ALTER TABLE [Metacritic_Review] ADD CONSTRAINT [Key3] PRIMARY KEY ([review_id])
go

-- Table Magazine

CREATE TABLE [Magazine]
(
 [magazine_id] Int NOT NULL,
 [magazine_name] Varchar(20) NULL
)
go

-- Add keys for table Magazine

ALTER TABLE [Magazine] ADD CONSTRAINT [Key4] PRIMARY KEY ([magazine_id])
go

-- Table Author

CREATE TABLE [Author]
(
 [author_id] Int NOT NULL,
 [author_name] Varchar(20) NULL,
 [magazine_id] Int NOT NULL
)
go

-- Create indexes for table Author

CREATE INDEX [IX_Relationship9] ON [Author] ([magazine_id])
go

-- Add keys for table Author

ALTER TABLE [Author] ADD CONSTRAINT [Key5] PRIMARY KEY ([author_id])
go

-- Table Person

CREATE TABLE [Person]
(
 [person_id] Int NOT NULL,
 [first_name] Varchar(20) NULL,
 [last_name] Varchar(20) NULL,
 [birth_date] Int NULL,
 [birth_month] Varchar(9) NULL,
 [birth_year] Int NULL,
 [city_id] Int NOT NULL
)
go

-- Create indexes for table Person

CREATE INDEX [IX_Relationship18] ON [Person] ([city_id])
go

-- Add keys for table Person

ALTER TABLE [Person] ADD CONSTRAINT [Key6] PRIMARY KEY ([person_id])
go

-- Table City

CREATE TABLE [City]
(
 [city_id] Int NOT NULL,
 [city_name] Varchar(20) NULL,
 [state_id] Int NOT NULL
)
go

-- Create indexes for table City

CREATE INDEX [IX_Relationship19] ON [City] ([state_id])
go

-- Add keys for table City

ALTER TABLE [City] ADD CONSTRAINT [Key7] PRIMARY KEY ([city_id])
go

-- Table State

CREATE TABLE [State]
(
 [state_id] Int NOT NULL,
 [state_name] Varchar(20) NULL,
 [country_id] Int NOT NULL
)
go

-- Create indexes for table State

CREATE INDEX [IX_Relationship20] ON [State] ([country_id])
go

-- Add keys for table State

ALTER TABLE [State] ADD CONSTRAINT [Key8] PRIMARY KEY ([state_id])
go

-- Table Country

CREATE TABLE [Country]
(
 [country_id] Int NOT NULL,
 [country_name] Varchar(20) NULL
)
go

-- Add keys for table Country

ALTER TABLE [Country] ADD CONSTRAINT [Key9] PRIMARY KEY ([country_id])
go

-- Table Director

CREATE TABLE [Director]
(
 [director_id] Int NOT NULL,
 [director_bio] Varchar(255) NULL,
 [director_image] Image NULL,
 [person_id] Int NOT NULL
)
go

-- Create indexes for table Director

CREATE INDEX [IX_Relationship14] ON [Director] ([person_id])
go

-- Add keys for table Director

ALTER TABLE [Director] ADD CONSTRAINT [Key10] PRIMARY KEY ([director_id])
go

-- Table Star

CREATE TABLE [Star]
(
 [star_id] Int NOT NULL,
 [star_bio] Varchar(255) NULL,
 [star_image] Image NULL,
 [person_id] Int NOT NULL
)
go

-- Create indexes for table Star

CREATE INDEX [IX_Relationship15] ON [Star] ([person_id])
go

-- Add keys for table Star

ALTER TABLE [Star] ADD CONSTRAINT [Key11] PRIMARY KEY ([star_id])
go

-- Table Trailer

CREATE TABLE [Trailer]
(
 [trailer_id] Int NOT NULL,
 [trailer_duration] Date NULL,
 [trailer_link] Varchar(50) NULL,
 [movie_id] Int NOT NULL
)
go

-- Create indexes for table Trailer

CREATE INDEX [IX_Relationship22] ON [Trailer] ([movie_id])
go

-- Add keys for table Trailer

ALTER TABLE [Trailer] ADD CONSTRAINT [Key12] PRIMARY KEY ([trailer_id])
go

-- Table User

CREATE TABLE [User]
(
 [user_id] Int NOT NULL,
 [email_id] Varchar(30) NOT NULL,
 [password] Varchar(32) NULL,
 [person_id] Int NOT NULL
)
go

-- Create indexes for table User

CREATE INDEX [IX_Relationship17] ON [User] ([person_id])
go

-- Add keys for table User

ALTER TABLE [User] ADD CONSTRAINT [Key13] PRIMARY KEY ([user_id])
go

ALTER TABLE [User] ADD CONSTRAINT [email_id] UNIQUE CLUSTERED ([email_id])
go

-- Table Address

CREATE TABLE [Address]
(
 [address_id] Int NOT NULL,
 [address_line1] Varchar(20) NULL,
 [zipcode] Varchar(6) NULL,
 [city_id] Int NOT NULL
)
go

-- Create indexes for table Address

CREATE INDEX [IX_Relationship23] ON [Address] ([city_id])
go

-- Add keys for table Address

ALTER TABLE [Address] ADD CONSTRAINT [Key15] PRIMARY KEY ([address_id])
go

-- Table Theatre

CREATE TABLE [Theatre]
(
 [theatre_id] Int NOT NULL,
 [theatre_name] Varchar(30) NULL,
 [phone_no] Varchar(10) NOT NULL,
 [address_id] Int NOT NULL
)
go

-- Create indexes for table Theatre

CREATE INDEX [IX_Relationship24] ON [Theatre] ([address_id])
go

-- Add keys for table Theatre

ALTER TABLE [Theatre] ADD CONSTRAINT [Key16] PRIMARY KEY NONCLUSTERED ([theatre_id])
go

ALTER TABLE [Theatre] ADD CONSTRAINT [phone_no] UNIQUE ([phone_no])
go

-- Table Rating

CREATE TABLE [Rating]
(
 [rating_id] Int NOT NULL,
 [rating_score] Float NULL,
 [movie_id] Int NULL,
 [user_id] Int NOT NULL,
 [tvshow_id] Int NULL
)
go

-- Create indexes for table Rating

CREATE INDEX [IX_Relationship27] ON [Rating] ([movie_id])
go

CREATE INDEX [IX_Relationship28] ON [Rating] ([user_id])
go

CREATE INDEX [IX_Relationship1] ON [Rating] ([tvshow_id])
go

-- Add keys for table Rating

ALTER TABLE [Rating] ADD CONSTRAINT [Key17] PRIMARY KEY ([rating_id])
go

-- Table Writer

CREATE TABLE [Writer]
(
 [writer_id] Int NOT NULL,
 [writer_bio] Varchar(255) NULL,
 [writer_image] Image NULL,
 [person_id] Int NOT NULL
)
go

-- Create indexes for table Writer

CREATE INDEX [IX_Relationship16] ON [Writer] ([person_id])
go

-- Add keys for table Writer

ALTER TABLE [Writer] ADD CONSTRAINT [Key18] PRIMARY KEY ([writer_id])
go

-- Table Collection

CREATE TABLE [Collection]
(
 [collection_id] Int NOT NULL,
 [collection_amount] Float NULL,
 [collection_date] Date NULL,
 [collection_day] Varchar(9) NULL,
 [movie_id] Int NOT NULL
)
go

-- Create indexes for table Collection

CREATE INDEX [IX_Relationship29] ON [Collection] ([movie_id])
go

-- Add keys for table Collection

ALTER TABLE [Collection] ADD CONSTRAINT [Key19] PRIMARY KEY ([collection_id])
go

-- Table Channel

CREATE TABLE [Channel]
(
 [channel_id] Int NOT NULL,
 [channel_name] Varchar(20) NULL,
 [channel_logo] Image NULL
)
go

-- Add keys for table Channel

ALTER TABLE [Channel] ADD CONSTRAINT [Key20] PRIMARY KEY ([channel_id])
go

-- Table TV_Shows

CREATE TABLE [TV_Shows]
(
 [tvshow_id] Int NOT NULL,
 [tvshow_name] Varchar(30) NULL,
 [tvshow_rating] Varchar(5) NULL,
 [tvshow_duration] Int NULL,
 [tvshow_release_year] Date NULL,
 [tvshow_end_year] Date NULL,
 [tvshow_imdb_rating] Float NULL,
 [tvshow_description] Varchar(255) NULL,
 [watchnow_link] Varchar(30) NULL,
 [tvshow_image] Image NULL,
 [tvshow_votes] Int NULL
)
go

-- Add keys for table TV_Shows

ALTER TABLE [TV_Shows] ADD CONSTRAINT [Key21] PRIMARY KEY ([tvshow_id])
go

-- Table Creator

CREATE TABLE [Creator]
(
 [creator_id] Int NOT NULL,
 [creator_bio] Varchar(255) NULL,
 [creator_image] Image NULL,
 [person_id] Int NOT NULL
)
go

-- Create indexes for table Creator

CREATE INDEX [IX_Relationship1] ON [Creator] ([person_id])
go

-- Add keys for table Creator

ALTER TABLE [Creator] ADD CONSTRAINT [Key22] PRIMARY KEY ([creator_id])
go

-- Table Episodes

CREATE TABLE [Episodes]
(
 [episode_id] Int NOT NULL,
 [episode_no] Int NULL,
 [episode_name] Varchar(30) NULL,
 [episode_description] Varchar(255) NULL,
 [season_id] Int NOT NULL
)
go

-- Create indexes for table Episodes

CREATE INDEX [IX_Relationship38] ON [Episodes] ([season_id])
go

-- Add keys for table Episodes

ALTER TABLE [Episodes] ADD CONSTRAINT [Key23] PRIMARY KEY ([episode_id])
go

-- Table Release_List

CREATE TABLE [Release_List]
(
 [list_id] Int NOT NULL,
 [list_name] Varchar(30) NULL,
 [list_author] Varchar(20) NULL,
 [list_published_on] Date NULL,
 [list_image] Image NULL
)
go

-- Add keys for table Release_List

ALTER TABLE [Release_List] ADD CONSTRAINT [Key24] PRIMARY KEY ([list_id])
go

-- Table News

CREATE TABLE [News]
(
 [news_id] Int NOT NULL,
 [news_title] Varchar(30) NULL,
 [published_date] Date NULL,
 [news_image] Image NULL,
 [news_description] Varchar(255) NULL,
 [news_source_name] Varchar(50) NULL,
 [recent_source_name_news] Varchar(50) NULL,
 [permalink] Varchar(50) NULL,
 [full_article_link] Varchar(50) NULL,
 [movie_id] Int NULL,
 [director_id] Int NULL,
 [star_id] Int NULL,
 [tvshow_id] Int NULL
)
go

-- Create indexes for table News

CREATE INDEX [IX_Relationship59] ON [News] ([movie_id])
go

CREATE INDEX [IX_Relationship60] ON [News] ([director_id])
go

CREATE INDEX [IX_Relationship61] ON [News] ([star_id])
go

CREATE INDEX [IX_Relationship62] ON [News] ([tvshow_id])
go

-- Add keys for table News

ALTER TABLE [News] ADD CONSTRAINT [Key25] PRIMARY KEY ([news_id])
go

-- Table News_Type

CREATE TABLE [News_Type]
(
 [type_id] Int NOT NULL,
 [type_name] Varchar(30) NULL
)
go

-- Add keys for table News_Type

ALTER TABLE [News_Type] ADD CONSTRAINT [Key26] PRIMARY KEY ([type_id])
go

-- Table Award

CREATE TABLE [Award]
(
 [award_id] Int NOT NULL,
 [award_name] Varchar(30) NULL,
 [award_date] Date NULL,
 [award_description] Varchar(255) NULL
)
go

-- Add keys for table Award

ALTER TABLE [Award] ADD CONSTRAINT [Key27] PRIMARY KEY ([award_id])
go

-- Table Award_Category

CREATE TABLE [Award_Category]
(
 [category_id] Int NOT NULL,
 [category_name] Varchar(30) NULL
)
go

-- Add keys for table Award_Category

ALTER TABLE [Award_Category] ADD CONSTRAINT [Key28] PRIMARY KEY ([category_id])
go

-- Table Award_Nominations

CREATE TABLE [Award_Nominations]
(
 [nominations_id] Int NOT NULL,
 [is_winner] Char(1) NULL,
 [movie_id] Int NULL,
 [director_id] Int NULL,
 [star_id] Int NULL,
 [tvshow_id] Int NULL
)
go

-- Create indexes for table Award_Nominations

CREATE INDEX [IX_Relationship46] ON [Award_Nominations] ([movie_id])
go

CREATE INDEX [IX_Relationship47] ON [Award_Nominations] ([director_id])
go

CREATE INDEX [IX_Relationship48] ON [Award_Nominations] ([star_id])
go

CREATE INDEX [IX_Relationship49] ON [Award_Nominations] ([tvshow_id])
go

-- Add keys for table Award_Nominations

ALTER TABLE [Award_Nominations] ADD CONSTRAINT [Key29] PRIMARY KEY ([nominations_id])
go

-- Table Poll

CREATE TABLE [Poll]
(
 [poll_id] Int NOT NULL,
 [poll_name] Varchar(30) NULL,
 [created_by] Varchar(20) NULL,
 [poll_description] Varchar(255) NULL,
 [poll_image] Varchar(255) NULL,
 [is_featured_poll] Char(1) NULL,
 [is_hotly_poll] Char(1) NULL,
 [poll_link] Varchar(255) NULL
)
go

-- Add keys for table Poll

ALTER TABLE [Poll] ADD CONSTRAINT [Key30] PRIMARY KEY ([poll_id])
go

-- Table Poll_Nominations

CREATE TABLE [Poll_Nominations]
(
 [nominations_id] Int NOT NULL,
 [is_winner] Char(1) NULL,
 [movie_id] Int NULL,
 [tvshow_id] Int NULL
)
go

-- Create indexes for table Poll_Nominations

CREATE INDEX [IX_Relationship52] ON [Poll_Nominations] ([movie_id])
go

CREATE INDEX [IX_Relationship54] ON [Poll_Nominations] ([tvshow_id])
go

-- Add keys for table Poll_Nominations

ALTER TABLE [Poll_Nominations] ADD CONSTRAINT [Key31] PRIMARY KEY ([nominations_id])
go

-- Table Movies_Genre

CREATE TABLE [Movies_Genre]
(
 [movie_id] Int NOT NULL,
 [genre_id] Int NOT NULL
)
go

-- Add keys for table Movies_Genre

ALTER TABLE [Movies_Genre] ADD CONSTRAINT [Key32] PRIMARY KEY ([movie_id],[genre_id])
go

-- Table Movies_Director

CREATE TABLE [Movies_Director]
(
 [movie_id] Int NOT NULL,
 [director_id] Int NOT NULL
)
go

-- Add keys for table Movies_Director

ALTER TABLE [Movies_Director] ADD CONSTRAINT [Key33] PRIMARY KEY ([movie_id],[director_id])
go

-- Table Movies_Star

CREATE TABLE [Movies_Star]
(
 [movie_id] Int NOT NULL,
 [star_id] Int NOT NULL
)
go

-- Add keys for table Movies_Star

ALTER TABLE [Movies_Star] ADD CONSTRAINT [Key34] PRIMARY KEY ([movie_id],[star_id])
go

-- Table Movies_Writer

CREATE TABLE [Movies_Writer]
(
 [movie_id] Int NOT NULL,
 [writer_id] Int NOT NULL
)
go

-- Add keys for table Movies_Writer

ALTER TABLE [Movies_Writer] ADD CONSTRAINT [Key35] PRIMARY KEY ([movie_id],[writer_id])
go

-- Table Showtimes

CREATE TABLE [Showtimes]
(
 [theatre_id] Int NOT NULL,
 [movie_id] Int NOT NULL,
 [show_time] Time(7) NOT NULL,
 [Show_Date] Date NOT NULL
)
go

-- Add keys for table Showtimes

ALTER TABLE [Showtimes] ADD CONSTRAINT [Key36] PRIMARY KEY ([theatre_id],[movie_id],[show_time],[Show_Date])
go

-- Table TV_Shows_Star

CREATE TABLE [TV_Shows_Star]
(
 [star_id] Int NOT NULL,
 [tvshow_id] Int NOT NULL
)
go

-- Add keys for table TV_Shows_Star

ALTER TABLE [TV_Shows_Star] ADD CONSTRAINT [Key37] PRIMARY KEY ([star_id],[tvshow_id])
go

-- Table TVShows_Creator

CREATE TABLE [TVShows_Creator]
(
 [tvshow_id] Int NOT NULL,
 [creator_id] Int NOT NULL
)
go

-- Add keys for table TVShows_Creator

ALTER TABLE [TVShows_Creator] ADD CONSTRAINT [Key38] PRIMARY KEY ([tvshow_id],[creator_id])
go

-- Table Timeslots

CREATE TABLE [Timeslots]
(
 [channel_id] Int NOT NULL,
 [episode_id] Int NOT NULL,
 [start_time] Time NULL,
 [date] Date NULL,
 [end_time] Time NULL
)
go

-- Add keys for table Timeslots

ALTER TABLE [Timeslots] ADD CONSTRAINT [Key39] PRIMARY KEY ([channel_id],[episode_id])
go

-- Table Seasons

CREATE TABLE [Seasons]
(
 [season_id] Int NOT NULL,
 [season_name] Varchar(20) NULL,
 [tvshow_id] Int NOT NULL
)
go

-- Create indexes for table Seasons

CREATE INDEX [IX_Relationship37] ON [Seasons] ([tvshow_id])
go

-- Add keys for table Seasons

ALTER TABLE [Seasons] ADD CONSTRAINT [Key40] PRIMARY KEY ([season_id])
go

-- Table Movies_List

CREATE TABLE [Movies_List]
(
 [list_id] Int NOT NULL,
 [movie_id] Int NOT NULL
)
go

-- Add keys for table Movies_List

ALTER TABLE [Movies_List] ADD CONSTRAINT [Key41] PRIMARY KEY ([list_id],[movie_id])
go

-- Table Award_AwardCategory

CREATE TABLE [Award_AwardCategory]
(
 [award_id] Int NOT NULL,
 [category_id] Int NOT NULL
)
go

-- Add keys for table Award_AwardCategory

ALTER TABLE [Award_AwardCategory] ADD CONSTRAINT [Key42] PRIMARY KEY ([award_id],[category_id])
go

-- Table Category_Nominations

CREATE TABLE [Category_Nominations]
(
 [category_id] Int NOT NULL,
 [nominations_id] Int NOT NULL
)
go

-- Add keys for table Category_Nominations

ALTER TABLE [Category_Nominations] ADD CONSTRAINT [Key43] PRIMARY KEY ([category_id],[nominations_id])
go

-- Table Poll_PollNominations

CREATE TABLE [Poll_PollNominations]
(
 [poll_id] Int NOT NULL,
 [nominations_id] Int NOT NULL
)
go

-- Add keys for table Poll_PollNominations

ALTER TABLE [Poll_PollNominations] ADD CONSTRAINT [Key44] PRIMARY KEY ([poll_id],[nominations_id])
go

-- Table News_List

CREATE TABLE [News_List]
(
 [news_id] Int NOT NULL,
 [type_id] Int NOT NULL
)
go

-- Add keys for table News_List

ALTER TABLE [News_List] ADD CONSTRAINT [Key45] PRIMARY KEY ([news_id],[type_id])
go

-- Table Movies_Watchlist

CREATE TABLE [Movies_Watchlist]
(
 [movie_id] Int NOT NULL,
 [user_id] Int NOT NULL
)
go

-- Add keys for table Movies_Watchlist

ALTER TABLE [Movies_Watchlist] ADD CONSTRAINT [Key46] PRIMARY KEY ([user_id],[movie_id])
go

-- Table TVShows_Watchlist

CREATE TABLE [TVShows_Watchlist]
(
 [tvshow_id] Int NOT NULL,
 [user_id] Int NOT NULL
)
go

-- Add keys for table TVShows_Watchlist

ALTER TABLE [TVShows_Watchlist] ADD CONSTRAINT [Key47] PRIMARY KEY ([user_id],[tvshow_id])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [News] ADD CONSTRAINT [FK_TV_Shows_News_TV_ShowsID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News] ADD CONSTRAINT [FK_Star_News_StarID] FOREIGN KEY ([star_id]) REFERENCES [Star] ([star_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News] ADD CONSTRAINT [FK_Director_News_DirectorID] FOREIGN KEY ([director_id]) REFERENCES [Director] ([director_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News] ADD CONSTRAINT [FK_Movie_News_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TVShows_Watchlist] ADD CONSTRAINT [FK_User_TVWatchlist_UserID] FOREIGN KEY ([user_id]) REFERENCES [User] ([user_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Poll_Nominations] ADD CONSTRAINT [FK_Movies_PollNominee_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Watchlist] ADD CONSTRAINT [FK_User_Watchlist_UserID] FOREIGN KEY ([user_id]) REFERENCES [User] ([user_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Collection] ADD CONSTRAINT [FK_Movies_Collection_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Star] ADD CONSTRAINT [FK_Star_Movies_Star_StarID] FOREIGN KEY ([star_id]) REFERENCES [Star] ([star_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Metacritic_Review] ADD CONSTRAINT [FK_MoviesReview_MoviesID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Metacritic_Review] ADD CONSTRAINT [FK_Magazine_Review_MagazineID] FOREIGN KEY ([magazine_id]) REFERENCES [Magazine] ([magazine_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Author] ADD CONSTRAINT [FK_Magazine_Author_MagazineID] FOREIGN KEY ([magazine_id]) REFERENCES [Magazine] ([magazine_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Writer] ADD CONSTRAINT [FK_MoviesWriter_MoviesID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Director] ADD CONSTRAINT [FK_Person_Director_PersonID] FOREIGN KEY ([person_id]) REFERENCES [Person] ([person_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Star] ADD CONSTRAINT [FK_Person_Star_PersonID] FOREIGN KEY ([person_id]) REFERENCES [Person] ([person_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [User] ADD CONSTRAINT [FK_Person_User_PersonID] FOREIGN KEY ([person_id]) REFERENCES [Person] ([person_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Person] ADD CONSTRAINT [FK_City_Person_CityID] FOREIGN KEY ([city_id]) REFERENCES [City] ([city_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [City] ADD CONSTRAINT [FK_State_City_StateID] FOREIGN KEY ([state_id]) REFERENCES [State] ([state_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [State] ADD CONSTRAINT [FK_Country_State_CountryID] FOREIGN KEY ([country_id]) REFERENCES [Country] ([country_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Trailer] ADD CONSTRAINT [FK_Movies_Trailer_MoviesID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Address] ADD CONSTRAINT [FK_City_Address_CityID] FOREIGN KEY ([city_id]) REFERENCES [City] ([city_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Theatre] ADD CONSTRAINT [FK_Address_Theatre_AddressID] FOREIGN KEY ([address_id]) REFERENCES [Address] ([address_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Showtimes] ADD CONSTRAINT [FK_Theatre_Showtimes_TheatreID] FOREIGN KEY ([theatre_id]) REFERENCES [Theatre] ([theatre_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Showtimes] ADD CONSTRAINT [FK_Movies_Showtimes_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Rating] ADD CONSTRAINT [FK_Movies_Rating_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Rating] ADD CONSTRAINT [FK_User_Rating_UserID] FOREIGN KEY ([user_id]) REFERENCES [User] ([user_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TV_Shows_Star] ADD CONSTRAINT [FK_TV_Shows_Star_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TVShows_Creator] ADD CONSTRAINT [FK_TVShows_Creator_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TVShows_Creator] ADD CONSTRAINT [FK_Creator_TVShows_CreatorID] FOREIGN KEY ([creator_id]) REFERENCES [Creator] ([creator_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Timeslots] ADD CONSTRAINT [FK_Channel_Timeslots_ChannelID] FOREIGN KEY ([channel_id]) REFERENCES [Channel] ([channel_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Timeslots] ADD CONSTRAINT [FK_Episode_Timeslots_EpisodeID] FOREIGN KEY ([episode_id]) REFERENCES [Episodes] ([episode_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Seasons] ADD CONSTRAINT [FK_TV_Shows_Seasons_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Episodes] ADD CONSTRAINT [FK_Seasons_Episodes_SeasonID] FOREIGN KEY ([season_id]) REFERENCES [Seasons] ([season_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_List] ADD CONSTRAINT [FK_ReleaseList_ListID] FOREIGN KEY ([list_id]) REFERENCES [Release_List] ([list_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_List] ADD CONSTRAINT [FK_MoviesList_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Award_AwardCategory] ADD CONSTRAINT [FK_Award_Category_AwardID] FOREIGN KEY ([award_id]) REFERENCES [Award] ([award_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Award_AwardCategory] ADD CONSTRAINT [FK_Award_Category_CategoryID] FOREIGN KEY ([category_id]) REFERENCES [Award_Category] ([category_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Category_Nominations] ADD CONSTRAINT [FK_Award_Nomination_CategoryID] FOREIGN KEY ([category_id]) REFERENCES [Award_Category] ([category_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Category_Nominations] ADD CONSTRAINT [FK_Award_NominationsID] FOREIGN KEY ([nominations_id]) REFERENCES [Award_Nominations] ([nominations_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Award_Nominations] ADD CONSTRAINT [FK_Director_Nominee_DirectorID] FOREIGN KEY ([director_id]) REFERENCES [Director] ([director_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Award_Nominations] ADD CONSTRAINT [FK_Star_AwardNomination_StarID] FOREIGN KEY ([star_id]) REFERENCES [Star] ([star_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Award_Nominations] ADD CONSTRAINT [FK_TV_Nominations_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Poll_PollNominations] ADD CONSTRAINT [FK_Poll_Nominations_PollID] FOREIGN KEY ([poll_id]) REFERENCES [Poll] ([poll_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Poll_PollNominations] ADD CONSTRAINT [FK_Poll_Nominee_NominationsID] FOREIGN KEY ([nominations_id]) REFERENCES [Poll_Nominations] ([nominations_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Poll_Nominations] ADD CONSTRAINT [FK_TV_Poll_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News_List] ADD CONSTRAINT [FK_News_News_List_NewsID] FOREIGN KEY ([news_id]) REFERENCES [News] ([news_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [News_List] ADD CONSTRAINT [FK_News_Type_News_List_TypeID] FOREIGN KEY ([type_id]) REFERENCES [News_Type] ([type_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Star] ADD CONSTRAINT [FK_Movies_Star_MoviesID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Watchlist] ADD CONSTRAINT [FK_Movies_Watchlist_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TVShows_Watchlist] ADD CONSTRAINT [FK_TVShows_Watchlist_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [TV_Shows_Star] ADD CONSTRAINT [FK_Star_TV_Shows_StarID] FOREIGN KEY ([star_id]) REFERENCES [Star] ([star_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Writer] ADD CONSTRAINT [FK_Person_Writer_PersonID] FOREIGN KEY ([person_id]) REFERENCES [Person] ([person_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Writer] ADD CONSTRAINT [FK_Writer_Movies_WriterID] FOREIGN KEY ([writer_id]) REFERENCES [Writer] ([writer_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Metacritic_Review] ADD CONSTRAINT [FK_Author_Review_AuthorID] FOREIGN KEY ([author_id]) REFERENCES [Author] ([author_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Director] ADD CONSTRAINT [FK_Movies_Director_MoviesID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Director] ADD CONSTRAINT [FK_Director_Movies_DirectorID] FOREIGN KEY ([director_id]) REFERENCES [Director] ([director_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Genre] ADD CONSTRAINT [FK_Genre_Movies_GenreID] FOREIGN KEY ([genre_id]) REFERENCES [Genre] ([genre_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Movies_Genre] ADD CONSTRAINT [FK_Movies_Genre_MoviesID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Award_Nominations] ADD CONSTRAINT [FK_Movies_Nominations_MovieID] FOREIGN KEY ([movie_id]) REFERENCES [Movies] ([movie_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Rating] ADD CONSTRAINT [FK_TV_Shows_Rating_TVShowID] FOREIGN KEY ([tvshow_id]) REFERENCES [TV_Shows] ([tvshow_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go

ALTER TABLE [Creator] ADD CONSTRAINT [FK_Person_Creator_PersonID] FOREIGN KEY ([person_id]) REFERENCES [Person] ([person_id]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



