--CREATE DATABASE Library;
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    JoinDate DATE
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    YearPublished INT,
    Genre VARCHAR(50)
);
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    HireDate DATE
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    MemberID INT,
    BookID INT,
    StaffID INT,
    LoanDate DATE,
    DueDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    LoanID INT,
    ReturnDate DATE,
    Fine DECIMAL(10, 2),
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);
INSERT INTO Staff (StaffID, Name, Position, HireDate) VALUES
(1, 'Adi Pratama', 'Manager', '2022-01-10'),
(2, 'Budi Santoso', 'Supervisor', '2021-03-15'),
(3, 'Citra Dewi', 'Staff', '2023-06-20'),
(4, 'Dewi Kartika', 'Staff', '2022-07-18'),
(5, 'Eko Nugroho', 'Supervisor', '2020-11-25'),
(6, 'Fajar Setiawan', 'Staff', '2023-02-10'),
(7, 'Gita Permata', 'Manager', '2021-08-05'),
(8, 'Hadi Saputra', 'Staff', '2022-04-22'),
(9, 'Indra Wijaya', 'Supervisor', '2021-12-18'),
(10, 'Joko Susilo', 'Staff', '2023-01-17'),
(11, 'Kartini Lestari', 'Manager', '2020-09-15'),
(12, 'Lestari Utami', 'Staff', '2023-03-08'),
(13, 'Maya Putri', 'Staff', '2022-05-28'),
(14, 'Nina Anggraini', 'Supervisor', '2021-10-02'),
(15, 'Oka Wibowo', 'Staff', '2023-07-19'),
(16, 'Putu Mahendra', 'Manager', '2020-10-30'),
(17, 'Qori Rahma', 'Staff', '2023-06-11'),
(18, 'Rina Kusuma', 'Supervisor', '2021-09-13'),
(19, 'Siti Aisyah', 'Staff', '2023-04-14'),
(20, 'Taufik Hidayat', 'Manager', '2022-02-07'),
(21, 'Usman Hadi', 'Staff', '2023-09-05'),
(22, 'Vina Aprilia', 'Supervisor', '2021-07-06'),
(23, 'Wulan Anjani', 'Staff', '2023-05-01'),
(24, 'Xavier Darmawan', 'Manager', '2020-08-12'),
(25, 'Yusuf Kurniawan', 'Supervisor', '2021-11-20'),
(26, 'Zahra Nurul', 'Staff', '2023-10-03'),
(27, 'Anisa Damayanti', 'Manager', '2022-03-15'),
(28, 'Bayu Wicaksono', 'Staff', '2023-08-10'),
(29, 'Cahyo Prihantoro', 'Supervisor', '2021-05-17'),
(30, 'Dian Kurniasari', 'Staff', '2023-09-22');

INSERT INTO Members (MemberID, Name, Address, JoinDate) VALUES
(1, 'Ahmad Fauzan', 'Jl. Merdeka No. 10, Jakarta', '2024-01-15'),
(2, 'Budi Santoso', 'Jl. Pahlawan No. 21, Bandung', '2024-02-20'),
(3, 'Siti Nurhaliza', 'Jl. Kartini No. 5, Surabaya', '2024-03-10'),
(4, 'Dewi Sartika', 'Jl. Mawar No. 7, Yogyakarta', '2024-01-25'),
(5, 'Andi Hakim', 'Jl. Kenari No. 3, Makassar', '2024-02-28'),
(6, 'Rina Susanti', 'Jl. Anggrek No. 12, Medan', '2024-03-15'),
(7, 'Fajar Nugroho', 'Jl. Melati No. 9, Semarang', '2024-01-18'),
(8, 'Hendra Wijaya', 'Jl. Durian No. 11, Palembang', '2024-02-12'),
(9, 'Lina Amalia', 'Jl. Flamboyan No. 6, Bali', '2024-03-08'),
(10, 'Agus Prasetyo', 'Jl. Cempaka No. 4, Balikpapan', '2024-01-29'),
(11, 'Nina Zahra', 'Jl. Angsana No. 14, Pekanbaru', '2024-02-18'),
(12, 'Zulkifli Hadi', 'Jl. Cemara No. 15, Aceh', '2024-03-20'),
(13, 'Sri Wahyuni', 'Jl. Mangga No. 8, Malang', '2024-01-10'),
(14, 'Yusuf Maulana', 'Jl. Jambu No. 2, Batam', '2024-02-25'),
(15, 'Tari Anjani', 'Jl. Kelapa No. 13, Samarinda', '2024-03-05'),
(16, 'Rizky Kurniawan', 'Jl. Karet No. 16, Lombok', '2024-01-12'),
(17, 'Fathir Alamsyah', 'Jl. Pisang No. 20, Manado', '2024-02-22'),
(18, 'Laila Husna', 'Jl. Sawo No. 17, Pontianak', '2024-03-12'),
(19, 'Ardiansyah Putra', 'Jl. Coklat No. 19, Padang', '2024-01-30'),
(20, 'Anisa Rahma', 'Jl. Salak No. 18, Banjarmasin', '2024-02-15'),
(21, 'Imam Wahyudi', 'Jl. Jeruk No. 22, Bengkulu', '2024-03-14'),
(22, 'Dian Sasmita', 'Jl. Durian No. 25, Mataram', '2024-01-11'),
(23, 'Bayu Setiawan', 'Jl. Alpukat No. 24, Ambon', '2024-02-17'),
(24, 'Tina Kartika', 'Jl. Apel No. 23, Sorong', '2024-03-16'),
(25, 'Haris Kurnia', 'Jl. Rambutan No. 21, Jayapura', '2024-01-28'),
(26, 'Maya Safira', 'Jl. Duku No. 26, Kupang', '2024-02-27'),
(27, 'Rendi Saputra', 'Jl. Srikaya No. 27, Ternate', '2024-03-19'),
(28, 'Mutiara Dewi', 'Jl. Kecapi No. 28, Palu', '2024-01-23'),
(29, 'Eko Purnomo', 'Jl. Nangka No. 29, Jambi', '2024-02-10'),
(30, 'Vina Melinda', 'Jl. Semangka No. 30, Gorontalo', '2024-03-25');

INSERT INTO Books (BookID, Title, Author, Publisher, YearPublished, Genre) VALUES
(1, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 2005, 'Novel'),
(2, 'Bumi', 'Tere Liye', 'Gramedia Pustaka Utama', 2014, 'Fiksi'),
(3, 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', 2004, 'Religi'),
(4, '5 Cm', 'Donny Dhirgantoro', 'Grasindo', 2005, 'Novel'),
(5, 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', 2009, 'Fiksi'),
(6, 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Gramedia Pustaka Utama', 1982, 'Novel'),
(7, 'Perahu Kertas', 'Dewi Lestari', 'Bentang Pustaka', 2009, 'Novel'),
(8, 'Hujan', 'Tere Liye', 'Gramedia Pustaka Utama', 2016, 'Fiksi'),
(9, 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', 2006, 'Novel'),
(10, 'Dilan: Dia adalah Dilanku Tahun 1990', 'Pidi Baiq', 'Mizan', 2014, 'Novel'),
(11, 'Sang Alkemis', 'Paulo Coelho', 'Gramedia Pustaka Utama', 1994, 'Fiksi'),
(12, 'Pulang', 'Leila S. Chudori', 'Kepustakaan Populer Gramedia', 2012, 'Novel'),
(13, 'Supernova: Ksatria, Putri, dan Bintang Jatuh', 'Dewi Lestari', 'Bentang Pustaka', 2001, 'Fiksi'),
(14, 'Rindu', 'Tere Liye', 'Republika', 2014, 'Fiksi'),
(15, 'Di Tanah Lada', 'Ziggy Z.', 'Gramedia Pustaka Utama', 2015, 'Novel'),
(16, 'Cantik Itu Luka', 'Eka Kurniawan', 'Gramedia Pustaka Utama', 2002, 'Novel'),
(17, 'Gadis Kretek', 'Ratih Kumala', 'Gramedia Pustaka Utama', 2012, 'Novel'),
(18, 'O', 'Eka Kurniawan', 'Gramedia Pustaka Utama', 2016, 'Fiksi'),
(19, 'Orang-Orang Biasa', 'Andrea Hirata', 'Bentang Pustaka', 2019, 'Novel'),
(20, 'Cinta Brontosaurus', 'Raditya Dika', 'Bukune', 2006, 'Komedi'),
(21, 'Manusia Setengah Salmon', 'Raditya Dika', 'GagasMedia', 2011, 'Komedi'),
(22, 'Koala Kumal', 'Raditya Dika', 'GagasMedia', 2015, 'Komedi'),
(23, 'Kambing Jantan', 'Raditya Dika', 'GagasMedia', 2005, 'Komedi'),
(24, 'Partikel', 'Dewi Lestari', 'Bentang Pustaka', 2012, 'Fiksi'),
(25, 'Marmut Merah Jambu', 'Raditya Dika', 'Bukune', 2010, 'Komedi'),
(26, 'Madre', 'Dewi Lestari', 'Bentang Pustaka', 2011, 'Fiksi'),
(27, 'Sabtu Bersama Bapak', 'Adhitya Mulya', 'GagasMedia', 2014, 'Novel'),
(28, 'Sebuah Seni untuk Bersikap Bodo Amat', 'Mark Manson', 'Gramedia Pustaka Utama', 2018, 'Pengembangan Diri'),
(29, 'Rich Dad Poor Dad', 'Robert T. Kiyosaki', 'Gramedia Pustaka Utama', 2000, 'Keuangan'),
(30, 'The Power of Habit', 'Charles Duhigg', 'Gramedia Pustaka Utama', 2012, 'Psikologi');
INSERT INTO Loans (LoanID, MemberID, BookID, StaffID, LoanDate, DueDate) VALUES
(1, 1, 1, 1, '2023-01-05', '2023-01-19'),
(2, 2, 2, 2, '2023-02-10', '2023-02-24'),
(3, 3, 3, 3, '2023-03-15', '2023-03-29'),
(4, 4, 4, 4, '2023-04-20', '2023-05-04'),
(5, 5, 5, 5, '2023-05-25', '2023-06-08'),
(6, 6, 6, 6, '2023-06-30', '2023-07-14'),
(7, 7, 7, 7, '2023-07-15', '2023-07-29'),
(8, 8, 8, 8, '2023-08-10', '2023-08-24'),
(9, 9, 9, 9, '2023-09-05', '2023-09-19'),
(10, 10, 10, 10, '2023-10-01', '2023-10-15'),
(11, 11, 11, 11, '2023-01-10', '2023-01-24'),
(12, 12, 12, 12, '2023-02-15', '2023-03-01'),
(13, 13, 13, 13, '2023-03-20', '2023-04-03'),
(14, 14, 14, 14, '2023-04-25', '2023-05-09'),
(15, 15, 15, 15, '2023-05-30', '2023-06-13'),
(16, 16, 16, 16, '2023-06-10', '2023-06-24'),
(17, 17, 17, 17, '2023-07-15', '2023-07-29'),
(18, 18, 18, 18, '2023-08-20', '2023-09-03'),
(19, 19, 19, 19, '2023-09-25', '2023-10-09'),
(20, 20, 20, 20, '2023-10-30', '2023-11-13'),
(21, 21, 21, 21, '2023-01-15', '2023-01-29'),
(22, 22, 22, 22, '2023-02-20', '2023-03-06'),
(23, 23, 23, 23, '2023-03-25', '2023-04-08'),
(24, 24, 24, 24, '2023-04-30', '2023-05-14'),
(25, 25, 25, 25, '2023-05-10', '2023-05-24'),
(26, 26, 26, 26, '2023-06-15', '2023-06-29'),
(27, 27, 27, 27, '2023-07-20', '2023-08-03'),
(28, 28, 28, 28, '2023-08-25', '2023-09-08'),
(29, 29, 29, 29, '2023-09-30', '2023-10-14'),
(30, 30, 30, 30, '2023-10-05', '2023-10-19');

INSERT INTO Returns (ReturnID, LoanID, ReturnDate, Fine) VALUES
(1, 1, '2023-01-20', 0.00),
(2, 2, '2023-02-25', 0.00),
(3, 3, '2023-03-30', 0.00),
(4, 4, '2023-05-05', 0.00),
(5, 5, '2023-06-09', 0.00),
(6, 6, '2023-07-15', 0.00),
(7, 7, '2023-07-30', 0.00),
(8, 8, '2023-08-25', 0.00),
(9, 9, '2023-09-20', 0.00),
(10, 10, '2023-10-16', 0.00),
(11, 11, '2023-01-25', 0.00),
(12, 12, '2023-03-02', 0.00),
(13, 13, '2023-04-04', 0.00),
(14, 14, '2023-05-10', 0.00),
(15, 15, '2023-06-14', 0.00),
(16, 16, '2023-06-25', 0.00),
(17, 17, '2023-07-30', 0.00),
(18, 18, '2023-09-04', 0.00),
(19, 19, '2023-10-10', 0.00),
(20, 20, '2023-11-14', 0.00),
(21, 21, '2023-01-30', 0.00),
(22, 22, '2023-03-07', 0.00),
(23, 23, '2023-04-09', 0.00),
(24, 24, '2023-05-15', 0.00),
(25, 25, '2023-05-25', 0.00),
(26, 26, '2023-06-30', 0.00),
(27, 27, '2023-08-04', 0.00),
(28, 28, '2023-09-09', 0.00),
(29, 29, '2023-10-15', 0.00),
(30, 30, '2023-10-20', 0.00);
