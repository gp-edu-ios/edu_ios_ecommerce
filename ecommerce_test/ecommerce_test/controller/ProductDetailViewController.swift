import UIKit

class ProductDetailViewController: UIViewController {
    
    var productName: String?
    
    @IBOutlet weak var productLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productLabel.text = productName
    }
    
    @IBAction func addToWishlist(_ sender: UIButton) {
        print("\(productName ?? "") 찜 완료")
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        print("\(productName ?? "") 장바구니 추가 완료")
    }
    
    @IBAction func goToCart(_ sender: UIButton) {
//        performSegue(withIdentifier: "toCart", sender: nil)
    }
}
