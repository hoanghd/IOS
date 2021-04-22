import UIKit
import Nantes

class CarDetailChatView: UIView{
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var messageLabel: NantesLabel = {
        let label = NantesLabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14)
        
        label.attributedTruncationToken = NSAttributedString(string: "... more")
        label.numberOfLines = 3
        label.labelTappedBlock = {
            label.numberOfLines = label.numberOfLines == 0 ? 3 : 0
        }
        
        return label
    }()
     
    /*  ---------------------
        |        (20,0)
        |           |
        |(0,16)  (20,16)
     */
    lazy var leftIcon: UIView = {
        var icon = UIView()
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 20, y: 0))
        path.addLine(to: CGPoint(x:0, y: 16))
        path.addLine(to: CGPoint(x:20, y:16))
        path.addLine(to: CGPoint(x:20, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor(red: 196, green: 196, blue: 196).cgColor

        icon.layer.insertSublayer(shape, at: 0)
        return icon
    }()
    
    /*  ---------------------
        |(0,0)
        |  |
        |(0,16)    (20,16)
     */
    lazy var rightIcon: UIView = {
        var icon = UIView()
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x:0, y: 16))
        path.addLine(to: CGPoint(x:20, y:16))
        path.addLine(to: CGPoint(x:0, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor(red: 196, green: 196, blue: 196).cgColor

        icon.layer.insertSublayer(shape, at: 0)
        return icon
    }()
    
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel, userLabel, messageLabel])
        view.axis = .vertical
        
        view.spacing = 10
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18)
        
        view.layer.borderWidth = 8
        view.layer.borderColor = UIColor(red: 196, green: 196, blue: 196).cgColor
        
        return view
    }()

    func layout() {
        addSubviews( leftIcon, stackView, rightIcon )
        
        NSLayoutConstraint.visual(
            [
                "H:|[leftIcon(==20)][stackView][rightIcon(==20)]|": [],
                "V:|[stackView]|": [],
                
                "V:[leftIcon]-16-|": [],
                "V:[rightIcon]-16-|": [],
            ],
            [
                "stackView": stackView,
                "rightIcon": rightIcon,
                "leftIcon": leftIcon
            ],
            nil
        )
        
        dateLabel.text = "2021.02.01"
        userLabel.text = "交響曲太郎様"
        messageLabel.text = "「この車、気になっているけれど、ちょっと予算と合わない…」\n「欲しいタイプの車が見つからなかった…」\nそんなときは、入庫お知らせメールに登録を！\n登録した条件のお車が「車選びドットコム」に入庫した際に、いち早くメールでお知らせします。"
        
        DispatchQueue.main.async {
            
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
