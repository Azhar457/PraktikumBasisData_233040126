DROP TABLE MAHASISWA;
CREATE TABLE MAHASISWA
(
	id INT NOT NULL IDENTITY,
	NPM CHAR(9) NOT NULL,
	Nama VARCHAR(50),
	Kelas VARCHAR(3),
	Jurusan VARCHAR(50),
	Fakultas VARCHAR(50)
)
INSERT INTO MAHASISWA 
VALUES 
	('233040126', 'Azhar Muttaqein', 'IFD', 'Teknik Informatika', 'Teknik'),
	('233040104' ,'Akbar Maku', 'IFB','Teknik Informatika','Teknik'),
	('233040139' ,'ANDHIKA PRAMUDYA SYAHPUTRA', 'IFC','Teknik Informatika','Teknik'),
	('233040017' ,'AQILLAH LEAN ANDERA', 'IFA','Teknik Informatika','Teknik'),
	('233040041' ,'ARISKA PUTRI', 'IFD','Teknik Informatika','Teknik'),
	('233040121' ,'AZMII ROHMATULLAH', 'IFB','Teknik Informatika','Teknik');

SELECT * FROM MAHASISWA;

SELECT * FROM MAHASISWA
WHERE Nama LIKE '%ah%';