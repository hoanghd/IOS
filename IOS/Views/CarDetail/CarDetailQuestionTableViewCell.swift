import UIKit

class CarDetailQuestionTableViewCell: CarDetailQATableViewCell {
    /*  ---------------------
        |(0,0)
        |  |
        |(0,14)    (20,14)
     */
    lazy var rightIcon: UIView = {
        var icon = UIView()
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x:0, y: 14))
        path.addLine(to: CGPoint(x:20, y:14))
        path.addLine(to: CGPoint(x:0, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor(red: 196, green: 196, blue: 196).cgColor
        bodyView.layer.borderColor = UIColor(red: 196, green: 196, blue: 196).cgColor
        
        icon.layer.insertSublayer(shape, at: 0)
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews( bodyView, rightIcon )
        
        NSLayoutConstraint.visual(
            [
                "H:|-20-[bodyView][rightIcon(==20)]|": [],
                "V:|-[bodyView]|": [],
                "V:[rightIcon]-14-|": [],
                "H:|-[dateLabel]-|": [],
                "H:|-[userLabel]-|": [],
                "H:|-[messageLabel]-|": [],
                "V:|-[dateLabel]-[userLabel]-[messageLabel]-|": []
            ],
            [
                "bodyView": bodyView,
                "rightIcon": rightIcon,
                "dateLabel": dateLabel,
                "userLabel": userLabel,
                "messageLabel": messageLabel
            ],
            nil
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
