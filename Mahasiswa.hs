module Mahasiswa where

-- TYPE MAHASISWA
-- DEFINISI TYPE
-- type mahasiswa: <nama: String, nim: String, ipk: Float>
-- {<nama, nim, ipk> adalah sebuah mahasiswa, dengan nama adalah nama mahasiswa,
--  nim adalah nomor induk mahasiswa, ipk adalah nilai IPK mahasiswa}

data Mahasiswa = Mahasiswa String String Float
  deriving (Show, Eq)

-- DEFINISI DAN SPESIFIKASI SELEKTOR
-- nama: mahasiswa -> String
-- {nama(M) memberikan nama Mahasiswa M}
nama :: Mahasiswa -> String
nama (Mahasiswa a _ _) = a
-- TODO

-- nim: mahasiswa -> String
-- {nim(M) memberikan NIM Mahasiswa M}
nim :: Mahasiswa -> String
nim (Mahasiswa _ a _) = a

-- ipk: mahasiswa -> Float
-- {ipk(M) memberikan IPK Mahasiswa M}
ipk :: Mahasiswa -> Float
ipk (Mahasiswa _ _ a) = a
-- TODO

-- DEFINISI DAN SPESIFIKASI KONSTRUKTOR
-- makeMahasiswa: String -> String -> Float -> mahasiswa
-- {makeMahasiswa(nama,nim,ipk) membentuk Mahasiswa baru}
makeMahasiswa :: String -> String -> Float -> Mahasiswa
makeMahasiswa a b c = Mahasiswa a b c
-- TODO

-- DEFINISI DAN SPESIFIKASI PREDIKAT
-- isValidMahasiswa: mahasiswa -> boolean
-- {isValidMahasiswa(M) benar jika M memiliki Nama, NIM tidak kosong dan IPK antara 0.0 s.d. 4.0}
isValidMahasiswa :: Mahasiswa -> Bool
isValidMahasiswa m = nama m /= "" && nim m /= "" && ipk m >= 0.0 && ipk m <= 4.0
-- TODO

-- DEFINISI OPERATOR/FUNGSI LAIN TERHADAP MAHASISWA
-- gantiIPK: mahasiswa -> Float -> mahasiswa
-- {gantiIPK(M,ipkBaru) mengganti IPK mahasiswa M dengan ipkBaru (maksimal 4.0)}
gantiIPK :: Mahasiswa -> Float -> Mahasiswa
gantiIPK a b = 
    if b > 4.00 then makeMahasiswa (nama a) (nim a) (4.00)
    else if b < 0 then makeMahasiswa (nama a) (nim a) (0)  
    else makeMahasiswa (nama a) (nim a) (b)
    

-- TODO

-- klasifikasiMahasiswa: mahasiswa -> String
-- {klasifikasiMahasiswa(M) memberikan predikat mahasiswa berdasarkan IPK}
-- Dengan ketentuan:
-- IPK >= 3.51 : "Cumlaude"
-- 3.00 <= IPK < 3.51 : "Sangat Memuaskan"
-- 2.75 <= IPK < 3.00 : "Memuaskan"
-- IPK < 2.75 : "Perlu Perbaikan"
klasifikasiMahasiswa :: Mahasiswa -> String
klasifikasiMahasiswa a 
    | ipk a >= 3.51 = "Cumlaude"
    | ipk a >= 3.00 = "Sangat Memuaskan"
    | ipk a >= 2.75 = "Memuaskan"
    | otherwise = "Perlu Perbaikan"
-- TODO

-- tampilMahasiswa: mahasiswa -> String
-- {tampilMahasiswa(M) mengubah Mahasiswa M menjadi string deskriptif}
-- Dengan format:
-- "Nama: <nama>, NIM: <nim>, IPK: <ipk>"
tampilMahasiswa :: Mahasiswa -> String
tampilMahasiswa a = "Nama: " ++ (nama a) ++ ", NIM: " ++ (nim a) ++ ", IPK: " ++ show (ipk a)
-- TODO