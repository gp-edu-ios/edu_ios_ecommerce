import UIKit

class RefundViewController: UIViewController {

    @IBOutlet weak var reasonTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "환불 요청"
        reasonTextView.layer.borderColor = UIColor.systemGray4.cgColor
        reasonTextView.layer.borderWidth = 1.0
        reasonTextView.layer.cornerRadius = 8
    }

    @IBAction func submitRefund(_ sender: UIButton) {
        guard let reason = reasonTextView.text, !reason.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            let alert = UIAlertController(title: "입력 오류", message: "환불 사유를 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
            return
        }

        let alert = UIAlertController(title: "환불 요청 완료", message: "환불 요청이 접수되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
