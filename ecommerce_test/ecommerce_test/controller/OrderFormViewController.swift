import UIKit

class OrderFormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!

    var cartItems: [String] = []

    // 상품별 가격 정보
    let prices: [String: Int] = [
        "상품 A": 5000,
        "상품 B": 3000,
        "상품 C": 7000
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "주문서 작성"
        tableView.delegate = self
        tableView.dataSource = self
        updateTotalPrice()
    }

    // 테이블뷰 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }

    // 셀 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItemCell", for: indexPath)
        cell.textLabel?.text = cartItems[indexPath.row]
        return cell
    }

    // 총 금액 계산
    func updateTotalPrice() {
        let total = cartItems.reduce(0) { sum, item in
            return sum + (prices[item] ?? 0)
        }
        totalPriceLabel.text = "총 주문 금액: \(total)원"
    }

    @IBAction func goToShippingInfo(_ sender: UIButton) {
        let shippingVC = storyboard?.instantiateViewController(withIdentifier: "AddShippingInfoVC") as! AddShippingInfoViewController
    }
}

