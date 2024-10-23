CREATE TABLE mahasiswa (
    mahasiswa_id INT PRIMARY KEY IDENTITY(1,1),
    nama_mahasiswa NVARCHAR(100) NOT NULL,
    nim NVARCHAR(20) UNIQUE NOT NULL,
    tanggal_lahir DATE NOT NULL,
    alamat NVARCHAR(255),
    email NVARCHAR(100) UNIQUE NOT NULL,
    no_telepon NVARCHAR(15),
    jurusan NVARCHAR(100),
    tahun_masuk INT
);

CREATE TABLE jadwal_mata_kuliah (
    jadwal_id INT PRIMARY KEY IDENTITY(1,1),
    mahasiswa_id INT FOREIGN KEY REFERENCES mahasiswa(mahasiswa_id),
    kode_mata_kuliah NVARCHAR(10) NOT NULL,
    nama_mata_kuliah NVARCHAR(100) NOT NULL,
    hari NVARCHAR(20),
    jam_mulai TIME,
    jam_selesai TIME,
    ruang NVARCHAR(50),
    dosen_pengajar NVARCHAR(100)
);

CREATE TABLE dpp_mahasiswa (
    dpp_id INT PRIMARY KEY IDENTITY(1,1),
    mahasiswa_id INT FOREIGN KEY REFERENCES mahasiswa(mahasiswa_id),
    jumlah_pembayaran INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    status_pembayaran NVARCHAR(50) CHECK (status_pembayaran IN ('Lunas', 'Belum Lunas', 'Cicilan'))
);


INSERT INTO mahasiswa (nama_mahasiswa, nim, tanggal_lahir, alamat, email, no_telepon, jurusan, tahun_masuk)
VALUES 
('Andi Pratama', 'NIM001', '2000-05-10', 'Jl. Merdeka No.1', 'andi.pratama@mail.com', '081234567890', 'Teknik Informatika', 2019),
('Budi Santoso', 'NIM002', '1999-08-21', 'Jl. Sudirman No.2', 'budi.santoso@mail.com', '081234567891', 'Teknik Pangan', 2018),
('Citra Dewi', 'NIM003', '2001-03-15', 'Jl. Maju No.3', 'citra.dewi@mail.com', '081234567892', 'Teknik Sipil', 2020),
('Deni Satria', 'NIM004', '2000-07-22', 'Jl. Sudirman No.4', 'deni.satria@mail.com', '081234567893', 'Teknik Informatika', 2019),
('Eka Putri', 'NIM005', '2001-01-18', 'Jl. Mawar No.5', 'eka.putri@mail.com', '081234567894', 'Teknik Elektro', 2020),
('Feri Setiawan', 'NIM006', '1999-12-30', 'Jl. Melati No.6', 'feri.setiawan@mail.com', '081234567895', 'Teknik Industri', 2018),
('Gita Permata', 'NIM007', '2000-09-25', 'Jl. Merdeka No.7', 'gita.permata@mail.com', '081234567896', 'Teknik Informatika', 2019),
('Hendra Gunawan', 'NIM008', '2001-11-05', 'Jl. Cempaka No.8', 'hendra.gunawan@mail.com', '081234567897', 'Teknik Mesin', 2020),
('Indra Saputra', 'NIM009', '2000-02-14', 'Jl. Sudirman No.9', 'indra.saputra@mail.com', '081234567898', 'Teknik Informatika', 2019),
('Joko Widodo', 'NIM010', '2001-05-20', 'Jl. Kenanga No.10', 'joko.widodo@mail.com', '081234567899', 'Teknik Industri', 2020),
('Kiki Amalia', 'NIM011', '1999-03-08', 'Jl. Merdeka No.11', 'kiki.amalia@mail.com', '081234567900', 'Teknik Informatika', 2018);


INSERT INTO jadwal_mata_kuliah (mahasiswa_id, kode_mata_kuliah, nama_mata_kuliah, hari, jam_mulai, jam_selesai, ruang, dosen_pengajar)
VALUES 
(1, 'TI101', 'Pemrograman Dasar', 'Senin', '08:00', '10:00', 'Lab 1', 'Anggoro Ari Nur Cahyo S.T. M.KOM'),
(1, 'TI102', 'Matematika Diskrit', 'Rabu', '10:00', '12:00', 'Kelas 2A', 'Anggoro Ari Nur Cahyo S.T. M.KOM'),
(2, 'SI201', 'Sistem Basis Data', 'Selasa', '08:00', '10:00', 'Lab 2', 'Anggoro Ari Nur Cahyo S.T. M.KOM'),
(2, 'SI202', 'Analisis Sistem', 'Kamis', '13:00', '15:00', 'Kelas 1B', 'Sanda Islama Putra S.T M.KOM'),
(3, 'TS301', 'Struktur Bangunan', 'Jumat', '09:00', '11:00', 'Kelas 3C', 'Sanda Islama Putra S.T M.KOM'),
(4, 'MN401', 'Manajemen Operasi', 'Senin', '13:00', '15:00', 'Kelas 4A', 'Anggara Sakti Atmaja S.T. M.ENG'),
(5, 'EE501', 'Elektronika Dasar', 'Selasa', '10:00', '12:00', 'Lab 5', 'Sanda Islama Putra S.T M.KOM'),
(6, 'AK601', 'Akuntansi Keuangan', 'Rabu', '08:00', '10:00', 'Kelas 6A', 'Sanda Islama Putra S.T M.KOM'),
(7, 'DK701', 'Desain Grafis', 'Kamis', '14:00', '16:00', 'Lab 7', 'Anggoro Ari Nur Cahyo S.T. M.KOM'),
(8, 'TM801', 'Termodinamika', 'Jumat', '09:00', '11:00', 'Lab 8', 'Anggara Sakti Atmaja S.T. M.ENG'),
(9, 'TK901', 'Reaksi Kimia', 'Senin', '13:00', '15:00', 'Lab 9', 'Sanda Islama Putra S.T M.KOM'),
(10, 'TI102', 'Perancangan Produk', 'Selasa', '08:00', '10:00', 'Kelas 2B', 'Sanda Islama Putra S.T M.KOM'),
(11, 'FM110', 'Farmakologi Dasar', 'Rabu', '14:00', '16:00', 'Lab 11', 'Anggara Sakti Atmaja S.T. M.ENG');


INSERT INTO dpp_mahasiswa (mahasiswa_id, jumlah_pembayaran, tanggal_pembayaran, status_pembayaran)
VALUES 
(1, 5000000, '2024-01-10', 'Lunas'),
(2, 3000000, '2024-02-15', 'Cicilan'),
(3, 5000000, '2024-03-05', 'Belum Lunas'),
(4, 3500000, '2024-02-20', 'Lunas'),
(5, 4000000, '2024-03-10', 'Cicilan'),
(6, 4500000, '2024-01-25', 'Lunas'),
(7, 3200000, '2024-03-02', 'Belum Lunas'),
(8, 3800000, '2024-02-18', 'Lunas'),
(9, 5000000, '2024-03-12', 'Cicilan'),
(10, 4100000, '2024-01-30', 'Lunas'),
(11, 5000000, '2024-02-22', 'Belum Lunas');