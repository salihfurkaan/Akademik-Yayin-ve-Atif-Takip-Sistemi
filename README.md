# Akademik Yayın Yönetim Sistemi

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi amaçlamaktadır. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri ve aralarındaki ilişkileri yönetir. Ayrıca kullanıcı rolleri, erişim hakları, projeler ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Bu sistem, yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimi gibi işlevsellikler sunar.

## Veri Tabanı Şeması
![Veri Tabanı Şeması](https://github.com/user-attachments/assets/e2240128-de86-4efd-8279-509c4dcf693f)



## Temel Tablolar Arasındaki 1-n İlişkiler

1. **Yayın_Türü ve Yayın**: Yayın türleri ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir türe ait olabileceğini, ancak bir türün birden fazla yayını içerebileceğini ifade eder. Bu ilişki, yayınların türlere göre sınıflandırılmasını sağlar; örneğin, makale, bildiri, dergi yazısı gibi türler belirlenebilir ve yayınlar buna göre gruplanabilir. (1-n)

2. **Yayıncı ve Yayın**: Yayıncılar ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir yayıncıya ait olabileceğini, ancak bir yayıncının birden fazla yayını yayımlayabileceğini gösterir. Bu, yayınların hangi yayıncı tarafından yayımlandığını izlemek için önemlidir ve yayınevi bazında içerik yönetimini kolaylaştırır. (1-n)

3. **Konferans ve Yayın**: Konferanslar ile yayınlar arasındaki 1-n ilişki, bir yayının yalnızca bir konferansa ait olabileceğini, ancak bir konferansın birden fazla yayını kapsayabileceğini ifade eder. Bu ilişki, yayınların hangi konferansta sunulduğunu takip etmek ve konferans bazında içerik yönetimi sağlamak için önemlidir. (1-n)

4. **Üniversite ve Bölüm**: Üniversiteler ile bölümler arasındaki 1-n ilişki, her bölümün yalnızca bir üniversiteye bağlı olduğunu, ancak bir üniversitenin birden fazla bölümü içerebileceğini ifade eder. Bu ilişki, akademik yapı içinde bölümlerin hangi üniversiteye bağlı olduğunu ve üniversitelerin bölüm dağılımını gösterir. (1-n)

5. **Bölüm ve Yazar**: Bölümler ile yazarlar arasındaki 1-n ilişki, her yazarın yalnızca bir bölümde çalışabileceğini, ancak bir bölümde birden fazla yazarın görev alabileceğini belirtir. Bu ilişki, yazarların akademik bölümlerini tanımlamak ve bölüm bazında yazarların yönetimini sağlamak için kullanılır. (1-n)

6. **Koleksiyon ve Yayın**: Koleksiyonlar ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir koleksiyona ait olabileceğini, ancak bir koleksiyonun birden fazla yayını içerebileceğini ifade eder. Bu ilişki, yayınların belirli tematik veya kurumsal koleksiyonlara atanmasını sağlar ve koleksiyonlar bazında yayın yönetimini kolaylaştırır. (1-n)

## Kurulum ve Kullanım

Projeyi çalıştırmak için aşağıdaki adımları takip edin:

1. Veritabanını oluşturun ve tabloları yukarıdaki yapıya göre kurun.
2. Bağlantı bilgilerinizi yapılandırarak veritabanına erişim sağlayın.
3. Proje dosyalarını gerekli veritabanı bağlantısı ve uygulama ayarlarına göre yapılandırarak uygulamayı başlatın.

## Lisans
Bu proje MIT lisansı ile lisanslanmıştır. 

