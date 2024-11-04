# Akademik Yayın Yönetim Sistemi

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi amaçlamaktadır. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri ve aralarındaki ilişkileri yönetir. Ayrıca kullanıcı rolleri, erişim hakları, projeler ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Bu sistem, yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimi gibi işlevsellikler sunar.

## Veri Tabanı Şeması
![Veri Tabanı Şeması](https://github.com/user-attachments/assets/e2240128-de86-4efd-8279-509c4dcf693f)




## Tablolar ve Açıklamaları

### Temel Tablolar

1. **Yayın_Türü**: Akademik çalışmaların türlerini tanımlar. Örneğin makale, kitap, rapor veya konferans bildirisi.
   - **yayin_turu_id**: Yayın türünün benzersiz kimliği.
   - **tur_adi**: Yayın türü adı.

2. **Yayıncı**: Yayınların yayımlandığı yayınevi veya kurum bilgilerini içerir.
   - **yayinci_id**: Yayıncıyı benzersiz olarak tanımlar.
   - **yayinci_adi, adres, telefon, enlem, boylam**: Yayıncı adı, iletişim ve konum bilgileri.

3. **Konferans**: Düzenlenen konferansların bilgilerini saklar.
   - **konferans_id**: Konferansı benzersiz olarak tanımlar.
   - **konferans_adi, duzenleyen_kurum, duzenlenme_tarihi, duzenlenme_yeri**: Konferans detayları.

4. **Üniversite**: Üniversitelerin bilgilerini içerir.
   - **universite_id**: Üniversiteyi benzersiz olarak tanımlar.
   - **universite_adi, adres, ulke, enlem, boylam**: Üniversite adı ve konumu.

5. **Bölüm**: Üniversiteye bağlı bölümleri tanımlar.
   - **bolum_id**: Bölümü benzersiz olarak tanımlar.
   - **bolum_adi, universite_id**: Bölüm adı ve üniversite kimliği.

6. **Koleksiyon**: Yayınların dahil olabileceği koleksiyonları tanımlar.
   - **koleksiyon_id**: Koleksiyon kimliği.
   - **koleksiyon_adi, aciklama**: Koleksiyon adı ve açıklaması.

7. **Kullanıcı**: Sistem kullanıcılarının bilgilerini içerir.
   - **kullanici_id**: Kullanıcı kimliği.
   - **kullanici_adi, sifre, ad, soyad, rol**: Kullanıcı adı, rol ve kimlik bilgileri.

8. **Yazar**: Yazarların kişisel ve profesyonel bilgilerini içerir.
   - **yazar_id**: Yazar kimliği.
   - **ad, soyad, afiliasyon, email, universite_id, bolum_id**: Yazar detayları ve akademik bağlantılar.

9. **Yayın**: Yayınların temel bilgilerini içerir.
   - **yayin_id**: Yayını benzersiz olarak tanımlar.
   - **baslik, yayin_tarihi, yayin_yeri, DOI, ozet, anahtar_kelimeler**: Yayın başlığı, DOI ve diğer detaylar.

10. **Kategori**: Yayınların dahil olduğu kategorileri içerir.
   - **kategori_id**: Kategori kimliği.
   - **kategori_adi**: Kategori adı.

11. **Alan**: Yazarların uzmanlık alanlarını tanımlar.
   - **alan_id**: Alan kimliği.
   - **alan_adi**: Alan adı.

12. **Unvan**: Yazarların akademik veya profesyonel unvanlarını tanımlar.
   - **unvan_id**: Unvan kimliği.
   - **unvan_adi**: Unvan adı.

13. **Ödül**: Yazarların kazandığı ödülleri içerir.
   - **odul_id**: Ödül kimliği.
   - **odul_adi**: Ödül adı.

14. **Proje**: Araştırma projelerini tanımlar.
   - **proje_id**: Proje kimliği.
   - **proje_adi, aciklama, baslangic_tarihi, bitis_tarihi**: Proje detayları.

15. **Finans_Kaynağı**: Projeler için sağlanan finans kaynaklarını tanımlar.
   - **finans_kaynağı_id**: Finans kaynağı kimliği.
   - **kaynak_adi, kaynak_turu**: Kaynağın adı ve türü.

16. **Atıflar**: Bir yayına yapılan atıfları saklar.
   - **atifa_id**: Atıf kimliği.
   - **kaynak_yayin_id, hedef_yayin_id, atif_sayfasi, atif_context**: Atıf yapılan yayının detayları.

### Ara Tablolar ve İlişkiler

1. **Yayin_Yazar**: Yayın ve yazarlar arasındaki n-n ilişkiyi düzenler.
2. **Yayin_Kategori**: Yayın ve kategoriler arasındaki n-n ilişkiyi tanımlar.
3. **Yazar_Alan**: Yazarlar ile uzmanlık alanları arasındaki n-n ilişkiyi temsil eder.
4. **Yazar_Unvan**: Yazarlar ile unvanlar arasındaki n-n ilişkiyi düzenler.
5. **Yazar_Odul**: Yazarlar ile ödüller arasındaki n-n ilişkiyi temsil eder.
6. **Yazar_Yayıncı**: Yazarlar ile yayıncılar arasındaki n-n ilişkiyi tanımlar.
7. **Proje_Yayin**: Projeler ve yayınlar arasındaki n-n ilişkiyi yönetir.
8. **Proje_FinansKaynağı**: Projeler ve finans kaynakları arasındaki n-n ilişkiyi tanımlar.
9. **Kullanici_Proje**: Kullanıcılar ile projeler arasındaki n-n ilişkiyi düzenler.

### Temel Tablolar Arasındaki 1-n İlişkiler

- **Yayın_Türü ve Yayın**: Bir yayın yalnızca bir türe ait olabilir, ancak bir tür birden fazla yayını içerebilir.
- **Yayıncı ve Yayın**: Her yayının yalnızca bir yayıncısı olabilir, ancak bir yayıncı birden fazla yayını yayımlayabilir.
- **Konferans ve Yayın**: Bir yayının yalnızca bir konferansa ait olması, ancak bir konferansın birden fazla yayını içerebilmesi.
- **Üniversite ve Bölüm**: Her bölüm yalnızca bir üniversiteye bağlıdır, ancak bir üniversite birden fazla bölüm içerebilir.
- **Bölüm ve Yazar**: Her yazar yalnızca bir bölümde görev alabilir, ancak bir bölümde birden fazla yazar görev yapabilir.

## Kurulum ve Kullanım

Projeyi çalıştırmak için aşağıdaki adımları takip edin:

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır. 

