
import UIKit

class FilmTableViewCell: UITableViewCell {
    var row: Film? {
        didSet {
            guard let row = row else {return}
            nameLabel.text = row.title
            subtitle.text = "Episode \(String(row.id))"
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
    
    lazy var subtitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.addSubviews( nameLabel, subtitle )
        contentView.addSubviews( containerView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[containerView]|": [],
                "V:|[containerView]|": [],
                
                "V:|-[nameLabel]-|": [],
                "V:|-[subtitle]-|": [],
                "H:|-[nameLabel]-[subtitle]-|": [],
            ],
            [
                "nameLabel": nameLabel,
                "subtitle": subtitle,
                "containerView": containerView
            ],
            nil
        )
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
