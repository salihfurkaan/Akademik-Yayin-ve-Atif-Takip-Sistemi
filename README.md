# Akademik Yayın ve Atıf Takip Sistemi

Bu sistemin amacı, akademik çalışmaların ve projelerin yönetilmesini sağlamak, araştırmacıların ve akademisyenlerin katkılarını takip etmek ve akademik içeriklerin (yayınlar, projeler, konferanslar, ödüller vb.) bir arada sunulmasını kolaylaştırmaktır. Sistem, üniversiteler, bölümler, alanlar ve diğer akademik öğeler arasındaki ilişkileri düzenleyerek, akademik içeriklerin takibini etkili bir şekilde sağlar.

# Projeyi Yapan Öğrenciler

- 225260058 - Fuat Yavaş
- 225260016 - İsmail Şahin
- 225260052 - Salih Furkan Erik


# Sistem Gereksinimleri

# 1. Kullanıcı Tipleri ve Roller
- **Yazarlar (Araştırmacılar)**: Akademik içerik üreten ve yöneten araştırmacılar ve akademisyenler.
- **Yöneticiler**: Sistemi yönetme yetkisine sahip olan ve tüm verileri düzenleyebilen kullanıcılar.

# 2. Temel İşlevsel Gereksinimler

## 2.1 Üniversite Yönetimi
- **Üniversite Bilgisi Yönetimi**: Yeni üniversiteler sisteme eklenebilmeli; üniversiteye ait bilgiler ve adres detayları düzenlenebilir.
- **Bölüm Yönetimi**: Üniversitelere bağlı olarak bölümler eklenebilir; her bölümün üniversiteye olan bağı tanımlanır. Gerektiğinde bölümler ve üniversiteler sistemden kaldırılabilir.

## 2.2 Araştırma Alanları ve Konular
- **Araştırma Alanı Ekleme**: Yeni araştırma alanları tanımlanarak akademik içeriklere alan bazında etiketleme yapılabilir.
- **Anahtar Kelime Yönetimi**: Yayınların ve projelerin arama kolaylığı sağlamak için anahtar kelimeler eklenebilir ve düzenlenebilir.

## 2.3 Yayın Yönetimi
- **Yayın Ekleme ve Düzenleme**: Yazarlar, yayınlarının başlık, özet, tarih ve konferans bağlantılarını ekleyebilir. Yayınlar konferans veya koleksiyonlar ile ilişkilendirilebilir.
- **Yorum Yapma ve Etkileşim**: Kullanıcılar yayınlar hakkında yorum yapabilir; yayınlara anahtar kelimeler, araştırma alanları ve ödüller eklenebilir.

## 2.4 Konferans ve Proje Yönetimi
- **Konferans Bilgileri**: Konferanslar tarih, yer gibi detaylarla sisteme eklenir ve projeler ya da yayınlar ile ilişkilendirilebilir.
- **Proje Yönetimi**: Araştırma projeleri eklenebilir, açıklamaları ve ödülleriyle birlikte ilgili alanlarla ve finans kaynakları ile ilişkilendirilebilir.

## 2.5 Ödül ve Finansman Yönetimi
- **Ödüller**: Akademik başarıları tanımlayan ödüller, yayın veya projeler ile ilişkilendirilebilir.
- **Finans Kaynakları**: Araştırma projeleri için sağlanan finansal kaynak bilgileri eklenebilir ve türlerine göre kategorize edilebilir.

# 3. Sistem Gereksinimleri

## 3.1 Veritabanı Gereksinimleri
- **Veritabanı Yapısı**: Veritabanı, üniversiteler, bölümler, yayınlar, projeler, ödüller ve diğer bileşenleri içerecek şekilde yapılandırılmalıdır.
- **İlişki Yapıları**: Dış anahtar ilişkileri doğru bir şekilde tanımlanarak veri bütünlüğü sağlanmalıdır.
- **Veri Tutarlılığı**: Veritabanında tutarlılık sağlanmalı ve tüm tablolar arasındaki ilişkiler doğrulanmalıdır.

## 3.2 Kullanıcı Arayüzü Gereksinimleri
- **Yazar Arayüzü**: Yazarlar kendi yayın ve projelerini ekleyip düzenleyebileceği bir arayüze sahip olmalıdır.
- **Arama ve Filtreleme**: Yayınlar, konferanslar ve projeler anahtar kelime, tarih, yazar ve alan bazında filtrelenebilir ve aranabilir.

## 3.3 Güvenlik Gereksinimleri
- **Kimlik Doğrulama ve Yetkilendirme**: Kullanıcıların güvenli bir şekilde sisteme giriş yapabilmesi ve doğrulama sürecinden geçmesi sağlanmalıdır.
- **Rol Tabanlı Erişim**: Kullanıcılar (yazar, yönetici, genel kullanıcı) için farklı erişim seviyeleri tanımlanarak yetki kontrolü yapılmalıdır.

## Tablolar ve İlişkiler

## İlişkiler

| İlişki                     | Varlık 1         | Varlık 2           | İlişkiler   |
|----------------------------|------------------|--------------------|-------------|
| Sahip                     | Üniversiteler    | Bölümler           | 1:N         |
| Ait                       | Bölümler         | Üniversiteler      | N:1         |
| İstihdam Ediyor           | Bölümler         | Yazarlar           | 1:N         |
| İçinde Çalışıyor          | Yazarlar         | Bölümler           | N:1         |
| Yazarı                    | Yazarlar         | Yayınlar           | N:N         |
| Yayında Bulunan           | Yayınlar         | Yazarlar           | N:N         |
| Finanse Ediyor            | FinansKaynakları | Projeler           | 1:N         |
| Tarafından Finanse Edilen | Projeler         | FinansKaynakları   | N:1         |
| Üzerine Odaklanıyor       | Projeler         | Alanlar            | 1:N         |
| Alanı                     | Alanlar          | Projeler           | N:1         |
| Tarafından Yürütülen      | Projeler         | Bölümler           | 1:N         |
| İçin Bölüm                | Bölümler         | Projeler           | N:1         |
| Proje Kazanır             | Projeler         | Ödüller            | N:N         |
| Projeye Verilen           | Ödüller          | Projeler           | N:N         |
| Parçası                   | Yayınlar         | Koleksiyonlar      | N:1         |
| Koleksiyon İçerir         | Koleksiyonlar    | Yayınlar           | 1:N         |
| Sunulduğu Yer             | Yayınlar         | Konferanslar       | N:1         |
| Konferans İçerir          | Konferanslar     | Yayınlar           | 1:N         |
| Yayının Alanı             | Yayınlar         | Alanlar            | N:1         |
| Yayının Alanları          | Alanlar          | Yayınlar           | 1:N         |
| İle Etiketlenmiş          | Yayınlar         | AnahtarKelimeler   | N:1         |
| İçin Anahtar Kelime       | AnahtarKelimeler | Yayınlar           | 1:N         |
| Yayın Kazanır             | Yayınlar         | Ödüller            | N:N         |
| Yayına Verilen            | Ödüller          | Yayınlar           | N:N         |
| Yazar Kazanır             | Yazarlar         | Ödüller            | N:N         |
| Yazara Verilen            | Ödüller          | Yazarlar           | N:N         |
| Yazar Katkıda Bulunur     | Yazarlar         | Projeler           | N:N         |
| Proje İçerir              | Projeler         | Yazarlar           | N:N         |


## Tablolar

### Universiteler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| universite_no    | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| universite_adi   | VARCHAR(255)| NOT NULL                        |
| adres            | TEXT        | NULL                            |

### Bolumler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| bolum_no         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| bolum_adi        | VARCHAR(255)| NOT NULL                        |
| universite_no    | INT         | NOT NULL, FOREIGN KEY (Universiteler) |


### Alanlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| alan_no          | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| alan_adi         | VARCHAR(255)| NOT NULL                        |


### Oduller
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| odul_no          | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| odul_adi         | VARCHAR(255)| NOT NULL                        |
| odul_aciklama    | TEXT        | NULL                            |


### Konferanslar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| konferans_no     | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| konferans_adi    | VARCHAR(255)| NOT NULL                        |
| konferans_tarihi | DATE        | NULL                            |
| konferans_yeri   | VARCHAR(255)| NULL                            |


### Koleksiyonlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| koleksiyon_no    | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| koleksiyon_adi   | VARCHAR(255)| NOT NULL                        |
| aciklama         | TEXT        | NULL                            |


### FinansKaynaklari
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| kaynak_no        | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| kaynak_adi       | VARCHAR(255)| NOT NULL                        |
| kaynak_turu      | VARCHAR(255)| NULL                            |


### AnahtarKelimeler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| anahtar_kelime_no| INT         | PRIMARY KEY, IDENTITY(1,1)      |
| anahtar_kelime   | VARCHAR(255)| NOT NULL                        |


### Yazarlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yazar_no         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| ad               | VARCHAR(255)| NOT NULL                        |
| soyad            | VARCHAR(255)| NOT NULL                        |
| eposta           | VARCHAR(255)| NOT NULL, UNIQUE                |
| unvan            | VARCHAR(255)| NULL                            |
| bolum_no         | INT         | NOT NULL, FOREIGN KEY (Bolumler)|


### Yayinlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yayin_no         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| baslik           | VARCHAR(255)| NOT NULL                        |
| ozet             | TEXT        | NULL                            |
| yayin_tarihi     | DATE        | NULL                            |
| doi              | VARCHAR(255)| NULL, UNIQUE                    |
| koleksiyon_no    | INT         | NULL, FOREIGN KEY (Koleksiyonlar)|
| konferans_no     | INT         | NULL, FOREIGN KEY (Konferanslar)|
| alan_no          | INT         | NULL, FOREIGN KEY (Alanlar)     |
| anahtar_kelime_no| INT         | NULL, FOREIGN KEY (AnahtarKelimeler)|

### YayınYazarlar Tablosu
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yayin_no         | INT         | FOREIGN KEY (Yayinlar)          |
| yazar_no         | INT         | FOREIGN KEY (Yazarlar)          |
| PRIMARY KEY      | (yayin_no, yazar_no)                           |

### Projeler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| proje_no         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| proje_adi        | VARCHAR(255)| NOT NULL                        |
| proje_aciklama   | TEXT        | NULL                            |
| kaynak_no        | INT         | NOT NULL, FOREIGN KEY (FinansKaynaklari)|
| alan_no          | INT         | NOT NULL, FOREIGN KEY (Alanlar) |
| bolum_no         | INT         | NOT NULL, FOREIGN KEY (Bolumler)|

### ProjeYazarlar Tablosu
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| proje_no         | INT         | FOREIGN KEY (Projeler)          |
| yazar_no         | INT         | FOREIGN KEY (Yazarlar)          |
| PRIMARY KEY      | (proje_no, yazar_no)                          |

### YazarÖdüller Tablosu

| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yazar_no         | INT         | FOREIGN KEY (Yazarlar)          |
| odul_no          | INT         | FOREIGN KEY (Oduller)           |
| PRIMARY KEY      | (yazar_no, odul_no)                           |

### YayınÖdüller Tablosu

| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yayin_no         | INT         | FOREIGN KEY (Yayinlar)          |
| odul_no          | INT         | FOREIGN KEY (Oduller)           |
| PRIMARY KEY      | (yayin_no, odul_no)                           |

### ProjeÖdüller Tablosu

| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| proje_no         | INT         | FOREIGN KEY (Projeler)          |
| odul_no          | INT         | FOREIGN KEY (Oduller)           |
| PRIMARY KEY      | (proje_no, odul_no)                           |

## Veri Tabanı E-R Diyagramı



![Veri Tabanı Şeması](https://github.com/user-attachments/assets/5e87723f-c3ce-465d-bcc9-4d19c02f45d1)

## Kurulum

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır.
