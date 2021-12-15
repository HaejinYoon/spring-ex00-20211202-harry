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

ALTER TABLE Board MODIFY COLUMN views INT NOT NULL;
UPDATE Board set views = 0;

UPDATE 
		Board
	SET
		views = views+ 1
	WHERE
		id = 44;

SELECT count(*) FROM Board;

