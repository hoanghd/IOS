import UIKit

class CarDetailQuestionTableViewCell: CarDetailQATableViewCell {
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
        shape.fillColor = UIColor(red: 226, green: 237, blue: 243).cgColor
        stackView.layer.borderColor = UIColor(red: 226, green: 237, blue: 243).cgColor
        
        icon.layer.insertSublayer(shape, at: 0)
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews( leftIcon, stackView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[leftIcon(==20)][stackView]-20-|": [],
                "V:|[stackView]|": [],
                "V:[leftIcon]-16-|": []
            ],
            [
                "stackView": stackView,
                "leftIcon": leftIcon
            ],
            nil
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
