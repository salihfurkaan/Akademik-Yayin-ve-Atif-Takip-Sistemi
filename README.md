# Academic-Publication-and-Citation-Tracking-System-Database

Bu proje, akademik yayınların yönetimi, organizasyonu ve ilgili ilişkilerin tutulmasını sağlayan bir sistem geliştirmeyi hedefler. Sistem; akademik yayınlar, yazarlar, yayınevleri, üniversiteler, konferanslar, koleksiyonlar ve ödüller gibi bileşenleri içermekte olup, bunlar arasındaki ilişkileri yönetir. Kullanıcı rolleri, erişim hakları ve çeşitli proje ve finans kaynakları gibi yönetimsel özellikler de bulunmaktadır. Sistem; özellikle yayımlanan akademik eserlerin takibi, atıflar ve akademik ödüllerin yönetimini mümkün kılacak şekilde yapılandırılmıştır.

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

Ara Tablolar ve İlişkiler

1-Yayin_Yazar (yayin_id, yazar_id): Yayınlar ile yazarlar arasındaki n-n ilişkiyi yönetir. Bu ara tablo, her yayının birden fazla yazar tarafından yazılabilmesi ve bir yazarın da birden fazla yayına katkıda bulunabilmesi durumunu düzenler. Akademik işbirlikleri ve yayınların yazar katkılarını tanımlamak için kullanılan bu tablo, çok yazarlı yayınları ve bir yazarın farklı projelerdeki katkılarını takip etmeyi sağlar. (n-n)

2-Yayin_Kategori (yayin_id, kategori_id): Yayınlar ile kategoriler arasındaki n-n ilişkiyi tanımlar. Bu ara tablo, her yayının birden fazla kategoriye atanabileceği ve her kategorinin birden fazla yayını kapsayabileceği durumu ifade eder. Yayınların konu başlıklarına veya disiplinlere göre sınıflandırılması için kullanılır ve kullanıcıların belirli bir konudaki yayınları bulmalarını kolaylaştırır. (n-n)

3-Yazar_Alan (yazar_id, alan_id): Yazarlar ile akademik veya araştırma alanları arasındaki n-n ilişkiyi temsil eder. Bir yazarın birden fazla alanda çalışabilmesi ve her alanın birden fazla yazarla ilişkilendirilebilmesi durumu bu tablo üzerinden takip edilir. Bu yapı, yazarların uzmanlık alanlarını belgelemek ve farklı alanlarda işbirliklerini analiz etmek için kullanılır. (n-n)

4-Yazar_Unvan (yazar_id, unvan_id): Yazarlar ile unvanlar arasındaki n-n ilişkiyi yönetir. Her yazar birden fazla akademik veya mesleki unvana sahip olabilirken, her unvan da birden fazla yazara atanabilir. Bu ilişki, akademik ve profesyonel kariyerin ilerleyişini belgelemek ve yazarların sahip olduğu unvanları tanımlamak amacıyla kullanılır. (n-n)

5-Yazar_Odul (yazar_id, odul_id): Yazarlar ile ödüller arasındaki n-n ilişkiyi temsil eder. Her yazar birden fazla ödül alabilirken, her ödül de birden fazla yazara verilebilir. Bu tablo, yazarların akademik başarılarını ve ödüllerini izlemek, ödüllerin yazarlar arasındaki dağılımını analiz etmek için önemlidir. (n-n)

6-Yazar_Yayıncı (yazar_id, yayinci_id): Yazarlar ile yayıncılar arasındaki n-n ilişkiyi tanımlar. Bir yazar birden fazla yayıncı ile çalışabilir ve bir yayıncı birden fazla yazara yayın sağlayabilir. Bu ilişki, yazarların farklı yayınevleri ile ilişkilerini ve yayınevlerinin yazar portföyünü izlemeye yardımcı olur. (n-n)

7-Proje_Yayin (proje_id, yayin_id): Projeler ile yayınlar arasındaki n-n ilişkiyi yönetir. Bir proje birçok yayını kapsayabilir ve bir yayın birçok projede kullanılabilir. Bu ilişki, projelerle ilgili yayınların izlenmesi, projelerin bilimsel çıktılarını değerlendirme açısından önemlidir. (n-n)

8-Proje_FinansKaynağı (proje_id, finans_kaynağı_id): Projeler ile finans kaynakları arasındaki n-n ilişkiyi tanımlar. Bu tablo, her projenin birden fazla finansman kaynağı tarafından desteklenmesini ve her finans kaynağının da birden fazla projeye fon sağlamasını sağlar. Bu ilişki, projelerin finansal durumunu analiz etmek ve kaynak dağılımını yönetmek için kullanılır. (n-n)

9-Kullanici_Proje (kullanici_id, proje_id): Kullanıcılar ile projeler arasındaki n-n ilişkiyi yönetir. Bir kullanıcı birden fazla projede görev alabilirken, bir proje de birden fazla kullanıcı tarafından yürütülebilir. Bu tablo, proje katılımcılarını izlemek, projelerdeki sorumlulukları ve katılımcı ağlarını yönetmek için kullanılır. (n-n)

10-Temel Tablolar Arasındaki 1-n İlişkiler
Yayın_Türü ve Yayın: Yayın türleri ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir türe ait olabileceğini, ancak bir türün birden fazla yayını içerebileceğini ifade eder. Bu ilişki, yayınların türlere göre sınıflandırılmasını sağlar; örneğin, makale, bildiri, dergi yazısı gibi türler belirlenebilir ve yayınlar buna göre gruplanabilir. (1-n)

11-Yayıncı ve Yayın: Yayıncılar ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir yayıncıya ait olabileceğini, ancak bir yayıncının birden fazla yayını yayımlayabileceğini gösterir. Bu, yayınların hangi yayıncı tarafından yayımlandığını izlemek için önemlidir ve yayınevi bazında içerik yönetimini kolaylaştırır. (1-n)

12-Konferans ve Yayın: Konferanslar ile yayınlar arasındaki 1-n ilişki, bir yayının yalnızca bir konferansa ait olabileceğini, ancak bir konferansın birden fazla yayını kapsayabileceğini ifade eder. Bu ilişki, yayınların hangi konferansta sunulduğunu takip etmek ve konferans bazında içerik yönetimi sağlamak için önemlidir. (1-n)

13-Üniversite ve Bölüm: Üniversiteler ile bölümler arasındaki 1-n ilişki, her bölümün yalnızca bir üniversiteye bağlı olduğunu, ancak bir üniversitenin birden fazla bölümü içerebileceğini ifade eder. Bu ilişki, akademik yapı içinde bölümlerin hangi üniversiteye bağlı olduğunu ve üniversitelerin bölüm dağılımını gösterir. (1-n)

14-Bölüm ve Yazar: Bölümler ile yazarlar arasındaki 1-n ilişki, her yazarın yalnızca bir bölümde çalışabileceğini, ancak bir bölümde birden fazla yazarın görev alabileceğini belirtir. Bu ilişki, yazarların akademik bölümlerini tanımlamak ve bölüm bazında yazarların yönetimini sağlamak için kullanılır. (1-n)

15-Koleksiyon ve Yayın: Koleksiyonlar ile yayınlar arasındaki 1-n ilişki, her yayının yalnızca bir koleksiyona ait olabileceğini, ancak bir koleksiyonun birden fazla yayını içerebileceğini ifade eder. Bu ilişki, yayınların belirli tematik veya kurumsal koleksiyonlara atanmasını sağlar ve koleksiyonlar bazında yayın yönetimini kolaylaştırır. (1-n)
