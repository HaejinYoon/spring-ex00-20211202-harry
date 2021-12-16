use test;

CREATE TABLE Member(
	id VARCHAR(30) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);
ALTER TABLE Member ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();

ALTER TABLE Member ADD COLUMN nickName VARCHAR(30); -- 컬럼 추가
ALTER TABLE Member ADD COLUMN adminQuali INT;

SELECT * FROM Member ORDER BY inserted DESC;

UPDATE Member SET nickName = id;

ALTER TABLE Member MODIFY COLUMN nickName VARCHAR(30) UNIQUE NOT NULL; -- 제약 사항 추가 unique, not null

-- Board 테이블의 작성자 열을 Member 테이블 id값으로 수정
UPDATE Board SET writer = (SELECT id FROM Member ORDER BY inserted DESC LIMIT 1);

-- 게시물 조회, 작성자의 nickName 포함
SELECT 
    b.id,
    b.title,
    b.content,
    b.writer,
    b.inserted,
    b.updated,
    m.nickName
FROM
    Board b
        JOIN
    Member m ON b.writer = m.id
ORDER BY id DESC;

SELECT
		id,
		password,
		email,
		address,
		inserted,
		nickName
        
	FROM
		Member
	ORDER BY
		inserted DESC;
        
SELECT 
    m.id,
    m.password,
    m.email,
    m.address,
    m.inserted,
    m.nickName,
    COUNT(b.id) numberOfBoard
FROM
    Member m
        LEFT JOIN
    Board b ON m.id = b.writer
GROUP BY m.id;

DESC Member;

SELECT * FROM Member;

    SELECT 
        m.id, 
		m.password,  
		m.email, 
		m.address, 
		m.inserted, 
		m.nickName, 
		m.adminQuali,
		count(b.id) numberOfBoard 
	FROM 
		Member m
    JOIN
      Board b ON m.id =b.writer
  GROUP BY m.id DESC
  ORDER BY m.id DESC
  LIMIT 0, 10;