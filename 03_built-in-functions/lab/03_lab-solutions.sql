#problem 1
SELECT `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The';

#problem 2
UPDATE `books`
SET `title` = replace(`title`, 'The', '***')
WHERE SUBSTRING(`title`, 1, 3) = 'The';

SELECT `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = '***';

#problem 3
SELECT ROUND(SUM(`cost`), 2)
FROM `books`;

#problem 4
SELECT
	concat(first_name, ' ', last_name) AS 'Full Name',
	if(isnull(died), NULL, timestampdiff(DAY, born, died)) AS 'Days Lived'
    FROM authors;

#problem 5
SELECT
	`title`
FROM 
	`books`
WHERE left(`title`, 12) = 'Harry Potter'
ORDER BY id ASC;
