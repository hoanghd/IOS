import UIKit
import Nantes

protocol CarDetailQATableViewCellDelegate: NSObjectProtocol {
    func tableView(_ tableViewCell: UITableViewCell, _ infoLabel: NantesLabel)
}

class CarDetailQATableViewCell: UITableViewCell {
    var delegate: CarDetailQATableViewCellDelegate?
    
    var row: QA? {
        didSet {
            guard let row = row else { return }
            dateLabel.text = row.date
            userLabel.text = row.customer
            messageLabel.text = row.text
        }
    }
    
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
        
        label.attributedTruncationToken = NSAttributedString(string: "... 続きを見る▼")
        label.numberOfLines = 2
        
        label.labelTappedBlock = {
            self.delegate?.tableView(self, label)
        }
        
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel, userLabel, messageLabel])
        view.axis = .vertical
        
        view.spacing = 10
        view.isLayoutMarginsRelativeArrangement = true
        view.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 18, leading: 18, bottom: 18, trailing: 18)
        view.layer.borderWidth = 8
        
        return view
    }()
}

