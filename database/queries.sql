-- 1. Fetch all the favourite items for a given user
SELECT items.*
FROM favorites
INNER JOIN items ON items.id = favorites.itemId
WHERE favorites.userId = "1";

-- 2. Fetch all users together with their favourite items, even if the user doesn't have any items
SELECT *
FROM users
LEFT JOIN favorites ON users.id = favorites.userId;

-- 3. Get the number of users without favourite items
SELECT COUNT(*) as NumberOfUsersWithoutFavorite
FROM users
WHERE id NOT IN (SELECT users.id
                 FROM users
                 INNER JOIN favorites ON users.id = favorites.userId);

-- 4. Fetch the name of the users that have more than five followers and some non bought favourite items
SELECT username
FROM users
WHERE id IN (SELECT followedId
             FROM follow
             WHERE followedId IN (SELECT userId
                                  FROM favorites
                                  WHERE boughtItem = 'false')
             GROUP BY followedId
             HAVING COUNT(followedId)>5);
