# Akademik Yayın Yönetim Sistemi

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi amaçlamaktadır. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri ve aralarındaki ilişkileri yönetir. Ayrıca kullanıcı rolleri, erişim hakları, projeler ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Bu sistem, yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimi gibi işlevsellikler sunar.

## Veri Tabanı Şeması
![Veri Tabanı Şeması](https://github.com/user-attachments/assets/e2240128-de86-4efd-8279-509c4dcf693f)

## Veritabanı Tablo İlişkileri

| İlişki No | İlişki                  | Açıklama                                                                                                                                                                                                 |
|-----------|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 10        | Yayın_Türü ve Yayın     | Yayın türleri ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir türe ait olabileceğini, ancak bir türün birden fazla yayını içerebileceğini ifade eder. Yayınlar makale, bildiri, dergi yazısı gibi türlere göre gruplandırılabilir. (1-n) |
| 11        | Yayıncı ve Yayın        | Yayıncılar ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir yayıncıya ait olabileceğini, ancak bir yayıncının birden fazla yayını yayımlayabileceğini gösterir. Yayınevi bazında içerik yönetimini kolaylaştırır. (1-n) |
| 12        | Konferans ve Yayın      | Konferanslar ile yayınlar arasındaki 1-n ilişki, bir yayının yalnızca bir konferansa ait olabileceğini, ancak bir konferansın birden fazla yayını kapsayabileceğini ifade eder. Konferans bazında içerik yönetimi sağlar. (1-n) |
| 13        | Üniversite ve Bölüm     | Üniversiteler ile bölümler arasındaki 1-n ilişki, her bölümün yalnızca bir üniversiteye bağlı olduğunu, ancak bir üniversitenin birden fazla bölümü içerebileceğini ifade eder. Üniversitelerin bölüm dağılımını gösterir. (1-n) |
| 14        | Bölüm ve Yazar          | Bölümler ile yazarlar arasındaki 1-n ilişki, her yazarın yalnızca bir bölümde çalışabileceğini, ancak bir bölümde birden fazla yazarın görev alabileceğini belirtir. Bölüm bazında yazarların yönetimini sağlar. (1-n) |
| 15        | Koleksiyon ve Yayın     | Koleksiyonlar ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir koleksiyona ait olabileceğini, ancak bir koleksiyonun birden fazla yayını içerebileceğini ifade eder. Koleksiyonlar bazında yayın yönetimini kolaylaştırır. (1-n) |



## Kurulum

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır. 

