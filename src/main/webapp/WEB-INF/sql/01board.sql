USE test;

CREATE TABLE Board(
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    inserted DATETIME DEFAULT NOW(),
    updated DATETIME DEFAULT NOW()
);
select * from Board;
DESC Board;

DELETE FROM Board WHERE
(id) IN (SELECT id FROM Board WHERE Inserted IS NULL);

DELETE FROM Board WHERE
(id) IN (SELECT id FROM Board WHERE updated IS NULL);

ALTER TABLE Board MODIFY COLUMN inserted DATETIME NOT NULL DEFAULT NOW();
ALTER TABLE Board MODIFY COLUMN updated DATETIME NOT NULL DEFAULT NOW();

ALTER TABLE Board MODIFY COLUMN views INT NOT NULL DEFAULT 0;
UPDATE Board set views = 0;

UPDATE 
		Board
	SET
		views = views+ 1
	WHERE
		id = 44;

SELECT count(*) FROM Board;

INSERT INTO Board (title, content, writer)
(SELECT title, content, writer FROM Board); -- 이미 있는 레코드 복사해서 다시 입력

	SELECT 
    	b.id,
    	b.title,
    	b.content,
    	b.writer,
    	b.inserted,
    	b.updated,
    	b.views,
    	m.nickName
	FROM
    	Board b
    JOIN
    	Member m ON b.writer = m.id
	ORDER BY id DESC
    LIMIT 0, 10 ;
    -- from(0 index), number
    -- page 1 : 0,10
    -- page 2 : 10, 10
    -- page 3 : 20, 10
    -- page 4 : 30, 10