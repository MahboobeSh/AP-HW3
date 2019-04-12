


CREATE TABLE users (
    id                    SERIAL primary key,
    telegram_id           VARCHAR ,
    phone                 varchar  NOT NULL,
    email                 VARCHAR ,
    pasword               VARCHAR NOT NULL ,
    first_name            VARCHAR not null,
    last_name             VARCHAR not null,
    verification_code     INTEGER,
    profile_picture_url   VARCHAR,
    created_at            TIMESTAMP,
    updated_at            TIMESTAMP
);

CREATE TABLE  BlockUser (
    blocker_user_id   INTEGER NOT NULL,
    blocked_user_id   INTEGER NOT NULL,
    created_at        TIMESTAMP,
    PRIMARY KEY(blocked_user_id ,blocker_user_id),
    FOREIGN KEY (blocked_user_id) REFERENCES users(id),
    FOREIGN KEY (blocker_user_id) REFERENCES users(id)
);

CREATE TABLE  Messages (
    id            SERIAL   PRIMARY KEY,
    sender_id     INTEGER   NOT NULL,
    receiver_id   INTEGER   NOT NULL,
    message_type  VARCHAR NOT NULL,
    message_text  text NOT NULL,
    created_at    TIMESTAMP,
    updated_at    TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id),
    CHECK(message_type in ('text' , 'photo' ,'voice' ,'video'))
);

create table Channel(
    id  SERIAL  PRIMARY KEY,
    telegram_id VARCHAR  NOT NULL,
    title VARCHAR  NOT NULL,
    info VARCHAR,
    creator_id INTEGER NOT NULL,
    created_at  TIMESTAMP,
    updated_at  TIMESTAMP ,
    FOREIGN KEY(creator_id) REFERENCES users(id)
);

CREATE TABLE Groups(
    id            SERIAL primary key,
    creator_id    INTEGER not NULL,
    title         varchar NOT NULL,
    join_url      varchar not NULL,
    created_at    TIMESTAMP,
    updated_at    TIMESTAMP,
    FOREIGN KEY(creator_id) REFERENCES users(id)

);
CREATE TABLE  GroupMessage(
    id             SERIAL PRIMARY KEY,
    group_id       INTEGER not null,
    sender_id      INTEGER not null,
    message_type   VARCHAR NOT null,
    message_text   text,
    created_at     TIMESTAMP,
    updated_at     TIMESTAMP ,
    CHECK(message_type in ('text' , 'photo' ,'voice' ,'video')),
    FOREIGN KEY(group_id) REFERENCES Groups(id),
    FOREIGN KEY(sender_id) REFERENCES users(id)
);
CREATE TABLE ChannelMessage(
    id  SERIAL PRIMARY KEY,
    channel_id INTEGER NOT NULL,
    message_type VARCHAR NOT NULL,
    message_text text not NULL,
    created_at TIMESTAMP,
    updated_at TIMESTAMP ,
    CHECK(message_type in ('text' , 'photo' ,'voice' ,'video')),
    FOREIGN KEY(channel_id) REFERENCES Channel(id)
);
 CREATE TABLE MessageAttachment(
     message_id  INTEGER NOT NULL PRIMARY key,
     attachment_url VARCHAR NOT null,
     attachment_thumb_url VARCHAR NOT NULL,
    FOREIGN KEY(message_id) REFERENCES Messages(id)
);

 CREATE table GroupMessageAttachment(
     message_id  INTEGER NOT NULL PRIMARY KEY,
     attachment_url VARCHAR NOT NULL,
     attachment_thumb_url VARCHAR NOT NULL ,
     FOREIGN KEY(message_id) REFERENCES GroupMessage(id)
) ;

 create table ChannelMessageAttachment(
     message_id   INTEGER NOT NULL  PRIMARY KEY,
     attachment_url VARCHAR NOT NULL,
     attachment_thumb_url VARCHAR NOT NULL ,
     FOREIGN KEY(message_id) REFERENCES ChannelMessage(id)
);
create table ChannelMembership(
    user_id INTEGER NOT NULL ,
    channel_id INTEGER NOT NULL,
    created_at TIMESTAMP ,
    PRIMARY KEY(user_id ,channel_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY(channel_id) REFERENCES Channel(id)
) ;
create table GroupMembership(
    user_id  INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    created_at TIMESTAMP ,
    PRIMARY KEY(user_id ,group_id),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(group_id) REFERENCES Groups(id)
);
