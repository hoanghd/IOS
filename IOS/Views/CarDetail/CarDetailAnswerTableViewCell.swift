import UIKit

class CarDetailAnswerTableViewCell: CarDetailQATableViewCell {
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
        stackView.layer.borderColor = UIColor(red: 196, green: 196, blue: 196).cgColor
        
        icon.layer.insertSublayer(shape, at: 0)
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews( stackView, rightIcon )
        
        NSLayoutConstraint.visual(
            [
                "H:|-20-[stackView][rightIcon(==20)]|": [],
                "V:|[stackView]|": [],
                "V:[rightIcon]-16-|": [],
            ],
            [
                "stackView": stackView,
                "rightIcon": rightIcon
            ],
            nil
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
