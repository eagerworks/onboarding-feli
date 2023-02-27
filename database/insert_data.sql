INSERT INTO users (username) VALUES('alex');
INSERT INTO users (username) VALUES('john');
INSERT INTO users (username) VALUES('michael');
INSERT INTO users (username) VALUES('harry');
INSERT INTO users (username) VALUES('steven');
INSERT INTO users (username) VALUES('alfred');
INSERT INTO users (username) VALUES('karen');

INSERT INTO items (name) VALUES('surfboard');
INSERT INTO items (name) VALUES('chair');
INSERT INTO items (name) VALUES('table');
INSERT INTO items (name) VALUES('computer');

INSERT INTO favorites (userId, itemId, boughtItem) VALUES(1, 1, false);

INSERT INTO follow (followedId, followerId) VALUES(1, 2);
INSERT INTO follow (followedId, followerId) VALUES(1, 3);
INSERT INTO follow (followedId, followerId) VALUES(1, 4);
INSERT INTO follow (followedId, followerId) VALUES(1, 5);
INSERT INTO follow (followedId, followerId) VALUES(1, 6);
INSERT INTO follow (followedId, followerId) VALUES(1, 7);
