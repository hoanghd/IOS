import UIKit
import Alamofire

class CarDetailBaseView: UIView{
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"NoImage"))
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    let openButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "Open"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    func layout() {
        addSubviews( imageView, titleLablel, openButton )
        
        NSLayoutConstraint.activate([
            openButton.widthAnchor.constraint(equalTo: openButton.heightAnchor)
        ])
        
        NSLayoutConstraint.visual(
            [
                "H:|-[imageView(==80)]-[titleLablel]-[openButton(==23)]-|": [ .alignAllCenterY ],
                "V:|-[imageView(==60)]-|": []
            ],
            [
                "imageView": imageView,
                "openButton": openButton,
                "titleLablel": titleLablel
            ],
            nil
        )
        
        titleLablel.text = "レクサス LS460 バージョンS Iパッケージ"
        AF.request("https://img0.kurumaerabi.com/image/202101/058/a52874a6.160.jpg", method: .get).responseImage { response in
            if case .success(let image) = response.result {
                self.imageView.image = image
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layout()
    }
}
