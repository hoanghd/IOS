import UIKit
import Nantes

protocol CarDetailTableViewCellDelegate: NSObjectProtocol {
    func tableView(_ tableViewCell: UITableViewCell, _ infoLabel: NantesLabel)
}

class CarDetailTableViewCell: UITableViewCell {
    var delegate: CarDetailTableViewCellDelegate?
    
    var row: QA? {
        didSet {
            guard let row = row else { return }
            infoLabel.text = row.text
        }
    }
    
    lazy var infoLabel:NantesLabel = {
        let label = NantesLabel()
        label.attributedTruncationToken = NSAttributedString(string: "... 続きを見る▼")
        label.numberOfLines = 2
        label.labelTappedBlock = {
            self.delegate?.tableView(self, label)
        }
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews( infoLabel )
        
        NSLayoutConstraint.visual(
            [
                "H:|[infoLabel]|": [],
                "V:|[infoLabel]|": []
            ],
            [
                "infoLabel":        infoLabel
            ],
            nil
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
