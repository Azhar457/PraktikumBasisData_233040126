USE pertemuan5;

CREATE DATABASE pertemuan5;
CREATE TABLE mahasiswa (
    id BIGINT PRIMARY KEY IDENTITY,
    npm INT,
    nama VARCHAR(255),
    tanggal_lahir DATE,
    alamat VARCHAR(255),
    no_hp INT,
    jurusan_id BIGINT,
    dosen_wali_id BIGINT,
    FOREIGN KEY (jurusan_id) REFERENCES jurusan(id),
    FOREIGN KEY (dosen_wali_id) REFERENCES Dosen_Wali(id)
);
CREATE TABLE jurusan (
    id BIGINT PRIMARY KEY IDENTITY,
    nama_jurusan BIGINT
);

CREATE TABLE Dosen_Wali (
    id BIGINT PRIMARY KEY IDENTITY,
    nip BIGINT,
    nama VARCHAR(255),
    tanggal_lahir DATE,
    alamat VARCHAR(255),
    no_hp VARCHAR(15)
)

SELECT * FROM mahasiswa;
ALTER TABLE mahasiswa ADD status BIT;

ALTER TABLE jurusan
ALTER COLUMN nama_jurusan VARCHAR(255);
SELECT * FROM jurusan;
INSERT INTO jurusan (nama_jurusan) VALUES ('Teknik Informatika'), ('Teknik Industri'), ('Teknik Mesin'),('Teknik Lingkungan'), ('Perencanaan Wilayah dan Kota');

INSERT INTO Dosen_Wali (nip, nama, tanggal_lahir, alamat, no_hp) VALUES (123456789, 'Budi', '1990-01-01', 'Jl. Jalan', '08123456789'), (987654321, 'Andi', '1990-01-01', 'Jl. Jalan', '08123456789'), (123456789, 'Caca', '1990-01-01', 'Jl. Jalan', '08123456789'), (987654321, 'Dedi', '1990-01-01', 'Jl. Jalan', '08123456789'), (123456789, 'Eko', '1990-01-01', 'Jl. Jalan', '08123456789'), (987654321, 'Fandi', '1990-01-01', 'Jl. Jalan', '08123456789'), (123456789, 'Gaga', '1990-01-01', 'Jl. Jalan', '08123456789'), (987654321, 'Hadi', '1990-01-01', 'Jl. Jalan', '08123456789'), (123456789, 'Ika', '1990-01-01', 'Jl. Jalan', '08123456789'), (987654321, 'Joni', '1990-01-01', 'Jl. Jalan', '08123456789');
SELECT * FROM Dosen_Wali;
ALTER TABLE mahasiswa
ALTER COLUMN no_hp VARCHAR(15);
INSERT INTO mahasiswa (npm, nama, tanggal_lahir, alamat, no_hp, jurusan_id, dosen_wali_id) VALUES 
(123456789, 'Budi', '2000-01-01', 'Jl. Jalan Nyampainya kapan2', '08123456789', 1, 1), 
(987654321, 'Andi', '1969-06-10', 'Jl. Di jalan yang benar', '08123456789', 2, 2), 
(123456789, 'Rony', '2001-01-01', 'Jl. Kebenaran', '08123456789', 3, 3), 
(987654321, 'Dedi', '1990-01-01', 'Jl. Jalan', '08123456789', 4, 4), 
(123456789, 'Eko', '1990-01-01', 'Jl. Jalan', '08123456789', 5, 5), 
(987654321, 'Fandi', '1990-01-01', 'Jl. Jalan', '08123456789', 1, 6), 
(123456789, 'Gaga', '1990-01-01', 'Jl. Jalan', '08123456789', 2, 7), 
(987654321, 'Hadi', '1990-01-01', 'Jl. Jalan', '08123456789', 3, 8), 
(123456789, 'Ika', '1990-01-01', 'Jl. Jalan', '08123456789', 4, 9), 
(987654321, 'Joni', '1990-01-01', 'Jl. Jalan', '08123456789', 5, 10), 
(111111111, 'Kiki', '2000-03-15', 'Jl. Harapan Baru', '08134567891', 1, 1),
(222222222, 'Lina', '2002-07-20', 'Jl. Sejahtera', '08134567892', 2, 2),
(333333333, 'Mila', '2003-11-05', 'Jl. Kemerdekaan', '08134567893', 3, 3),
(444444444, 'Nani', '2001-04-12', 'Jl. Cinta Damai', '08134567894', 4, 4),
(555555555, 'Ozi', '2004-02-28', 'Jl. Kedamaian', '08134567895', 5, 5),
(666666666, 'Pipin', '2002-08-17', 'Jl. Persatuan', '08134567896', 1, 6),
(777777777, 'Qori', '2000-12-01', 'Jl. Harmoni', '08134567897', 2, 7),
(888888888, 'Rama', '2003-09-19', 'Jl. Kejayaan', '08134567898', 3, 8),
(999999999, 'Sinta', '2004-05-07', 'Jl. Damai Sejahtera', '08134567899', 4, 9),
(101010101, 'Tina', '2001-06-25', 'Jl. Pahlawan', '08134567810', 5, 10);

SELECT * FROM mahasiswa;
UPDATE mahasiswa SET status = 1 WHERE status IS NULL;

--------------------------------
-- cara cek nama foreign key constraint untuk tabel mahasiswa
SELECT 
    tc.constraint_name, 
    tc.table_name, 
    kcu.column_name, 
    ccu.table_name AS foreign_table_name, 
    ccu.column_name AS foreign_column_name
FROM 
    information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
WHERE 
    tc.table_name = 'mahasiswa' AND tc.constraint_type = 'FOREIGN KEY';


--------------------------------
ALTER TABLE mahasiswa
DROP CONSTRAINT FK__mahasiswa__jurus__534D60F1;  

ALTER TABLE mahasiswa
ADD CONSTRAINT FK__mahasiswa__jurus__534D60F1 FOREIGN KEY (jurusan_id) REFERENCES jurusan(id) ON DELETE CASCADE;

ALTER TABLE mahasiswa
DROP CONSTRAINT FK__mahasiswa__dosen__5441852A; 

ALTER TABLE mahasiswa
ADD CONSTRAINT FK__mahasiswa__dosen__5441852A FOREIGN KEY (dosen_wali_id) REFERENCES Dosen_Wali(id) ON DELETE CASCADE;

DELETE FROM mahasiswa
WHERE id IN (1, 2, 3, 4, 5);

SELECT * FROM mahasiswa
ORDER BY dosen_wali_id ASC;
SELECT * FROM jurusan;
SELECT * FROM Dosen_Wali;