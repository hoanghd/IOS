
import UIKit

class ContactTableViewCell: UITableViewCell {
    var name:String? {
        didSet {
            guard let text = name else {return}
            nameLabel.text = text
        }
    }
    
    var tel:String? {
        didSet {
            guard let text = tel else {return}
            telLabel.text = text
        }
    }
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var telLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.addSubviews( nameLabel, telLabel )
        contentView.addSubviews( containerView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[containerView]|": [],
                "V:|[containerView]|": [],
                
                "V:|-[nameLabel]-|": [],
                "V:|-[telLabel]-|": [],
                "H:|-[nameLabel]-[telLabel]-|": [],
            ],
            [
                "telLabel": telLabel,
                "nameLabel": nameLabel,
                "containerView": containerView
            ],
            nil
        )
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
