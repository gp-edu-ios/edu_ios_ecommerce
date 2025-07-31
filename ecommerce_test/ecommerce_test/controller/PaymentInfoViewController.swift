import UIKit

class PaymentInfoViewController: UIViewController {

    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expiryDateTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "결제 정보 입력"
    }

    @IBAction func completePayment(_ sender: UIButton) {
        guard let cardNumber = cardNumberTextField.text, !cardNumber.isEmpty,
              let expiry = expiryDateTextField.text, !expiry.isEmpty else {
            let alert = UIAlertController(title: "입력 오류", message: "모든 정보를 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
            return
        }

        // 여기서 결제 처리를 하고...
        // 다음 화면(구매 완료)으로 이동
        let completeVC = storyboard?.instantiateViewController(withIdentifier: "OrderCompleteVC") as! OrderCompleteViewController
    }
}
