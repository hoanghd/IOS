import UIKit
import Alamofire
import AlamofireImage

class SmallPhotoCollectionViewCell: PhotoCollectionViewCell{
    override var row:[String: String]? {
        didSet {
            guard let row = row else { return }
            
            title.text = row["title"]
            imageView.image = UIImage(named:"NoImage")
            
            if let src = row["src"] {
                AF.request(src, method: .get).responseImage { response in
                    if case .success(let image) = response.result {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"NoImage"))
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
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Delete"), for: .normal)
        button.addTarget(self, action:#selector(removeImage), for: .touchUpInside)
        return button
    }()
    
    @objc func removeImage() {
        imageView.image = UIImage(named:"NoImage")
        delegate?.collectionViewCell(self, index, nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews(imageView, button, title)
        layer.addBorder(edge: .bottom, color: .gray, thickness: 1)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            button.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            button.topAnchor.constraint(equalTo: imageView.topAnchor)
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
