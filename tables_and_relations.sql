CREATE TABLE Yayýn_Türü (
    yayin_turu_id INT PRIMARY KEY IDENTITY(1,1),
    tur_adi VARCHAR(100) NOT NULL
);

CREATE TABLE Yayýncý (
    yayinci_id INT PRIMARY KEY IDENTITY(1,1),
    yayinci_adi VARCHAR(255) NOT NULL,
    adres VARCHAR(255) NOT NULL,
    telefon VARCHAR(50) CHECK (telefon LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
    enlem FLOAT CHECK (enlem BETWEEN -90 AND 90),
    boylam FLOAT CHECK (boylam BETWEEN -180 AND 180)
);

CREATE TABLE Konferans (
    konferans_id INT PRIMARY KEY IDENTITY(1,1),
    konferans_adi VARCHAR(255) NOT NULL,
    duzenleyen_kurum VARCHAR(255) NOT NULL,
    duzenlenme_tarihi DATE NOT NULL,
    duzenlenme_yeri VARCHAR(255) NOT NULL
);

CREATE TABLE Universite (
    universite_id INT PRIMARY KEY IDENTITY(1,1),
    universite_adi VARCHAR(255) NOT NULL,
    adres VARCHAR(255) NOT NULL,
    ulke VARCHAR(100) NOT NULL CHECK (ulke IS NOT NULL),
    enlem FLOAT CHECK (enlem BETWEEN -90 AND 90),
    boylam FLOAT CHECK (boylam BETWEEN -180 AND 180)
);

CREATE TABLE Bolum (
    bolum_id INT PRIMARY KEY IDENTITY(1,1),
    bolum_adi VARCHAR(255) NOT NULL,
    universite_id INT NOT NULL,
    FOREIGN KEY (universite_id) REFERENCES Universite(universite_id)
);

CREATE TABLE Koleksiyon (
    koleksiyon_id INT PRIMARY KEY IDENTITY(1,1),
    koleksiyon_adi VARCHAR(255) NOT NULL,
    aciklama TEXT
);

CREATE TABLE Yazar (
    yazar_id INT PRIMARY KEY IDENTITY(1,1),
    ad VARCHAR(100) NOT NULL,
    soyad VARCHAR(100) NOT NULL,
    afiliasyon VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL CHECK (email LIKE '%@%.%'),
    universite_id INT NOT NULL,
    bolum_id INT NOT NULL,
    FOREIGN KEY (universite_id) REFERENCES Universite(universite_id),
    FOREIGN KEY (bolum_id) REFERENCES Bolum(bolum_id)
);

CREATE TABLE Yayin (
    yayin_id INT PRIMARY KEY IDENTITY(1,1),
    baslik VARCHAR(255) NOT NULL,
    yayin_tarihi DATE NOT NULL,
    yayin_yeri VARCHAR(255) NOT NULL,
    DOI VARCHAR(100) CHECK (DOI LIKE '10.%' OR DOI IS NULL),
    ozet TEXT,
    anahtar_kelimeler VARCHAR(255),
    yayin_turu_id INT NOT NULL,
    yayinci_id INT NOT NULL,
    konferans_id INT,
    koleksiyon_id INT,
    dil VARCHAR(50) NOT NULL,
    FOREIGN KEY (yayin_turu_id) REFERENCES Yayýn_Türü(yayin_turu_id),
    FOREIGN KEY (yayinci_id) REFERENCES Yayýncý(yayinci_id),
    FOREIGN KEY (konferans_id) REFERENCES Konferans(konferans_id),
    FOREIGN KEY (koleksiyon_id) REFERENCES Koleksiyon(koleksiyon_id)
);

CREATE TABLE Atif (
    atif_id INT PRIMARY KEY IDENTITY(1,1),
    kaynak_yayin_id INT NOT NULL,
    hedef_yayin_id INT NOT NULL,
    atif_sayfasi INT NOT NULL CHECK (atif_sayfasi > 0),
    atif_context TEXT NOT NULL,
    FOREIGN KEY (kaynak_yayin_id) REFERENCES Yayin(yayin_id),
    FOREIGN KEY (hedef_yayin_id) REFERENCES Yayin(yayin_id)
);

CREATE TABLE Kullanici (
    kullanici_id INT PRIMARY KEY IDENTITY(1,1),
    kullanici_adi VARCHAR(100) NOT NULL,
    sifre VARCHAR(100) NOT NULL,
    ad VARCHAR(100) NOT NULL,
    soyad VARCHAR(100) NOT NULL,
    rol VARCHAR(50) NOT NULL CHECK (rol IN ('yönetici', 'editör', 'okuyucu'))
);

CREATE TABLE Proje (
    proje_id INT PRIMARY KEY IDENTITY(1,1),
    proje_adi VARCHAR(255) NOT NULL,
    aciklama TEXT,
    baslangic_tarihi DATE,
    bitis_tarihi DATE
);

CREATE TABLE Alan (
    alan_id INT PRIMARY KEY IDENTITY(1,1),
    alan_adi VARCHAR(255) NOT NULL
);

CREATE TABLE Kategori (
    kategori_id INT PRIMARY KEY IDENTITY(1,1),
    kategori_adi VARCHAR(100) NOT NULL
);

CREATE TABLE Finans_Kaynaðý (
    finans_kaynaðý_id INT PRIMARY KEY IDENTITY(1,1),
    kaynak_adi VARCHAR(255) NOT NULL,
    kaynak_turu VARCHAR(100) NOT NULL
);

CREATE TABLE Unvan (
    unvan_id INT PRIMARY KEY IDENTITY(1,1),
    unvan_adi VARCHAR(100) NOT NULL
);

CREATE TABLE Odul (
    odul_id INT PRIMARY KEY IDENTITY(1,1),
    odul_adi VARCHAR(100) NOT NULL
);

-- Ara Tablolar
CREATE TABLE Yayin_Yazar (
    yayin_id INT NOT NULL,
    yazar_id INT NOT NULL,
    PRIMARY KEY (yayin_id, yazar_id),
    FOREIGN KEY (yayin_id) REFERENCES Yayin(yayin_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazar(yazar_id)
);

CREATE TABLE Yayin_Kategori (
    yayin_id INT NOT NULL,
    kategori_id INT NOT NULL,
    PRIMARY KEY (yayin_id, kategori_id),
    FOREIGN KEY (yayin_id) REFERENCES Yayin(yayin_id),
    FOREIGN KEY (kategori_id) REFERENCES Kategori(kategori_id)
);

CREATE TABLE Yazar_Alan (
    yazar_id INT NOT NULL,
    alan_id INT NOT NULL,
    PRIMARY KEY (yazar_id, alan_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazar(yazar_id),
    FOREIGN KEY (alan_id) REFERENCES Alan(alan_id)
);

CREATE TABLE Yazar_Unvan (
    yazar_id INT NOT NULL,
    unvan_id INT NOT NULL,
    PRIMARY KEY (yazar_id, unvan_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazar(yazar_id),
    FOREIGN KEY (unvan_id) REFERENCES Unvan(unvan_id)
);

CREATE TABLE Yazar_Odul (
    yazar_id INT NOT NULL,
    odul_id INT NOT NULL,
    PRIMARY KEY (yazar_id, odul_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazar(yazar_id),
    FOREIGN KEY (odul_id) REFERENCES Odul(odul_id)
);

CREATE TABLE Yazar_Yayýncý (
    yazar_id INT NOT NULL,
    yayinci_id INT NOT NULL,
    PRIMARY KEY (yazar_id, yayinci_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazar(yazar_id),
    FOREIGN KEY (yayinci_id) REFERENCES Yayýncý(yayinci_id)
);

CREATE TABLE Proje_Yayin (
    proje_id INT NOT NULL,
    yayin_id INT NOT NULL,
    PRIMARY KEY (proje_id, yayin_id),
    FOREIGN KEY (proje_id) REFERENCES Proje(proje_id),
    FOREIGN KEY (yayin_id) REFERENCES Yayin(yayin_id)
);

CREATE TABLE Proje_FinansKaynaðý (
    proje_id INT NOT NULL,
    finans_kaynaðý_id INT NOT NULL,
    PRIMARY KEY (proje_id, finans_kaynaðý_id),
    FOREIGN KEY (proje_id) REFERENCES Proje(proje_id),
    FOREIGN KEY (finans_kaynaðý_id) REFERENCES Finans_Kaynaðý(finans_kaynaðý_id)
);

CREATE TABLE Kullanici_Proje (
    kullanici_id INT NOT NULL,
    proje_id INT NOT NULL,
    PRIMARY KEY (kullanici_id, proje_id),
    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(kullanici_id),
    FOREIGN KEY (proje_id) REFERENCES Proje(proje_id)
);