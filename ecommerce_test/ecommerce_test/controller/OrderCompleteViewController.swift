import UIKit

class OrderCompleteViewController: UIViewController {

    @IBOutlet weak var confirmationLabel: UILabel!
    @IBOutlet weak var successImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "구매 완료"
        confirmationLabel.text = "결제가 완료되었습니다!\n이용해주셔서 감사합니다."

        successImageView.image = UIImage(named: "success_icon")
        successImageView.contentMode = .scaleAspectFit
    }

    @IBAction func requestRefund(_ sender: UIButton) {
        let refundVC = storyboard?.instantiateViewController(withIdentifier: "RefundVC") as! RefundViewController
    }
}
