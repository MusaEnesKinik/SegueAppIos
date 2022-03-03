

import UIKit

class ViewController: UIViewController {
    
    var userName = ""

    @IBOutlet weak var myLabel: UILabel! // 1. ViewController yazan yer
    @IBOutlet weak var nameText: UITextField! // İlk sayfada isim girilen yer
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //Lifecycle (yaşam döngüsü)
        print("viewDidLoad function called")
        nameText.text = "" // İlk sayfadaki isim yazılan yer ikinci sayfaya gidip ana ekrana döndüğümde boş görünsün istiyorum, bu işe yaramayacak çünkü viewDidLoad sadece uygulama ilk çalıştığında gelir, yani ikinci sayfadan ana sayfaya dönerken viewDidLoad çalışmadı
        
    }
    
//    uygulama ilk çalıştırılırken viewDidLoad geliyor, sonra viewWillAppear (kullanıcı görünümü görecek), sonra viewDidAppear (kullanıcı görünümü gördü)
//    ikinci sayfaya geçince viewWilldisappear (viewController her an gidebilir yani yeni sayfaya geçebilir), sonra viewDidDisappear (artık görünüm gitti yani viewController gitti, yeni sayfaya geçti)
//    secondViewControllar dan viewControllar a dönerke de; viewWillAppear (görünüm belirecek 'viewController görünecek') , sonra viewDidAppear (viewController göründü)
//    Aşağıda ki 4 fonksiyon bağzı durumlarda viewDidLoad() yerine kullanılabilir
//    ViewController lar arasında önceki sayfaya döneceğimiz zaman viewDidLoad tekrar çağırılmıyor, sadece ilk başta çalışıyor
//    yani uygulamanın ana ekranı açılınca olmasını istediğim bir şey olsun istiyorsam, viewDidLoad altına yazılan kod, uygulama açıldıktan sonra sayfalar arasında geçiş yapıp ana ekrana dönersem viewDidLoad altındaki kod çalışmayacaktır
    
    override func viewDidDisappear(_ animated: Bool) { // kayboldu anlamına gelir
        print("viewDidDisappear function called")
    }
    
    override func viewWillDisappear(_ animated: Bool) { // kaybolacak
        print("viewWillDisappear function called")
    }
    
    override func viewWillAppear(_ animated: Bool) { // bu görünüm belirecek, gözükecek
        print("viewWillAppear function called")
        nameText.text = "" // İlk sayfadaki isim yazılan yer ikinci sayfaya gidip ana ekrana döndüğümde boş görünsün istiyorum, viewWillAppear çalışacağı için ana ekrana döndüğümde isim yazacağım alan boş görünecek
    }
    
    override func viewDidAppear(_ animated: Bool) { // görünüm gözüktü anlamına gelir
        print("viewDidAppear function called")
    }

    @IBAction func nextClicked(_ sender: Any) { // ilk sayfada girilen ismi kaydedip ikinci sayfaya geçen buton
        
        userName = nameText.text! // segue olmadan hemen önce ilk sayfada girilen ismi değişkene atadık 
        performSegue(withIdentifier: "toSecondVC", sender: nil) // id ye 1. VC ı 2. VC a bağladığımız Show Sgue nın Identifier ını yazıyoruz
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Hazır bir func, Segue yapılmadan hemen önce yapılacak işlemleri buraya yazıyoruz
        if segue.identifier == "toSecondVC" { // eğer segue nin id si "toSecondVC" ise aşağıdaki işlemleri yap
//            as ----- casting yapyık
            let destinacionVC = segue.destination as! SecondViewController // segue.destination (gidilen hedef yer), as! ile cast ederek nereye gidileceğini belirttik, ve SecondViewController ı bir değişken gibi tanımladığımız destinacionVC ye eşitledik
            destinacionVC.myName = userName // artık destinacionVC ile SecondViewController içindeki tanımlara ulaşabilitoruz , SecondViewController da ki myName e userName i eşitledik
        }
    }
    
}

