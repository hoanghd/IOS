import UIKit

class CarDetailAnswerTableViewCell: CarDetailQATableViewCell {
    /*  ---------------------
        |        (20,0)
        |           |
        |(0,14)  (20,14)
     */
    lazy var leftIcon: UIView = {
        var icon = UIView()
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: 20, y: 0))
        path.addLine(to: CGPoint(x:0, y: 14))
        path.addLine(to: CGPoint(x:20, y:14))
        path.addLine(to: CGPoint(x:20, y:0))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = UIColor(red: 226, green: 237, blue: 243).cgColor
        bodyView.layer.borderColor = UIColor(red: 226, green: 237, blue: 243).cgColor
        
        icon.layer.insertSublayer(shape, at: 0)
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews( leftIcon, bodyView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[leftIcon(==20)][bodyView]-20-|": [],
                "V:|-[bodyView]|": [],
                "V:[leftIcon]-14-|": [],
                "H:|-[dateLabel]-|": [],
                "H:|-[userLabel]-|": [],
                "H:|-[messageLabel]-|": [],
                "V:|-[dateLabel]-[userLabel]-[messageLabel]-|": []
            ],
            [
                "bodyView": bodyView,
                "leftIcon": leftIcon,
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
