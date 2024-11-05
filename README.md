# Akademik Yayın ve Atıf Takip Sistemi

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi amaçlamaktadır. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri ve aralarındaki ilişkileri yönetir. Ayrıca kullanıcı rolleri, erişim hakları, projeler ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Bu sistem, yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimi gibi işlevsellikler sunar.

## Veri Tabanı Şeması

![Veri Tabanı Şeması](https://github.com/user-attachments/assets/d0c55f10-023c-4714-8fcd-3b88bcd5ccd0)

# Sistem Gereksinimleri

## 1. Temel Kullanıcılar
- **Yazarlar (Araştırmacılar)**: Akademik içerik üreticileri, araştırmacılar ve akademisyenler.
- **Kullanıcılar**: Sistemi kullanan genel kullanıcılar (akademik içerikleri sorgulayan, yorum yapan, vb.).
- **Yöneticiler**: Sistemi yöneten kişiler, verileri ekleyen ve yöneten kişiler.

## 2. Temel İşlevsel Gereksinimler

### 2.1. Üniversite Yönetimi
- **Üniversite Bilgisi Ekleme**: Yeni üniversiteler sisteme eklenebilir.
- **Bölüm Ekleme**: Üniversiteler altındaki bölümler eklenebilir ve her bölümün hangi üniversiteye ait olduğu belirlenebilir.
- **Üniversite/Bölüm Silme**: Yönetici, üniversiteleri ve bölümleri silebilir.

### 2.2. Araştırma Alanları ve Konular
- **Araştırma Alanı Ekleme**: Alanlar tablosu aracılığıyla yeni araştırma alanları eklenebilir.
- **Anahtar Kelimeler Ekleme**: Yayınlarda arama kolaylığı sağlamak için anahtar kelimeler eklenebilir.

### 2.3. Yayın Yönetimi
- **Yayın Ekleme**: Yazarlar, yayınlarının başlıklarını, özetlerini, tarihleri gibi bilgileri girebilir. Yayınlar belirli bir konferans veya koleksiyonla ilişkilendirilebilir.
- **Yayınlara Yorum Yapma**: Kullanıcılar, yayınlar hakkında yorum yapabilir.
- **Yayınları Etiketleme**: Yayınlar, alanlar, anahtar kelimeler ve ödüllerle ilişkilendirilebilir.

### 2.4. Konferanslar ve Projeler
- **Konferans Ekleme**: Konferanslar, tarihleri ve yerleri ile sisteme eklenebilir.
- **Proje Ekleme**: Araştırma projeleri, projelere dair açıklamalar, ödüller ve finansal kaynaklar eklenebilir.

### 2.5. Ödüller ve Finansal Kaynaklar
- **Odüller Ekleme**: Akademik başarılar ödüllerle ilişkilendirilebilir.
- **Finansal Kaynaklar Ekleme**: Araştırma projeleri için finansal kaynaklar eklenebilir.

## 3. Sistem Gereksinimleri

### 3.1. Veritabanı Gereksinimleri
- Veritabanı, üniversiteler, bölümler, yayınlar, projeler, ödüller, anahtar kelimeler gibi birçok tabloyu içermelidir.
- Veritabanında dış anahtar ilişkileri (FK) doğru şekilde yapılandırılmalıdır.
- Veri bütünlüğü sağlanmalı, veriler tutarlı ve doğru olmalıdır.

### 3.2. Kullanıcı Arayüzü Gereksinimleri
- **Yazar Arayüzü**: Yazarlar, yayınlarını ve projelerini ekleyip düzenleyebilecektir.
- **Yorum ve Oylama Sistemi**: Kullanıcılar, yayınlar ve projeler hakkında yorum yapıp değerlendirme gerçekleştirebilir.
- **Arama ve Filtreleme**: Kullanıcılar, yayınlar, konferanslar ve projeler arasında anahtar kelimeler, tarih, yazar vb. kriterlere göre arama yapabilir.

### 3.3. Güvenlik Gereksinimleri
- **Kullanıcı Girişi ve Kimlik Doğrulama**: Kullanıcılar için güvenli giriş ve kimlik doğrulama sistemleri olmalıdır.
- **Rol Tabanlı Erişim Kontrolü**: Yöneticiler, kullanıcılar ve yazarlar için farklı erişim seviyeleri belirlenmelidir.

##  Tablolar ve İlişkiler

## İlişkiler

| İlişki                     | Varlık 1         | Varlık 2           | İlişkiler   |
|---------------------------|------------------|---------------------|-------------|
| Sahip Olur                | Universiteler    | Bolumler            | 1:N         |
| Barındırır                | Bolumler         | Yazarlar            | 1:N         |
| Olabilir                  | Yazarlar         | Kullanicilar        | 1:N         |
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
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| universite_id   | INT           | IDENTITY(1,1)        |
| universite_adi  | VARCHAR(255)  | NOT NULL             |
| adres           | TEXT          | NULL                 |

### Bolumler
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| bolum_id        | INT           | IDENTITY(1,1)        |
| bolum_adi       | VARCHAR(255)  | NOT NULL             |
| universite_id   | INT           | FK (Universiteler)   |

### Alanlar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| alan_id         | INT           | IDENTITY(1,1)        |
| alan_adi        | VARCHAR(255)  | NOT NULL             |

### Oduller
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| odul_id         | INT           | IDENTITY(1,1)        |
| odul_adi        | VARCHAR(255)  | NOT NULL             |
| odul_aciklama   | TEXT          | NULL                 |

### Konferanslar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| konferans_id    | INT           | IDENTITY(1,1)        |
| konferans_adi   | VARCHAR(255)  | NOT NULL             |
| konferans_tarihi| DATE          | NULL                 |
| konferans_yeri  | VARCHAR(255)  | NULL                 |

### Koleksiyonlar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| koleksiyon_id   | INT           | IDENTITY(1,1)        |
| koleksiyon_adi  | VARCHAR(255)  | NOT NULL             |
| aciklama        | TEXT          | NULL                 |

### FinansKaynaklari
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| kaynak_id       | INT           | IDENTITY(1,1)        |
| kaynak_adi      | VARCHAR(255)  | NOT NULL             |
| kaynak_turu     | VARCHAR(255)  | NULL                 |

### AnahtarKelimeler
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| anahtar_kelime_id | INT         | IDENTITY(1,1)        |
| anahtar_kelime   | VARCHAR(255)  | NOT NULL             |

### Yazarlar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| yazar_id        | INT           | IDENTITY(1,1)        |
| ad              | VARCHAR(255)  | NOT NULL             |
| soyad           | VARCHAR(255)  | NOT NULL             |
| email           | VARCHAR(255)  | UNIQUE               |
| unvan           | VARCHAR(255)  | NULL                 |
| bolum_id        | INT           | FK (Bolumler)        |

### Yayinlar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| yayin_id        | INT           | IDENTITY(1,1)        |
| baslik          | VARCHAR(255)  | NOT NULL             |
| ozet            | TEXT          | NULL                 |
| yayin_tarihi    | DATE          | NULL                 |
| doi             | VARCHAR(255)  | UNIQUE               |
| koleksiyon_id   | INT           | FK (Koleksiyonlar)   |
| konferans_id    | INT           | FK (Konferanslar)    |
| alan_id         | INT           | FK (Alanlar)         |
| anahtar_kelime_id | INT         | FK (AnahtarKelimeler)|
| yazar_id        | INT           | FK (Yazarlar)        |
| odul_id         | INT           | FK (Oduller)         |

### Projeler
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| proje_id        | INT           | IDENTITY(1,1)        |
| proje_adi       | VARCHAR(255)  | NOT NULL             |
| proje_aciklama  | TEXT          | NULL                 |
| kaynak_id       | INT           | FK (FinansKaynaklari)|
| alan_id         | INT           | FK (Alanlar)         |
| bolum_id        | INT           | FK (Bolumler)        |
| yazar_id        | INT           | FK (Yazarlar)        |
| odul_id         | INT           | FK (Oduller)         |

### Kullanicilar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| kullanici_id    | INT           | IDENTITY(1,1)        |
| kullanici_adi   | VARCHAR(255)  | NOT NULL, UNIQUE     |
| sifre           | VARCHAR(255)  | NOT NULL             |
| rol             | VARCHAR(50)   | NULL                 |
| yazar_id        | INT           | FK (Yazarlar)        |

### Yorumlar
| Kolon           | Tür           | Özellikler           |
|-----------------|---------------|----------------------|
| yorum_id        | INT           | IDENTITY(1,1)        |
| yayin_id        | INT           | FK (Yayinlar)        |
| kullanici_id    | INT           | FK (Kullanicilar)    |
| yorum_metni     | TEXT          | NOT NULL             |
| yorum_tarihi    | DATETIME      | DEFAULT CURRENT_TIMESTAMP |


## Kurulum

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır. 

