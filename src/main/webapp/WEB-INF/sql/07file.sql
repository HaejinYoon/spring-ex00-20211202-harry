use test;

CREATE TABLE File (
	id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    fileName VARCHAR(255) NOT NULL,
    FOREIGN KEY (boardId) REFERENCES Board(id)
);

desc File;