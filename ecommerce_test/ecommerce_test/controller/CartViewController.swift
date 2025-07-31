import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var cartItems: [String] = ["상품 A", "상품 B", "상품 C"] // 임시 데이터

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "장바구니"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
    }

    // table 내 상품 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }

    // table view 구성
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        cell.textLabel?.text = cartItems[indexPath.row]
        return cell
    }

    // 스와이프로 삭제
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cartItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @IBAction func deleteSelectedItem(_ sender: UIButton) {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            cartItems.remove(at: selectedIndexPath.row)
            tableView.deleteRows(at: [selectedIndexPath], with: .fade)
        } else {
            let alert = UIAlertController(title: "삭제할 항목 없음", message: "삭제할 상품을 먼저 선택해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
        }
    }

    // 주문 시작
    @IBAction func proceedToOrder(_ sender: UIButton) {
        let orderVC = storyboard?.instantiateViewController(withIdentifier: "OrderFormVC") as! OrderFormViewController
    }
}
