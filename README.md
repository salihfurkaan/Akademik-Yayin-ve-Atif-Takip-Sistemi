# Akademik Yayın ve Atıf Takip Sistemi

Bu sistemin amacı, akademik çalışmaların ve projelerin yönetilmesini sağlamak, araştırmacıların ve akademisyenlerin katkılarını takip etmek ve akademik içeriklerin (yayınlar, projeler, konferanslar, ödüller vb.) bir arada sunulmasını kolaylaştırmaktır. Sistem, üniversiteler, bölümler, alanlar ve diğer akademik öğeler arasındaki ilişkileri düzenleyerek, akademik içeriklerin takibini etkili bir şekilde sağlar.

# Projeyi Yapan Öğrenciler

- 225260058 - Fuat Yavaş
- 225260016 - İsmail Şahin
- 225260052 - Salih Furkan Erik


# Sistem Gereksinimleri

# 1. Kullanıcı Tipleri ve Roller
- **Yazarlar (Araştırmacılar)**: Akademik içerik üreten ve yöneten araştırmacılar ve akademisyenler.
- **Kullanıcılar**: Akademik içeriği sorgulayan ve yorum yapan genel kullanıcılar.
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
- **Yorum ve Oylama Sistemleri**: Kullanıcılar akademik içerikler hakkında yorum yapıp değerlendirme bırakabilir.
- **Arama ve Filtreleme**: Yayınlar, konferanslar ve projeler anahtar kelime, tarih, yazar ve alan bazında filtrelenebilir ve aranabilir.

## 3.3 Güvenlik Gereksinimleri
- **Kimlik Doğrulama ve Yetkilendirme**: Kullanıcıların güvenli bir şekilde sisteme giriş yapabilmesi ve doğrulama sürecinden geçmesi sağlanmalıdır.
- **Rol Tabanlı Erişim**: Kullanıcılar (yazar, yönetici, genel kullanıcı) için farklı erişim seviyeleri tanımlanarak yetki kontrolü yapılmalıdır.

## Tablolar ve İlişkiler

## İlişkiler

| İlişki                     | Varlık 1         | Varlık 2           | İlişkiler   |
|---------------------------|------------------|---------------------|-------------|
| Sahip Olur                | Universiteler    | Bolumler            | 1:N         |
| Barındırır                | Bolumler         | Yazarlar            | N:N         |
| Olabilir                  | Yazarlar         | Kullanicilar        | 1:1         |
| Katılır                   | Yazarlar         | Projeler            | N:N         |
| Yazar                     | Yazarlar         | Yayinlar            | N:N         |
| Yazar                     | Kullanicilar     | Yorumlar            | 1:N         |
| Finansmanı                | Projeler         | FinansKaynaklari    | 1:N         |
| Alanında                  | Projeler         | Alanlar             | N:N         |
| Yürütülür                 | Projeler         | Bolumler            | N:N         |
| Kazanır                   | Projeler         | Oduller             | N:N         |
| İçinde                    | Yayinlar         | Koleksiyonlar       | 1:N         |
| Sunulur                   | Yayinlar         | Konferanslar        | N:N         |
| Alanında                  | Yayinlar         | Alanlar             | N:N         |
| İçerir                    | Yayinlar         | AnahtarKelimeler    | N:N         |
| Kazanır                   | Yayinlar         | Oduller             | 1:N         |
| Alır                      | Yayinlar         | Yorumlar            | 1:N         |


## Tablolar

### Universiteler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| universite_id    | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| universite_adi   | VARCHAR(255)| NOT NULL                        |
| adres            | TEXT        | NULL                            |

### Bolumler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| bolum_id         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| bolum_adi        | VARCHAR(255)| NOT NULL                        |
| universite_id    | INT         | FK (Universiteler)              |

### Alanlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| alan_id          | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| alan_adi         | VARCHAR(255)| NOT NULL                        |

### Oduller
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| odul_id          | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| odul_adi         | VARCHAR(255)| NOT NULL                        |
| odul_aciklama    | TEXT        | NULL                            |

### Konferanslar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| konferans_id     | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| konferans_adi    | VARCHAR(255)| NOT NULL                        |
| konferans_tarihi | DATE        | NULL                            |
| konferans_yeri   | VARCHAR(255)| NULL                            |

### Koleksiyonlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| koleksiyon_id    | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| koleksiyon_adi   | VARCHAR(255)| NOT NULL                        |
| aciklama         | TEXT        | NULL                            |

### FinansKaynaklari
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| kaynak_id        | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| kaynak_adi       | VARCHAR(255)| NOT NULL                        |
| kaynak_turu      | VARCHAR(255)| NULL                            |

### AnahtarKelimeler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| anahtar_kelime_id| INT         | PRIMARY KEY, IDENTITY(1,1)      |
| anahtar_kelime   | VARCHAR(255)| NOT NULL                        |

### Yazarlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yazar_id         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| ad               | VARCHAR(255)| NOT NULL                        |
| soyad            | VARCHAR(255)| NOT NULL                        |
| email            | VARCHAR(255)| UNIQUE                          |
| unvan            | VARCHAR(255)| NULL                            |
| bolum_id         | INT         | FK (Bolumler)                   |

### Yayinlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yayin_id         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| baslik           | VARCHAR(255)| NOT NULL                        |
| ozet             | TEXT        | NULL                            |
| yayin_tarihi     | DATE        | NULL                            |
| doi              | VARCHAR(255)| UNIQUE                          |
| koleksiyon_id    | INT         | FK (Koleksiyonlar)              |
| konferans_id     | INT         | FK (Konferanslar)               |
| alan_id          | INT         | FK (Alanlar)                    |
| anahtar_kelime_id| INT         | FK (AnahtarKelimeler)           |
| yazar_id         | INT         | FK (Yazarlar)                   |
| odul_id          | INT         | FK (Oduller)                    |

### Projeler
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| proje_id         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| proje_adi        | VARCHAR(255)| NOT NULL                        |
| proje_aciklama   | TEXT        | NULL                            |
| kaynak_id        | INT         | FK (FinansKaynaklari)           |
| alan_id          | INT         | FK (Alanlar)                    |
| bolum_id         | INT         | FK (Bolumler)                   |
| yazar_id         | INT         | FK (Yazarlar)                   |
| odul_id          | INT         | FK (Oduller)                    |

### Kullanicilar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| kullanici_id     | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| kullanici_adi    | VARCHAR(255)| NOT NULL, UNIQUE                |
| sifre            | VARCHAR(255)| NOT NULL                        |
| rol              | VARCHAR(50) | NULL                            |
| yazar_id         | INT         | FK (Yazarlar)                   |

### Yorumlar
| Column           | Type        | Properties                       |
|------------------|-------------|----------------------------------|
| yorum_id         | INT         | PRIMARY KEY, IDENTITY(1,1)      |
| yayin_id         | INT         | FK (Yayinlar)                   |
| kullanici_id     | INT         | FK (Kullanicilar)               |
| yorum_metni      | TEXT        | NULL                            |
| yorum_tarihi     | DATETIME    | DEFAULT CURRENT_TIMESTAMP       |


## Veri Tabanı E-R Diyagramı




![Veri Tabanı Şeması](https://github.com/user-attachments/assets/bea2bb31-646c-4596-85d4-2fdc467d62a3)


## Kurulum

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır.
