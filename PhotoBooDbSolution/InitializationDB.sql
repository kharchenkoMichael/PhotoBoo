CREATE Table Client
(Id int Identity not null primary key,
Name nvarchar(20) not null check (Name != ''),
Email nvarchar(30) not null unique check (Email != ''),
Phone nvarchar(15) null check(Phone is Null or Phone like '([0-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
City nvarchar(25) null,
Password nvarchar(30) not null check (Password != ''),
Language nvarchar(6) not null default 'en-En',
CardNumber nvarchar(16) null)

CREATE Table Place
(Id int Identity not null primary key,
City nvarchar(25) null,
PointOnMap GEOGRAPHY not null,
CalendarRef nvarchar(max) not null)

CREATE Table Item
(Id int Identity not null primary key,
Name nvarchar(20) not null check (Name != ''),
IdClient int not null,
IdPlace int not null,
Type TINYINT not null,
Description nvarchar(Max) null,
Price int not null,
FOREIGN KEY (IdClient)  REFERENCES Client (Id),
FOREIGN KEY (IdPlace)  REFERENCES Place (Id))

CREATE Table Review
(Id int Identity not null primary key,
IdClient int not null,
IdItem int not null,
Text nvarchar(Max) null,
IdReview int null,
FOREIGN KEY (IdClient)  REFERENCES Client (Id),
FOREIGN KEY (IdItem)  REFERENCES Item (Id),
FOREIGN KEY (IdReview)  REFERENCES Review (Id))

CREATE Table ItemRating
(IdClient int not null,
IdItem int not null,
Rating TINYINT not null check (Rating > 0 and Rating < 6),
PRIMARY KEY(IdClient, IdItem),
FOREIGN KEY (IdClient)  REFERENCES Client (Id),
FOREIGN KEY (IdItem)  REFERENCES Item (Id))

CREATE Table ReviewRating
(IdClient int not null,
IdReview int not null,
Rating Bit not null,
PRIMARY KEY(IdClient, IdReview),
FOREIGN KEY (IdClient)  REFERENCES Client (Id),
FOREIGN KEY (IdReview)  REFERENCES Review (Id))

CREATE Table ItemPhoto
(Id int Identity not null primary key,
IdItem int not null,
FOREIGN KEY (IdItem)  REFERENCES Item (Id))

CREATE Table ClientOrder
(Id int Identity not null primary key,
IdClient int not null,
TimeForm DATETIME2 not null,
TimeTo DATETIME2 not null,
FOREIGN KEY (IdClient)  REFERENCES Client (Id))

CREATE Table ItemOrder
(Id int Identity not null primary key,
IdOrder int not null,
IdItem int not null,
FOREIGN KEY (IdOrder)  REFERENCES ClientOrder (Id),
FOREIGN KEY (IdItem)  REFERENCES Item (Id))
Go

