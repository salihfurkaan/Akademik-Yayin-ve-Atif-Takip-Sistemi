/*   

    CREATE DATABASE OrnekVeritabani;  
    GO  

    USE OrnekVeritabani;  
    GO  
*/  

/*   
    1. TABLOLARIN OLUŞTURULMASI   
       (İstenilen ilişkiler, birincil-yabancı anahtarlar ve uygun veri türleri)  
*/  

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
    universite_id INT NOT NULL,  
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

-- Yazarlar tablosu  
CREATE TABLE Yazarlar (  
    yazar_id INT IDENTITY(1,1) PRIMARY KEY,  
    ad VARCHAR(255) NOT NULL,  
    soyad VARCHAR(255) NOT NULL,  
    email VARCHAR(255) UNIQUE NOT NULL,  
    unvan VARCHAR(255),  
    bolum_id INT NOT NULL,  
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
    FOREIGN KEY (koleksiyon_id) REFERENCES Koleksiyonlar(koleksiyon_id),  
    FOREIGN KEY (konferans_id) REFERENCES Konferanslar(konferans_id),  
    FOREIGN KEY (alan_id) REFERENCES Alanlar(alan_id),  
    FOREIGN KEY (anahtar_kelime_id) REFERENCES AnahtarKelimeler(anahtar_kelime_id)  
);  

-- YayinYazarlar tablosu (Çoktan çoğa ilişki için)  
CREATE TABLE YayinYazarlar (  
    yayin_id INT,  
    yazar_id INT,  
    PRIMARY KEY (yayin_id, yazar_id),  
    FOREIGN KEY (yayin_id) REFERENCES Yayinlar(yayin_id),  
    FOREIGN KEY (yazar_id) REFERENCES Yazarlar(yazar_id)  
);  

-- Projeler tablosu  
CREATE TABLE Projeler (  
    proje_id INT IDENTITY(1,1) PRIMARY KEY,  
    proje_adi VARCHAR(255) NOT NULL,  
    proje_aciklama TEXT,  
    kaynak_id INT NOT NULL,  
    alan_id INT NOT NULL,  
    bolum_id INT NOT NULL,  
    FOREIGN KEY (kaynak_id) REFERENCES FinansKaynaklari(kaynak_id),  
    FOREIGN KEY (alan_id) REFERENCES Alanlar(alan_id),  
    FOREIGN KEY (bolum_id) REFERENCES Bolumler(bolum_id)  
);  

-- ProjeYazarlar tablosu (Çoktan çoğa ilişki için)  
CREATE TABLE ProjeYazarlar (  
    proje_id INT,  
    yazar_id INT,  
    PRIMARY KEY (proje_id, yazar_id),  
    FOREIGN KEY (proje_id) REFERENCES Projeler(proje_id),  
    FOREIGN KEY (yazar_id) REFERENCES Yazarlar(yazar_id)  
);

-- YazarOduller tablosu (Yazarlar ve Oduller arasında çoktan çoğa ilişki için)
CREATE TABLE YazarOduller (
    yazar_id INT,
    odul_id INT,
    PRIMARY KEY (yazar_id, odul_id),
    FOREIGN KEY (yazar_id) REFERENCES Yazarlar(yazar_id),
    FOREIGN KEY (odul_id) REFERENCES Oduller(odul_id)
);

-- YayinOduller tablosu (Yayinlar ve Oduller arasında çoktan çoğa ilişki için)
CREATE TABLE YayinOduller (
    yayin_id INT,
    odul_id INT,
    PRIMARY KEY (yayin_id, odul_id),
    FOREIGN KEY (yayin_id) REFERENCES Yayinlar(yayin_id),
    FOREIGN KEY (odul_id) REFERENCES Oduller(odul_id)
);

-- ProjeOduller tablosu (Projeler ve Oduller arasında çoktan çoğa ilişki için)
CREATE TABLE ProjeOduller (
    proje_id INT,
    odul_id INT,
    PRIMARY KEY (proje_id, odul_id),
    FOREIGN KEY (proje_id) REFERENCES Projeler(proje_id),
    FOREIGN KEY (odul_id) REFERENCES Oduller(odul_id)
);

GO  

/*  
    2. TETİKLEYİCİ (TRIGGER) ÖRNEĞİ  
    - Bu tetikleyici, Yayinlar tablosuna yeni bir kayıt eklendiğinde çalışır.  
    - Örnek olarak, eklendikten sonra basit bir mesaj yazdırıyor   
      (kritik bir operasyon ekleyip stok güncelleme mantığı vs. yapabilirsiniz).  
*/  
CREATE TRIGGER trg_AfterInsertYayin  
ON Yayinlar  
AFTER INSERT  
AS  
BEGIN  
    SET NOCOUNT ON;  
    PRINT 'Yeni bir yayın eklendi. (TRIGGER: trg_AfterInsertYayin)';  
END;  
GO  

/*  
    3. SAKLI YORDAMLAR (STORED PROCEDURES)  
    - Her prosedürde TRY-CATCH ve TRANSACTION yönetimi (BEGIN TRAN, COMMIT, ROLLBACK) örneklendirilmiştir.  
*/  

/* Üniversite ekleme SP */  
CREATE PROCEDURE sp_UniverSiteEkle  
    @universite_adi VARCHAR(255),  
    @adres TEXT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Universiteler (universite_adi, adres)  
        VALUES (@universite_adi, @adres);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni üniversite başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Bölüm ekleme SP */  
CREATE PROCEDURE sp_BolumEkle  
    @bolum_adi VARCHAR(255),  
    @universite_id INT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Bolumler (bolum_adi, universite_id)  
        VALUES (@bolum_adi, @universite_id);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni bölüm başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Alan ekleme SP */  
CREATE PROCEDURE sp_AlanEkle  
    @alan_adi VARCHAR(255)  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Alanlar (alan_adi)  
        VALUES (@alan_adi);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni alan başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Ödül ekleme SP */  
CREATE PROCEDURE sp_OdulEkle  
    @odul_adi VARCHAR(255),  
    @odul_aciklama TEXT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Oduller (odul_adi, odul_aciklama)  
        VALUES (@odul_adi, @odul_aciklama);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni ödül başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Konferans ekleme SP */  
CREATE PROCEDURE sp_KonferansEkle  
    @konferans_adi VARCHAR(255),  
    @konferans_tarihi DATE,  
    @konferans_yeri VARCHAR(255)  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Konferanslar (konferans_adi, konferans_tarihi, konferans_yeri)  
        VALUES (@konferans_adi, @konferans_tarihi, @konferans_yeri);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni konferans başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;
    END CATCH  
END;  
GO  

/* Koleksiyon ekleme SP */
CREATE PROCEDURE sp_KoleksiyonEkle  
    @koleksiyon_adi VARCHAR(255),  
    @aciklama TEXT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Koleksiyonlar (koleksiyon_adi, aciklama)  
        VALUES (@koleksiyon_adi, @aciklama);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni koleksiyon başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  


/* Finans Kaynakları ekleme SP */  
CREATE PROCEDURE sp_FinansKaynaklariEkle  
    @kaynak_adi VARCHAR(255),  
    @kaynak_turu VARCHAR(255)  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO FinansKaynaklari (kaynak_adi, kaynak_turu)  
        VALUES (@kaynak_adi, @kaynak_turu);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni finans kaynağı başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Anahtar Kelime ekleme SP */  
CREATE PROCEDURE sp_AnahtarKelimeEkle  
    @anahtar_kelime VARCHAR(255)  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO AnahtarKelimeler (anahtar_kelime)  
        VALUES (@anahtar_kelime);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni anahtar kelime başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Yazar ekleme SP */  
CREATE PROCEDURE sp_YazarEkle  
    @ad VARCHAR(255),  
    @soyad VARCHAR(255),  
    @email VARCHAR(255),  
    @unvan VARCHAR(255),  
    @bolum_id INT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Yazarlar (ad, soyad, email, unvan, bolum_id)  
        VALUES (@ad, @soyad, @email, @unvan, @bolum_id);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni yazar başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Yayın ekleme SP   
 Bir yayın eklendikten hemen sonra YayinYazarlar tablosuna da ekleniyor.  
*/  
CREATE PROCEDURE sp_YayinEkle  
    @baslik VARCHAR(255),  
    @ozet TEXT,  
    @yayin_tarihi DATE,  
    @doi VARCHAR(255),  
    @koleksiyon_id INT,  
    @konferans_id INT,  
    @alan_id INT,  
    @anahtar_kelime_id INT,  
    @yazar_id INT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Yayinlar (baslik, ozet, yayin_tarihi, doi, koleksiyon_id, konferans_id, alan_id, anahtar_kelime_id)  
        VALUES (@baslik, @ozet, @yayin_tarihi, @doi, @koleksiyon_id, @konferans_id, @alan_id, @anahtar_kelime_id);  

        DECLARE @yeni_yayin_id INT = SCOPE_IDENTITY();  

        INSERT INTO YayinYazarlar (yayin_id, yazar_id)  
        VALUES (@yeni_yayin_id, @yazar_id);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni yayın başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO  

/* Proje ekleme SP   
Bir proje eklendikten hemen sonra ProjeYazarlar tablosuna da ekleniyor.  
*/  
CREATE PROCEDURE sp_ProjeEkle  
    @proje_adi VARCHAR(255),  
    @proje_aciklama TEXT,  
    @kaynak_id INT,  
    @alan_id INT,  
    @bolum_id INT,  
    @yazar_id INT  
AS  
BEGIN  
    BEGIN TRANSACTION;  
    BEGIN TRY  
        INSERT INTO Projeler (proje_adi, proje_aciklama, kaynak_id, alan_id, bolum_id)  
        VALUES (@proje_adi, @proje_aciklama, @kaynak_id, @alan_id, @bolum_id);  

        DECLARE @yeni_proje_id INT = SCOPE_IDENTITY();  

        INSERT INTO ProjeYazarlar (proje_id, yazar_id)  
        VALUES (@yeni_proje_id, @yazar_id);  

        COMMIT TRANSACTION;  
        PRINT 'Yeni proje başarıyla eklendi.';  
    END TRY  
    BEGIN CATCH  
        IF @@TRANCOUNT > 0  
            ROLLBACK TRANSACTION;  
        PRINT 'Hata oluştu! Transaction geri alındı.';  
        THROW;  
    END CATCH  
END;  
GO

/* Yazar ve Ödül ilişkilendirme SP */
CREATE PROCEDURE sp_YazarOdulIliskilendir
    @yazar_id INT,
    @odul_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO YazarOduller (yazar_id, odul_id)
        VALUES (@yazar_id, @odul_id);

        COMMIT TRANSACTION;
        PRINT 'Yazar ve ödül başarıyla ilişkilendirildi.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        PRINT 'Hata oluştu! Transaction geri alındı.';
        THROW;
    END CATCH
END;
GO

/* Yayın ve Ödül ilişkilendirme SP */
CREATE PROCEDURE sp_YayinOdulIliskilendir
    @yayin_id INT,
    @odul_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO YayinOduller (yayin_id, odul_id)
        VALUES (@yayin_id, @odul_id);

        COMMIT TRANSACTION;
        PRINT 'Yayın ve ödül başarıyla ilişkilendirildi.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        PRINT 'Hata oluştu! Transaction geri alındı.';
        THROW;
    END CATCH
END;
GO

/* Proje ve Ödül ilişkilendirme SP */
CREATE PROCEDURE sp_ProjeOdulIliskilendir
    @proje_id INT,
    @odul_id INT
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO ProjeOduller (proje_id, odul_id)
        VALUES (@proje_id, @odul_id);

        COMMIT TRANSACTION;
        PRINT 'Proje ve ödül başarıyla ilişkilendirildi.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;
        PRINT 'Hata oluştu! Transaction geri alındı.';
        THROW;
    END CATCH
END;
GO

/*  
    4. ÖRNEK VERİ EKLEME  
    -eklemeler saklı yordamlar üzerinden yapılmaktadır.  
*/  

-- 4.1 Üniversite Ekle  
EXEC sp_UniverSiteEkle @universite_adi = 'Fırat Üniversitesi', @adres = 'Elazığ, Türkiye';  
EXEC sp_UniverSiteEkle @universite_adi = 'Istanbul Üniversitesi', @adres = 'Istanbul, Türkiye';
EXEC sp_UniverSiteEkle @universite_adi = 'Ankara Üniversitesi', @adres = 'Ankara, Türkiye';
EXEC sp_UniverSiteEkle @universite_adi = 'Ege Üniversitesi', @adres = 'Izmir, Türkiye';
EXEC sp_UniverSiteEkle @universite_adi = 'Dokuz Eylül Üniversitesi', @adres = 'Izmir, Türkiye';
EXEC sp_UniverSiteEkle @universite_adi = 'Marmara Üniversitesi', @adres = 'Istanbul, Türkiye';

	
-- 4.2 Bölüm Ekle  
EXEC sp_BolumEkle @bolum_adi = 'Bilgisayar Mühendisliği',@universite_id = 1;  
EXEC sp_BolumEkle @bolum_adi = 'Yazılım Mühendisliği', @universite_id = 1;
EXEC sp_BolumEkle @bolum_adi = 'Elektrik Elektronik Mühendisliği', @universite_id = 1;
EXEC sp_BolumEkle @bolum_adi = 'Makine Mühendisliği', @universite_id = 2;
EXEC sp_BolumEkle @bolum_adi = 'Endüstri Mühendisliği', @universite_id = 3;
EXEC sp_BolumEkle @bolum_adi = 'Mekatronik Mühendisliği', @universite_id = 4;

-- 4.3 Alan Ekle  
EXEC sp_AlanEkle @alan_adi = 'Yapay Zeka';  
EXEC sp_AlanEkle @alan_adi = 'Veri Madenciliği'; 
EXEC sp_AlanEkle @alan_adi = 'Bilgisayar Bilimleri';
EXEC sp_AlanEkle @alan_adi = 'Matematik';
EXEC sp_AlanEkle @alan_adi = 'Fizik';
EXEC sp_AlanEkle @alan_adi = 'Kimya';
EXEC sp_AlanEkle @alan_adi = 'Biyoloji';

-- 4.4 Ödül Ekle  
EXEC sp_OdulEkle @odul_adi = 'En İyi Araştırma Ödülü',   @odul_aciklama = 'Bu ödül her yıl en iyi araştırma yapan akademisyene verilir.';
EXEC sp_OdulEkle @odul_adi = 'En İyi Bilim İnsanı Ödülü',@odul_aciklama = 'Bilim dünyasına önemli katkılarda bulunan bilim insanlarına verilir.';
EXEC sp_OdulEkle @odul_adi = 'En İyi Öğretmen Ödülü',    @odul_aciklama = 'Üstün başarı gösteren öğretmenlere verilir.';
EXEC sp_OdulEkle @odul_adi = 'En İyi Öğrenci Ödülü',	 @odul_aciklama = 'Akademik başarıları ile öne çıkan öğrencilere verilir.';
EXEC sp_OdulEkle @odul_adi = 'En İyi Girişim Ödülü',	 @odul_aciklama = 'Yenilikçi ve başarılı girişimlere verilir.';
EXEC sp_OdulEkle @odul_adi = 'En İyi Yayın Ödülü',       @odul_aciklama = 'Bu ödül en iyi yayına verilir.';
EXEC sp_OdulEkle @odul_adi = 'En İyi Proje Ödülü',		@odul_aciklama = 'Bu ödül en iyi projeye verilir.';

-- 4.5 Konferans Ekle  
EXEC sp_KonferansEkle @konferans_adi = 'Yapay Zeka Konferansı',   @konferans_tarihi = '2025-03-15',   @konferans_yeri = 'İstanbul, Türkiye';  
EXEC sp_KonferansEkle @konferans_adi = 'Uluslararası Yazılım Mühendisliği Konferansı', @konferans_tarihi = '2024-05-10', @konferans_yeri = 'Ankara, Türkiye';
EXEC sp_KonferansEkle @konferans_adi = 'Uluslararası Yapay Zeka Konferansı', @konferans_tarihi = '2024-08-15', @konferans_yeri = 'İstanbul, Türkiye';
EXEC sp_KonferansEkle @konferans_adi = 'Bilim ve Teknoloji Konferansı', @konferans_tarihi = '2024-09-20', @konferans_yeri = 'İzmir, Türkiye';
EXEC sp_KonferansEkle @konferans_adi = 'Uluslararası Robot Teknolojileri Konferansı', @konferans_tarihi = '2024-10-25', @konferans_yeri = 'Antalya, Türkiye';
EXEC sp_KonferansEkle @konferans_adi = 'Geleceğin Teknolojileri Konferansı', @konferans_tarihi = '2024-11-30', @konferans_yeri = 'Muğla, Türkiye';

-- 4.6 Koleksiyon Ekle  
EXEC sp_KoleksiyonEkle @koleksiyon_adi = 'Makine Öğrenmesi Koleksiyonu', 		@aciklama = 'Makine öğrenmesi ile ilgili önemli yayınlar.';  
EXEC sp_KoleksiyonEkle @koleksiyon_adi = 'Veri Madenciliği Koleksiyonu',		@aciklama = 'Veri madenciliği ile ilgili önemli yayınlar.';
EXEC sp_KoleksiyonEkle @koleksiyon_adi = 'Yapay Zeka Uygulamaları Koleksiyonu', @aciklama = 'Yapay zeka uygulamaları ile ilgili önemli yayınlar.';
EXEC sp_KoleksiyonEkle @koleksiyon_adi = 'Bilimsel Makaleler Koleksiyonu',		@aciklama = 'Farklı bilim dallarında yazılmış makaleler.';
EXEC sp_KoleksiyonEkle @koleksiyon_adi = 'Teknoloji ve İnovasyon Koleksiyonu',  @aciklama = 'Teknoloji ve inovasyon alanındaki gelişmeleri inceleyen yayınlar.';
EXEC sp_KoleksiyonEkle @koleksiyon_adi = 'Eğitim ve Öğretim Koleksiyonu',		@aciklama = 'Eğitim ve öğretim alanında yapılan çalışmaları içeren yayınlar.';

-- 4.7 Finans Kaynağı Ekle  
EXEC sp_FinansKaynaklariEkle @kaynak_adi = 'TÜBİTAK', 		          @kaynak_turu = 'Araştırma Destek Programı';  
EXEC sp_FinansKaynaklariEkle @kaynak_adi = 'AB Fonları',		      @kaynak_turu = 'Proje Destek Programı';
EXEC sp_FinansKaynaklariEkle @kaynak_adi = 'Özel Sektör',		      @kaynak_turu = 'Ar-Ge Fonu';
EXEC sp_FinansKaynaklariEkle @kaynak_adi = 'Bilim Bakanlığı',		  @kaynak_turu = 'Araştırma Bursu';
EXEC sp_FinansKaynaklariEkle @kaynak_adi = 'Uluslararası Kuruluşlar', @kaynak_turu = 'Gelişim Fonu';
EXEC sp_FinansKaynaklariEkle @kaynak_adi = 'Vakıflar',                @kaynak_turu = 'Eğitim Bursu';

-- 4.8 Anahtar Kelime Ekle  
EXEC sp_AnahtarKelimeEkle @anahtar_kelime = 'Yapay Zeka';  
EXEC sp_AnahtarKelimeEkle @anahtar_kelime = 'Veri Madenciliği';
EXEC sp_AnahtarKelimeEkle @anahtar_kelime = 'Makine Öğrenmesi';
EXEC sp_AnahtarKelimeEkle @anahtar_kelime = 'Derin Öğrenme';
EXEC sp_AnahtarKelimeEkle @anahtar_kelime = 'Doğal Dil İşleme';
EXEC sp_AnahtarKelimeEkle @anahtar_kelime = 'Bilgisayar Grafiği';

-- 4.9 Yazar Ekle  
EXEC sp_YazarEkle @ad = 'Ahmet',    @soyad = 'Yılmaz',   @email = 'ahmet.yilmaz@firat.edu.tr',   @unvan = 'Dr.',         @bolum_id = 1;  
EXEC sp_YazarEkle @ad = 'Mehmet',   @soyad = 'Kara',     @email = 'mehmet.kara@firat.edu.tr',    @unvan = 'Prof. Dr.',   @bolum_id = 1;
EXEC sp_YazarEkle @ad = 'Ayşe',		@soyad = 'Demir',    @email = 'ayse.demir@ege.edu.tr',       @unvan = 'Doç. Dr.',    @bolum_id = 2;
EXEC sp_YazarEkle @ad = 'Fatma',	@soyad = 'Kaya',     @email = 'fatma.kaya@istanbul.edu.tr',  @unvan = 'Prof. Dr.',   @bolum_id = 3;
EXEC sp_YazarEkle @ad = 'Hayriye',	@soyad = 'Şahin',    @email = 'hayriye.sahin@ankara.edu.tr', @unvan = 'Dr.',         @bolum_id = 4;
EXEC sp_YazarEkle @ad = 'Ali',		@soyad = 'Yıldız',   @email = 'ali.yildiz@marmara.edu.tr',   @unvan = 'Arş. Gör.',   @bolum_id = 5;
EXEC sp_YazarEkle @ad = 'Veli',		@soyad = 'Öztürk',   @email = 'veli.ozturk@ege.edu.tr',      @unvan = 'Öğr. Gör.',   @bolum_id = 6;
-- 4.10 Yayın Ekle  
EXEC sp_YayinEkle   
    @baslik = 'Yapay Zeka ve Geleceği',   
    @ozet = 'Bu yayın yapay zekanın geleceği üzerine yapılmış bir incelemedir.',   
    @yayin_tarihi = '2024-12-01',   
    @doi = '10.1234/yapayzeka.2024.12345',   
    @koleksiyon_id = 1,   
    @konferans_id = 1,   
    @alan_id = 1,   
    @anahtar_kelime_id = 1,   
    @yazar_id = 1;

EXEC sp_YayinEkle
    @baslik = 'Derin Öğrenme ile Görüntü İşleme',
    @ozet = 'Bu yayında derin öğrenme teknikleri ile görüntü işleme yöntemleri incelenmiştir.',
    @yayin_tarihi = '2024-11-15',
    @doi = '10.567',
    @koleksiyon_id = 1, 
    @konferans_id = 1,
    @alan_id = 1,
    @anahtar_kelime_id = 1,
    @yazar_id = 2; 

EXEC sp_YayinEkle 
	@baslik = 'Veri Madenciliği ve Uygulamaları', 
	@ozet = 'Veri madenciliği tekniklerinin farklı alanlardaki uygulamaları incelenmiştir.',
	@yayin_tarihi = '2024-05-01', @doi = '10.1234/veri.madenciligi.2024.12345',
	@koleksiyon_id = 2, 
	@konferans_id = 2, 
	@alan_id = 2, 
	@anahtar_kelime_id = 2, 
	@yazar_id = 2;

EXEC sp_YayinEkle 
	@baslik = 'Yapay Zeka ve Etik', 
	@ozet = 'Yapay zeka teknolojilerinin etik boyutları ele alınmıştır.', 
	@yayin_tarihi = '2024-06-15', 
	@doi = '10.5678/yapay.zeka.2024.67890', 
	@koleksiyon_id = 3, 
	@konferans_id = 3, 
	@alan_id = 3, 
	@anahtar_kelime_id = 3, 
	@yazar_id = 3;

EXEC sp_YayinEkle 
	@baslik = 'Eğitimde Teknoloji Kullanımı', 
	@ozet = 'Eğitim alanında kullanılan teknolojilerin etkileri incelenmiştir.', 
	@yayin_tarihi = '2024-07-20', 
	@doi = '10.9012/egitim.teknoloji.2024.01234', 
	@koleksiyon_id = 4, 
	@konferans_id = 4, 
	@alan_id = 4, 
	@anahtar_kelime_id = 4, 
	@yazar_id = 4;

EXEC sp_YayinEkle 
	@baslik = 'Geleceğin Enerji Kaynakları', 
	@ozet = 'Gelecekte kullanılabilecek enerji kaynakları ve teknolojileri incelenmiştir.', 
	@yayin_tarihi = '2024-08-25', 
	@doi = '10.3456/enerji.kaynaklari.2024.56789', 
	@koleksiyon_id = 5, 
	@konferans_id = 5, 
	@alan_id = 5, 
	@anahtar_kelime_id = 5, 
	@yazar_id = 5;

EXEC sp_YayinEkle 
	@baslik = 'Sağlıkta Yapay Zeka',
	@ozet = 'Yapay zeka uygulamalarının sağlık alanındaki kullanım alanları incelenmiştir.', 
	@yayin_tarihi = '2024-09-30', @doi = '10.7890/saglik.yapayzeka.2024.90123', 
	@koleksiyon_id = 6, 
	@konferans_id = 6, 
	@alan_id = 6, 
	@anahtar_kelime_id = 6, 
	@yazar_id = 6;

	-- 4.11 Proje Ekle  
EXEC sp_ProjeEkle   
    @proje_adi = 'yapay_Zeka_Uygulamaları',   
    @proje_aciklama = 'Bu proje yapay zeka uygulamalarını geliştirmeyi amaçlamaktadır.',   
    @kaynak_id = 1,   
    @alan_id = 1,   
    @bolum_id = 1,   
    @yazar_id = 1;

EXEC sp_ProjeEkle
    @proje_adi = 'Akıllı Sistemler',
    @proje_aciklama = 'Bu proje akıllı sistemlerin geliştirilmesini amaçlamaktadır.',
    @kaynak_id = 1,
    @alan_id = 1,
    @bolum_id = 1,
    @yazar_id = 2; 

EXEC sp_ProjeEkle 
	@proje_adi = 'Akıllı Ev Sistemleri', 
	@proje_aciklama = 'Ev otomasyonu için akıllı sistemlerin geliştirilmesi.', 
	@kaynak_id = 2, 
	@alan_id = 2, 
	@bolum_id = 2, 
	@yazar_id = 2;
EXEC sp_ProjeEkle 
	@proje_adi = 'Yenilenebilir Enerji Kaynakları', 
	@proje_aciklama = 'Güneş enerjisi ve rüzgar enerjisi gibi yenilenebilir enerji kaynaklarının kullanımı.', 
	@kaynak_id = 3, 
	@alan_id = 3, 
	@bolum_id = 3, 
	@yazar_id = 3;
EXEC sp_ProjeEkle 
	@proje_adi = 'Eğitimde Yapay Zeka', 
	@proje_aciklama = 'Yapay zeka destekli eğitim materyalleri ve öğrenme sistemleri geliştirme.', 
	@kaynak_id = 4, 
	@alan_id = 4, 
	@bolum_id = 4, 
	@yazar_id = 4;
EXEC sp_ProjeEkle 
	@proje_adi = 'Tıbbi Tanı Sistemleri', 
	@proje_aciklama = 'Hastalıkların teşhisinde yapay zeka ve makine öğrenmesi kullanımı.', 
	@kaynak_id = 5, 
	@alan_id = 5, 
	@bolum_id = 5, 
	@yazar_id = 5;
EXEC sp_ProjeEkle 
	@proje_adi = 'Akıllı Tarım Uygulamaları', 
	@proje_aciklama = 'Tarım verimliliğini artırmak için akıllı teknolojilerin kullanımı.', 
	@kaynak_id = 6,
	@alan_id = 6,
	@bolum_id = 6,
	@yazar_id = 6;

-- 4.12 INSERT INTO ile ekleme örnekleri
INSERT INTO Universiteler (universite_adi, adres)
VALUES ('Boğaziçi Üniversitesi', 'İstanbul, Türkiye');

INSERT INTO Bolumler (bolum_adi, universite_id)
VALUES ('Elektrik-Elektronik Mühendisliği', 1);

INSERT INTO Alanlar (alan_adi)
VALUES ('Robotik');

INSERT INTO Oduller (odul_adi, odul_aciklama)
VALUES ('En İyi Makale Ödülü', 'Konferansta sunulan en iyi makaleye verilir.');

INSERT INTO Konferanslar (konferans_adi, konferans_tarihi, konferans_yeri)
VALUES ('Uluslararası Robotik Konferansı', '2024-08-10', 'Ankara, Türkiye');

INSERT INTO Koleksiyonlar (koleksiyon_adi, aciklama)
VALUES ('Yapay Zeka Makaleleri', 'Yapay zeka alanındaki makalelerden oluşan koleksiyon.');

INSERT INTO FinansKaynaklari (kaynak_adi, kaynak_turu)
VALUES ('KOSGEB', 'KOBİ Destek Programı');

INSERT INTO AnahtarKelimeler (anahtar_kelime)
VALUES ('Makine Öğrenmesi');

INSERT INTO Yazarlar (ad, soyad, email, unvan, bolum_id)
VALUES ('Can', 'Deniz', 'can.deniz@example.com', 'Dr. Öğr. Üyesi', 1);

INSERT INTO Yayinlar (baslik, ozet, yayin_tarihi, doi, koleksiyon_id, konferans_id, alan_id, anahtar_kelime_id)
VALUES ('Yeni Bir Yapay Zeka Algoritması', 'Bu makalede yeni bir yapay zeka algoritması tanıtılmaktadır.', '2024-05-05', '10.1234/yeni.algoritma', 1, 1, 1, 1);

INSERT INTO Projeler (proje_adi, proje_aciklama, kaynak_id, alan_id, bolum_id)
VALUES ('Mobil Robot Geliştirme', 'Bu proje kapsamında mobil bir robot geliştirilecektir.', 1, 1, 1);



-- 4.13 Ödül İlişkilendirmeleri

-- Ahmet Yılmaz'a "En İyi Araştırma Ödülü" verelim
EXEC sp_YazarOdulIliskilendir @yazar_id = 1, @odul_id = 1;

-- Mehmet Kara'ya da "En İyi Araştırma Ödülü" verelim (Ödül birden fazla yazara verilebilir)
EXEC sp_YazarOdulIliskilendir @yazar_id = 2, @odul_id = 1;

-- "Yapay Zeka ve Geleceği" yayınına "En İyi Yayın Ödülü" verelim
EXEC sp_YayinOdulIliskilendir @yayin_id = 1, @odul_id = 2;

-- "Yapay Zeka Uygulamaları" projesine "En İyi Proje Ödülü" verelim
EXEC sp_ProjeOdulIliskilendir @proje_id = 1, @odul_id = 3;

/*  
    5. KONTROL AMAÇLI BAZI SORGULAR  
*/  
SELECT * FROM Universiteler;  
SELECT * FROM Bolumler;  
SELECT * FROM Yazarlar;  
SELECT * FROM Yayinlar;  
SELECT * FROM YayinYazarlar;  
SELECT * FROM Projeler;  
SELECT * FROM ProjeYazarlar;
SELECT * FROM Oduller;
SELECT * FROM YazarOduller;
SELECT * FROM YayinOduller;
SELECT * FROM ProjeOduller;

-- Ahmet Yılmaz'ın aldığı ödüller
SELECT O.odul_adi
FROM Yazarlar Y
JOIN YazarOduller YO ON Y.yazar_id = YO.yazar_id
JOIN Oduller O ON YO.odul_id = O.odul_id
WHERE Y.ad = 'Ahmet' AND Y.soyad = 'Yılmaz';

-- "En İyi Araştırma Ödülü" alan yazarlar
SELECT Y.ad, Y.soyad
FROM Oduller O
JOIN YazarOduller YO ON O.odul_id = YO.odul_id
JOIN Yazarlar Y ON YO.yazar_id = Y.yazar_id
WHERE O.odul_adi = 'En İyi Araştırma Ödülü';

-- "En İyi Yayın Ödülü" alan yayınlar
SELECT Y.baslik
FROM Oduller O
JOIN YayinOduller YY ON O.odul_id = YY.odul_id
JOIN Yayinlar Y ON YY.yayin_id = Y.yayin_id
WHERE O.odul_adi = 'En İyi Yayın Ödülü';

-- "En İyi Proje Ödülü" alan projeler
SELECT P.proje_adi
FROM Oduller O
JOIN ProjeOduller PO ON O.odul_id = PO.odul_id
JOIN Projeler P ON PO.proje_id = P.proje_id
WHERE O.odul_adi = 'En İyi Proje Ödülü';


