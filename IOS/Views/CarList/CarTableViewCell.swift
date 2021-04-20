import UIKit
import Alamofire

class CarTableViewCell: UITableViewCell {
    var row: Car? {
        didSet {
            guard let row   = row else { return }
            
            dateLabel.text  = row.date
            codeLablel.text = "問合せID : \(row.code)"
            nameLablel.text = row.name
            infoLablel.text = row.info
            
            agoLablel.text      = row.ago > 0 ? "\(row.ago)日前" : ""
            agoLablel.textColor = row.ago < 3 ? .black : .red
            
            if !row.img.isEmpty {
                AF.request(row.img, method: .get).responseImage { response in
                    if case .success(let image) = response.result {
                        self.imageCar.image = image
                    }
                }
            }
        }
    }
    
    lazy var containerView:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    lazy var dateLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    lazy var codeLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    lazy var nameLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var agoLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var imageCar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"NoImage"))
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var infoLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    lazy var inventoryButton: UIButton = {
        let button = UIButton()
        button.setTitle("在庫情報", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        button.layer.borderWidth  = 1
        button.layer.borderColor  = UIColor.gray.cgColor
        
        button.layer.backgroundColor = UIColor(red: 253, green: 251, blue: 218).cgColor
        return button
    }()
    
    lazy var quoteButton: UIButton = {
        let button = UIButton()
        button.setTitle("見積依頼", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        button.layer.borderWidth  = 1
        button.layer.borderColor  = UIColor.gray.cgColor
        
        button.layer.backgroundColor = UIColor(red: 253, green: 251, blue: 218).cgColor
        return button
    }()
    
    lazy var inExButton: UIButton = {
        let button = UIButton()
        button.setTitle("内外装", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        button.layer.borderWidth  = 1
        button.layer.borderColor  = UIColor.gray.cgColor
        
        button.layer.backgroundColor = UIColor(red: 253, green: 251, blue: 218).cgColor
        return button
    }()
    
    lazy var loanButton: UIButton = {
        let button = UIButton()
        button.setTitle("ローン金利", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        
        button.layer.borderWidth  = 1
        button.layer.borderColor  = UIColor.gray.cgColor
        
        button.layer.backgroundColor = UIColor(red: 253, green: 251, blue: 218).cgColor
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        containerView.addSubviews( dateLabel, codeLablel, nameLablel, agoLablel, imageCar, infoLablel, inventoryButton, quoteButton, inExButton, loanButton )
        contentView.addSubviews( containerView )
        
        NSLayoutConstraint.activate([
            imageCar.widthAnchor.constraint(equalTo: imageCar.heightAnchor),
            codeLablel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            codeLablel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            
            agoLablel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            agoLablel.centerYAnchor.constraint(equalTo: nameLablel.centerYAnchor)
        ])

        NSLayoutConstraint.visual(
            [
                "H:|[containerView]|": [],
                "V:|[containerView]|": [],
                "H:|-[dateLabel]": [],
                "H:|-[nameLablel]": [],
                "H:|-[imageCar]-[infoLablel]-|": [ .alignAllCenterY ],
                "H:|-[inventoryButton]-[quoteButton(==inventoryButton)]-[inExButton(==inventoryButton)]-|": [ .alignAllCenterY  ],
                "H:|-[loanButton(==inventoryButton)]": [],
                "V:|-[dateLabel]-[nameLablel]-[imageCar(==40)]-[inventoryButton]-[loanButton]-|": []
            ],
            [
                "dateLabel":        dateLabel,
                "codeLablel":       codeLablel,
                "nameLablel":       nameLablel,
                "agoLablel":        agoLablel,
                "imageCar":         imageCar,
                "infoLablel":       infoLablel,
                "inventoryButton":  inventoryButton,
                "quoteButton":      quoteButton,
                "inExButton":       inExButton,
                "loanButton":       loanButton,
                "containerView": containerView
            ],
            nil
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
