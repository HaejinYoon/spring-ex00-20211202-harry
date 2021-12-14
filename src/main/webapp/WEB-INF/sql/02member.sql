use test;

CREATE TABLE Member(
	id VARCHAR(30) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);
ALTER TABLE Member ADD COLUMN inserted DATETIME NOT NULL DEFAULT NOW();

ALTER TABLE Member ADD COLUMN nickName VARCHAR(30); -- 컬럼 추가

SELECT * FROM Member ORDER BY inserted DESC;

UPDATE Member SET nickName = id;

ALTER TABLE Member MODIFY COLUMN nickName VARCHAR(30) UNIQUE NOT NULL; -- 제약 사항 추가 unique, not null