# Akademik Yayın Yönetim Sistemi

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi amaçlamaktadır. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri ve aralarındaki ilişkileri yönetir. Ayrıca kullanıcı rolleri, erişim hakları, projeler ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Bu sistem, yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimi gibi işlevsellikler sunar.

## Veri Tabanı Şeması
![Veri Tabanı Şeması](https://github.com/user-attachments/assets/e2240128-de86-4efd-8279-509c4dcf693f)

## Veritabanı Tablo İlişkileri
| Ana Tablo 1 | Ara Tablo             | Ana Tablo 2       | Ara Tablo ile İlişki Türü        |
|-------------|------------------------|-------------------|----------------------------------|
| Yayin       | Yayin_Yazar           | Yazar            | Yayin (1-N), Yazar (1-N)         |
| Yayin       | Yayin_Kategori        | Kategori         | Yayin (1-N), Kategori (1-N)      |
| Yazar       | Yazar_Alan            | Alan             | Yazar (1-N), Alan (1-N)          |
| Yazar       | Yazar_Unvan           | Unvan            | Yazar (1-N), Unvan (1-N)         |
| Yazar       | Yazar_Odul            | Odul             | Yazar (1-N), Odul (1-N)          |
| Yazar       | Yazar_Yayıncı         | Yayinci          | Yazar (1-N), Yayinci (1-N)       |
| Proje       | Proje_Yayin           | Yayin            | Proje (1-N), Yayin (1-N)         |
| Proje       | Proje_FinansKaynağı   | Finans_Kaynağı   | Proje (1-N), Finans_Kaynağı (1-N)|
| Kullanici   | Kullanici_Proje       | Proje            | Kullanici (1-N), Proje (1-N)     |



## Kurulum

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır. 

