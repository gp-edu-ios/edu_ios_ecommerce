import UIKit

class ProductListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let products = ["상품 A", "상품 B", "상품 C"] // 임시 상품 목록
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.title = "상품 목록 조회"
    }
    
    // 섹션별 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    // 셀에 데이터 넣기
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        cell.textLabel?.text = products[indexPath.row]
        return cell
    }
    
    // 셀 클릭 시 Segue로 이동
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toProductDetail", sender: indexPath)
    }

    // Segue를 통해 상품 이름 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetail",
           let indexPath = sender as? IndexPath {
            let selectedProduct = products[indexPath.row]
            let destinationVC = segue.destination as! ProductDetailViewController
            destinationVC.productName = selectedProduct
        }
    }
}
