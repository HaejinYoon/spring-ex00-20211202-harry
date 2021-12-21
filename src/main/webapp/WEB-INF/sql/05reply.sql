use test;

CREATE TABLE Reply (
	id INT PRIMARY KEY AUTO_INCREMENT,
	boardId INT NOT NULL,
    reply VARCHAR(500) NOT NULL,
    memberId VARCHAR(30) NOT NULL,
    inserted DATETIME NOT NULL DEFAULT NOW(),
    updated DATETIME NOT NULL DEFAULT NOW()
);

SELECT * FROM Board ORDER BY id DESC; -- 794
SELECT * FROM Member ORDER BY inserted DESC; -- myid4

-- test date input
INSERT INTO Reply (boardId, reply, memberId) VALUES (794, 'test reply!@!@!@', 'myid4');

SELECT * FROM Reply ORDER BY id DESC;

SELECT
 	r.id,
	r.boardId,
	r.memberId,
	r.reply,
	r.inserted,
	r.updated,
	m.nickName
FROM
	Reply r
JOIN
	Member m
ON
	r.memberId = m.id
WHERE
	boardId = 794
ORDER BY
	id DESC;