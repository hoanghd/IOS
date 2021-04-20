import UIKit

class CarDetailUserView: UIView{
    lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"Avatar"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var codeLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(red:1, green:122, blue:255)
        return label
    }()
    
    lazy var nameLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    lazy var addrLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .black
        return label
    }()
    
    lazy var typeLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .gray
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
    
    lazy var reportLablel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(red:1, green:122, blue:255)
        label.text = "この問い合わせを報告する"
        return label
    }()
    
    lazy var border: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    func layout() {
        addSubviews( avatar, codeLablel, nameLablel, addrLablel, typeLablel, inventoryButton, quoteButton, inExButton, loanButton, reportLablel, border )
        
        NSLayoutConstraint.activate([
            avatar.widthAnchor.constraint(equalTo: avatar.heightAnchor),
            avatar.centerYAnchor.constraint(equalTo: nameLablel.centerYAnchor),
            typeLablel.centerYAnchor.constraint(equalTo: nameLablel.centerYAnchor),
            
            codeLablel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            nameLablel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8),
            addrLablel.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.visual(
            [
                "H:|-[avatar(==50)]": [],
                "V:|-[codeLablel]-[nameLablel]-[addrLablel]": [ .alignAllCenterX ],
                "H:[typeLablel]-|": [],
                "H:|-[inventoryButton]-[quoteButton(==inventoryButton)]-[inExButton(==inventoryButton)]-|": [ .alignAllCenterY  ],
                "H:|-[loanButton(==inventoryButton)]": [],
                "H:|-[reportLablel]": [],
                "H:|[border]|": [],
                "V:|-[codeLablel]-[nameLablel]-[addrLablel]-12-[inventoryButton]-[loanButton]-16-[reportLablel]-16-[border(==1)]": []
            ],
            [
                "avatar": avatar,
                "codeLablel": codeLablel,
                "nameLablel": nameLablel,
                "addrLablel": addrLablel,
                "typeLablel": typeLablel,
                "inventoryButton": inventoryButton,
                "quoteButton": quoteButton,
                "inExButton": inExButton,
                "loanButton": loanButton,
                "reportLablel": reportLablel,
                "border": border
            ],
            nil
        )
        
        codeLablel.text = "問合せID : 123456-123456"
        nameLablel.text = "交響曲太郎様"
        addrLablel.text = "広島県東広島市西条町助実1223-2"
        typeLablel.text = "smart_easy"
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
