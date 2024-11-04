# Akademik Yayın Yönetim Sistemi

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi amaçlamaktadır. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri ve aralarındaki ilişkileri yönetir. Ayrıca kullanıcı rolleri, erişim hakları, projeler ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Bu sistem, yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimi gibi işlevsellikler sunar.

## Veri Tabanı Şeması
![Veri Tabanı Şeması](https://github.com/user-attachments/assets/e2240128-de86-4efd-8279-509c4dcf693f)

## Veritabanı Tablo İlişkileri

Temel Tablolar ve Açıklamaları

1-Yayın_Türü (yayin_turu_id, tur_adi): Bu tablo, akademik çalışmaların türlerini belirtir. Yayın türü, makale, kitap, rapor veya konferans bildirisi gibi çeşitli formatları içerebilir. yayin_turu_id her tür için benzersiz bir tanımlayıcıdır. tur_adi ise yayın türünün adını içerir, böylece hangi türde yayının sistemde yer aldığı kolayca anlaşılabilir.

2-Yayıncı (yayinci_id, yayinci_adi, adres, telefon, enlem, boylam): Yayıncı tablosu, yayınların yayımlandığı yayınevi veya kurumların bilgilerini içerir. Her yayıncı, yayinci_id ile benzersiz bir şekilde tanımlanır. yayinci_adi, adres, telefon, enlem ve boylam alanları ise yayıncı kurumun iletişim ve konum bilgilerini içerir. Yayıncı, yayınların basıldığı veya dijital ortamda yayınlandığı kurumları temsil eder.

3-Konferans (konferans_id, konferans_adi, duzenleyen_kurum, duzenlenme_tarihi, duzenlenme_yeri): Bu tablo, düzenlenen konferansların bilgilerini saklar. konferans_adi, konferansın adını, duzenleyen_kurum ise konferansı düzenleyen kuruluşu ifade eder. duzenlenme_tarihi ve duzenlenme_yeri alanları ise konferansın yapıldığı tarih ve yeri belirtir. Konferanslar, genellikle akademik topluluğun bir araya geldiği ve bilgilerin paylaşıldığı etkinliklerdir.

4-Üniversite (universite_id, universite_adi, adres, ulke, enlem, boylam): Bu tabloda, üniversitelerin bilgileri saklanır. universite_id her üniversiteyi benzersiz olarak tanımlar. universite_adi, adres, ulke, enlem ve boylam alanları üniversitenin adı, adresi, bulunduğu ülke ve coğrafi konumunu içerir. Üniversite bilgileri, yazarların bağlı olduğu kurumları tanımlamak için kullanılır.

5-Bölüm (bolum_id, bolum_adi, universite_id): Üniversiteye bağlı olan bölümleri tanımlar. bolum_id her bölümü benzersiz olarak tanımlar ve universite_id ile hangi üniversiteye bağlı olduğunu gösterir. bolum_adi, bölümün adını ifade eder. Bu tablo, yazarların çalıştığı akademik bölümleri belirtir.

6-Koleksiyon (koleksiyon_id, koleksiyon_adi, aciklama): Yayınların dahil olabileceği koleksiyonları tanımlar. koleksiyon_id benzersiz bir koleksiyon kimliği sağlar, koleksiyon_adi koleksiyonun adını belirtir, ve aciklama alanı koleksiyon hakkında bilgi verir. Koleksiyonlar, belirli bir tema ya da konudaki yayınların gruplandığı bölümleri temsil eder.

7-Kullanıcı (kullanici_id, kullanici_adi, sifre, ad, soyad, rol): Sistemi kullanan kullanıcıların bilgilerini içerir. kullanici_id her kullanıcıyı benzersiz olarak tanımlar. rol alanı, kullanıcının sistemdeki yetkilerini belirler. Kullanıcı tablosu, yöneticiler, yazarlar veya okuyucular gibi farklı rollerdeki kişileri içerir.

8-Yazar (yazar_id, ad, soyad, afiliasyon, email, universite_id, bolum_id): Bu tablo, yazarlara ait kişisel ve profesyonel bilgileri içerir. yazar_id, her yazarı benzersiz bir şekilde tanımlar. universite_id ve bolum_id yazarın bağlı olduğu üniversite ve bölümü belirtir. Bu bilgiler, yazarların kimliklerini ve akademik bağlantılarını tanımlamak için kullanılır.

9-Yayın (yayin_id, baslik, yayin_tarihi, yayin_yeri, DOI, ozet, anahtar_kelimeler, yayin_turu_id, yayinci_id, konferans_id, koleksiyon_id, dil): Yayın tablosu, yayınların temel bilgilerini içerir. yayin_id her yayını benzersiz olarak tanımlar. baslik, ozet, ve anahtar_kelimeler alanları yayın hakkında bilgi verir. yayin_turu_id, yayinci_id, konferans_id ve koleksiyon_id diğer tablolarla ilişkilerini belirtir.

10-Kategori (kategori_id, kategori_adi): Yayınların dahil olduğu kategorileri tanımlar. kategori_id her kategoriyi benzersiz olarak tanımlar ve kategori_adi kategorinin adını belirtir. Kategoriler, yayınları sınıflandırmak için kullanılır.

11-Alan (alan_id, alan_adi): Yazarların uzmanlık alanlarını tanımlar. alan_id benzersiz bir tanımlayıcıdır ve alan_adi alanın adını içerir. Alanlar, yazarların akademik veya profesyonel uzmanlıklarını belirlemek için kullanılır.

12-Unvan (unvan_id, unvan_adi): Yazarların akademik veya profesyonel unvanlarını tanımlar. unvan_id her unvanı benzersiz bir şekilde tanımlar ve unvan_adi unvanın adını belirtir. Unvanlar, yazarların statülerini belirtmek için kullanılır.

13-Ödül (odul_id, odul_adi): Yazarların kazandığı ödülleri içerir. odul_id ödül için benzersiz bir tanımlayıcıdır, odul_adi ödülün adını içerir. Bu tablo, yazarların akademik başarılarını gösterir.

14-Proje (proje_id, proje_adi, aciklama, baslangic_tarihi, bitis_tarihi): Araştırma projelerini tanımlar. proje_id her projeyi benzersiz olarak tanımlar. proje_adi, aciklama, baslangic_tarihi ve bitis_tarihi alanları projenin adı, açıklaması, başlangıç ve bitiş tarihlerini içerir. Projeler, yayınların ortaya çıkmasına katkıda bulunan çalışmalar olabilir.

15-Finans_Kaynağı (finans_kaynağı_id, kaynak_adi, kaynak_turu): Projeler için sağlanan finansman kaynaklarını tanımlar. finans_kaynağı_id benzersiz bir tanımlayıcıdır. kaynak_adi ve kaynak_turu finansman kaynağının adı ve türünü belirtir. Finans kaynakları, projelerin desteklenmesinde önemlidir.

16-Atıflar (atifa_id, kaynak_yayin_id, hedef_yayin_id, atif_sayfasi, atif_context): Bu tablo, bir yayına yapılan atıfları saklar. atifa_id, her atıf için benzersiz bir kimliktir. kaynak_yayin_id, atıfın yapıldığı yayının tanımlayıcısını belirtirken, hedef_yayin_id atıf yapılan yayının tanımlayıcısını gösterir. atif_sayfasi, atıfın yapıldığı sayfanın numarasını içerir ve pozitif bir tam sayı olmalıdır. atif_context, atıfla ilgili açıklayıcı bilgileri veya notları saklar. Bu tablo, yayınlar arasındaki ilişkileri göstermek ve atıf detaylarını yönetmek için kullanılır.

## Ara Tablolar ve İlişkiler
| Ana Tablo 1       | Ana Tablo 2     | İlişki Türü                  |
|-------------------|-----------------|------------------------------|
| Yayın\_Türü       | Yayın           | Yayın\_Türü (1), Yayın (N)   |
| Yayıncı           | Yayın           | Yayıncı (1), Yayın (N)       |
| Konferans         | Yayın           | Konferans (1), Yayın (N)     |
| Koleksiyon        | Yayın           | Koleksiyon (1), Yayın (N)    |
| Üniversite        | Bölüm           | Üniversite (1), Bölüm (N)    |
| Üniversite        | Yazar           | Üniversite (1), Yazar (N)    |
| Bölüm             | Yazar           | Bölüm (1), Yazar (N)         |

| Ana Tablo 1 | Ara Tablo             | Ana Tablo 2       | Ara Tablo ile İlişki Türü        |
|-------------|------------------------|-------------------|----------------------------------|
| Yayın       | Yayın\_Yazar          | Yazar            | Yayın (1-N), Yazar (1-N)         |
| Yayın       | Yayın\_Kategori       | Kategori         | Yayın (1-N), Kategori (1-N)      |
| Yazar       | Yazar\_Alan           | Alan             | Yazar (1-N), Alan (1-N)          |
| Yazar       | Yazar\_Unvan          | Unvan            | Yazar (1-N), Unvan (1-N)         |
| Yazar       | Yazar\_Ödül           | Ödül             | Yazar (1-N), Ödül (1-N)          |
| Yazar       | Yazar\_Yayıncı        | Yayıncı          | Yazar (1-N), Yayıncı (1-N)       |
| Proje       | Proje\_Yayın          | Yayın            | Proje (1-N), Yayın (1-N)         |
| Proje       | Proje\_FinansKaynağı  | Finans\_Kaynağı  | Proje (1-N), Finans\_Kaynağı (1-N)|
| Kullanıcı   | Kullanıcı\_Proje      | Proje            | Kullanıcı (1-N), Proje (1-N)     |



## Kurulum

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır. 

