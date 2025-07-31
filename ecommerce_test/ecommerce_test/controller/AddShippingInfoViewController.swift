import UIKit

class AddShippingInfoViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "배송 정보 입력"
    }

    @IBAction func goToPaymentInfo(_ sender: UIButton) {
        // 간단한 유효성 검사
        guard let name = nameTextField.text, !name.isEmpty,
              let address = addressTextField.text, !address.isEmpty,
              let phone = phoneTextField.text, !phone.isEmpty else {
            let alert = UIAlertController(title: "입력 오류", message: "모든 항목을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
            return
        }

        // 다음 화면으로 이동
        let paymentVC = storyboard?.instantiateViewController(withIdentifier: "PaymentInfoVC") as! PaymentInfoViewController

    }
}
