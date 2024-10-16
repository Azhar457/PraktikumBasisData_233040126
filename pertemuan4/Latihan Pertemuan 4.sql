USE pertemuan4
-- Soal 1
SELECT * FROM mahasiswa WHERE tahun_masuk BETWEEN 2019 AND 2020
ORDER BY tahun_masuk, mahasiswa_id ASC;

-- Soal 2
SELECT * FROM mahasiswa WHERE alamat LIKE '%Jl. Merdeka%' AND jurusan = 'Teknik Informatika';

-- Soal 3
SELECT COUNT(mahasiswa_id) AS jumlah_total_mahasiswa_informatika FROM mahasiswa WHERE jurusan = 'Teknik Informatika';

-- Soal 4
SELECT TOP(5) * FROM dpp_mahasiswa ORDER BY jumlah_pembayaran DESC;

-- Soal 5
SELECT DISTINCT dosen_pengajar FROM jadwal_mata_kuliah;

-- Soal 6
SELECT COUNT(kode_mata_kuliah) AS TOTAL_MATKUL FROM jadwal_mata_kuliah WHERE hari = 'Senin';

-- Soal 7
SELECT nama_mata_kuliah, kode_mata_kuliah FROM jadwal_mata_kuliah WHERE kode_mata_kuliah IN ('TI101', 'SI201', 'TS301');

-- Soal 8
SELECT * FROM mahasiswa WHERE alamat LIKE '%Jl. Sudirman%' AND jurusan = 'Teknik Informatika' AND tahun_masuk BETWEEN 2018 AND 2020;

-- Soal 9
SELECT * FROM jadwal_mata_kuliah WHERE dosen_pengajar 
LIKE '%ang%'
ORDER BY dosen_pengajar ASC;
-- SOAL 10
SELECT * FROM mahasiswa WHERE mahasiswa_id IN (SELECT mahasiswa_id FROM dpp_mahasiswa WHERE status_pembayaran = 'Lunas');