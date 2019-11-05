drop table if exists user;
drop table if exists client;
drop table if exists landlord;
drop table if exists house;
drop table if exists properties;
drop table if exists reservation;

create table user(
    userID integer PRIMARY KEY,
    fullName varchar(50) not null unique,
    birthDate date not null,
    email varchar(30) not null unique,
    gender char not null check (gender = 'M' or gender = 'F' or gender = 'O'),
    username varchar(20) not null unique,
    password varchar(20) not null,
    description varchar(200),
    profilePictureLink varchar(50)
);

create table client(
    clientID integer PRIMARY KEY,
    userID integer references user(userID) on delete cascade on update cascade
);

create table landlord(
    landlordID integer PRIMARY KEY references user(userID) on delete cascade on update cascade,
    rating integer not null
);


create table house(
    houseID integer PRIMARY KEY,
    landlordID integer references landlord(landlordID) on delete cascade on update cascade,
    price integer not null,
    name varchar(50) not null,
    location varchar(50) not null,
    rating integer not null
);

create table properties(
    propertiesID integer PRIMARY KEY,
    houseID integer references house(houseID) on delete cascade on update cascade,
    hasWi_fi integer not null check (hasWi_fi = 0 or hasWi_fi = 1),
    hasFreeCoffee integer not null check (hasFreeCoffee = 0 or hasFreeCoffee = 1),
    hasHeating integer not null check (hasHeating = 0 or hasHeating = 1),
    hasFreelunch integer not null check (hasFreeLunch = 0 or hasFreeLunch = 1)
);

create table reservation(
    reservationID integer PRIMARY KEY,
    landlordID integer references landlord(landlordID) on delete cascade on update cascade,
    clientID integer references client(clientID) on delete cascade on update cascade,
    houseID integer references house(houseID) on delete cascade on update cascade,
    beginDate date not null,
    endDate date not null
);