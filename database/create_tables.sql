DROP DATABASE users_favorites_items;
CREATE DATABASE users_favorites_items;
USE users_favorites_items;

CREATE TABLE users(
  id serial PRIMARY KEY,
  username VARCHAR (50) NOT NULL
);

CREATE TABLE items(
  id serial PRIMARY KEY,
  name VARCHAR (50) NOT NULL
);

CREATE TABLE favorites(
  id serial PRIMARY KEY,
  userId BIGINT REFERENCES users(id),
  itemId BIGINT REFERENCES items(id),
  boughtItem BOOLEAN NOT NULL DEFAULT false,
  CONSTRAINT userIdItemId UNIQUE (userId,itemId)
);

CREATE TABLE comments(
  userId BIGINT REFERENCES users(id),
  favoriteId BIGINT REFERENCES favorites(id),
  PRIMARY KEY (favoriteId, userId)
);

CREATE TABLE follow(
  followedId BIGINT REFERENCES users(id),
  followerId BIGINT REFERENCES users(id),
  PRIMARY KEY (followedId, followerId)
);

CREATE TABLE share(
  whoSharesId  BIGINT REFERENCES users(id),
  sharedWithId BIGINT REFERENCES users(id),
  itemSharedId BIGINT REFERENCES items(id),
  PRIMARY KEY (whoSharesId, sharedWithId, itemSharedId)
);

COMMIT;
