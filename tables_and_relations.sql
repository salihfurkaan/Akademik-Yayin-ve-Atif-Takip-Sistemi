-- Universiteler tablosu
CREATE TABLE Universiteler (
    universite_id INT IDENTITY(1,1) PRIMARY KEY,
    universite_adi VARCHAR(255) NOT NULL,
    adres TEXT
);

-- Bolumler tablosu
CREATE TABLE Bolumler (
    bolum_id INT IDENTITY(1,1) PRIMARY KEY,
    bolum_adi VARCHAR(255) NOT NULL,
    universite_id INT,
    FOREIGN KEY (universite_id) REFERENCES Universiteler(universite_id)
);

-- Alanlar tablosu
CREATE TABLE Alanlar (
    alan_id INT IDENTITY(1,1) PRIMARY KEY,
    alan_adi VARCHAR(255) NOT NULL
);

-- Oduller tablosu
CREATE TABLE Oduller (
    odul_id INT IDENTITY(1,1) PRIMARY KEY,
    odul_adi VARCHAR(255) NOT NULL,
    odul_aciklama TEXT
);

-- Konferanslar tablosu
CREATE TABLE Konferanslar (
    konferans_id INT IDENTITY(1,1) PRIMARY KEY,
    konferans_adi VARCHAR(255) NOT NULL,
    konferans_tarihi DATE,
    konferans_yeri VARCHAR(255)
);

-- Koleksiyonlar tablosu
CREATE TABLE Koleksiyonlar (
    koleksiyon_id INT IDENTITY(1,1) PRIMARY KEY,
    koleksiyon_adi VARCHAR(255) NOT NULL,
    aciklama TEXT
);

-- FinansKaynaklari tablosu
CREATE TABLE FinansKaynaklari (
    kaynak_id INT IDENTITY(1,1) PRIMARY KEY,
    kaynak_adi VARCHAR(255) NOT NULL,
    kaynak_turu VARCHAR(255)
);

-- AnahtarKelimeler tablosu
CREATE TABLE AnahtarKelimeler (
    anahtar_kelime_id INT IDENTITY(1,1) PRIMARY KEY,
    anahtar_kelime VARCHAR(255) NOT NULL
);

-- Yazarlar tablosu (Yayinlar ve Projeler için gerekli olan bağımlı tablo)
CREATE TABLE Yazarlar (
    yazar_id INT IDENTITY(1,1) PRIMARY KEY,
    ad VARCHAR(255) NOT NULL,
    soyad VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    unvan VARCHAR(255),
    bolum_id INT,
    FOREIGN KEY (bolum_id) REFERENCES Bolumler(bolum_id)
);

-- Yayinlar tablosu
CREATE TABLE Yayinlar (
    yayin_id INT IDENTITY(1,1) PRIMARY KEY,
    baslik VARCHAR(255) NOT NULL,
    ozet TEXT,
    yayin_tarihi DATE,
    doi VARCHAR(255) UNIQUE,
    koleksiyon_id INT,
    konferans_id INT,
    alan_id INT,
    anahtar_kelime_id INT,
    yazar_id INT, -- Yazarla doğrudan bağlantı
    odul_id INT,  -- Ödülle doğrudan bağlantı
    FOREIGN KEY (koleksiyon_id) REFERENCES Koleksiyonlar(koleksiyon_id),
    FOREIGN KEY (konferans_id) REFERENCES Konferanslar(konferans_id),
    FOREIGN KEY (alan_id) REFERENCES Alanlar(alan_id),
    FOREIGN KEY (anahtar_kelime_id) REFERENCES AnahtarKelimeler(anahtar_kelime_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazarlar(yazar_id),
    FOREIGN KEY (odul_id) REFERENCES Oduller(odul_id)
);

-- Projeler tablosu
CREATE TABLE Projeler (
    proje_id INT IDENTITY(1,1) PRIMARY KEY,
    proje_adi VARCHAR(255) NOT NULL,
    proje_aciklama TEXT,
    kaynak_id INT,
    alan_id INT,
    bolum_id INT,
    yazar_id INT, -- Yazarla doğrudan bağlantı
    odul_id INT,  -- Ödülle doğrudan bağlantı
    FOREIGN KEY (kaynak_id) REFERENCES FinansKaynaklari(kaynak_id),
    FOREIGN KEY (alan_id) REFERENCES Alanlar(alan_id),
    FOREIGN KEY (bolum_id) REFERENCES Bolumler(bolum_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazarlar(yazar_id),
    FOREIGN KEY (odul_id) REFERENCES Oduller(odul_id)
);

-- Kullanicilar tablosu
CREATE TABLE Kullanicilar (
    kullanici_id INT IDENTITY(1,1) PRIMARY KEY,
    kullanici_adi VARCHAR(255) NOT NULL UNIQUE,
    sifre VARCHAR(255) NOT NULL,
    rol VARCHAR(50),
    yazar_id INT,
    FOREIGN KEY (yazar_id) REFERENCES Yazarlar(yazar_id)
);

-- Yorumlar tablosu
CREATE TABLE Yorumlar (
    yorum_id INT IDENTITY(1,1) PRIMARY KEY,
    yayin_id INT,
    kullanici_id INT,
    yorum_metni TEXT NOT NULL,
    yorum_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (yayin_id) REFERENCES Yayinlar(yayin_id),
    FOREIGN KEY (kullanici_id) REFERENCES Kullanicilar(kullanici_id)
);
