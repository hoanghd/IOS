import UIKit

class SmallPhotoCollectionViewCell: PhotoCollectionViewCell{
    override var row:[String: String]? {
        didSet {
            guard let row = row else { return }
            title.text = row["title"]
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"NoImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.textColor = .black
        title.font = UIFont.systemFont(ofSize: 12.0)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(imageView, title)
        layer.addBorder(edge: .bottom, color: .gray, thickness: 1)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        
        NSLayoutConstraint.visual(
            [
                "H:|[imageView]-[title]|": [ .alignAllCenterY ],
                "V:|-[imageView]-|": []
            ],
            [
                "title": title,
                "imageView": imageView
            ],
            nil
        )
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
