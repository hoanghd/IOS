import UIKit
import Alamofire

class CarDetailBaseView: UIView{
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"NoImage"))
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 2
        return label
    }()
    
    lazy var openButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "Open"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    lazy var yearLabel: UILabel = UILabel()
    lazy var colorLabel: UILabel = UILabel()
    lazy var priceLabel: UILabel = UILabel()
    lazy var mileageLabel: UILabel = UILabel()
    lazy var carNumLabel: UILabel = UILabel()
    
    lazy var carIdLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        return label
    }()
    
    lazy var rows: [Any] = [
        "年式", yearLabel,
        "色", colorLabel,
        "車両価格", priceLabel,
        "走行", mileageLabel,
        "車台番号", carNumLabel,
        "車番ID", carIdLabel,
    ]
    
    lazy var carInfoView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIColor(red: 229, green: 229, blue: 229)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    func layout() {
        addSubviews( imageView, titleLabel, openButton, carInfoView )
        
        NSLayoutConstraint.activate([
            openButton.widthAnchor.constraint(equalTo: openButton.heightAnchor)
        ])
        
        NSLayoutConstraint.visual(
            [
                "H:|-[imageView(==80)]-[titleLabel]-[openButton(==23)]-|": [ .alignAllCenterY ],
                "H:|-[carInfoView]-|": [],
                "V:|-[imageView(==60)]-[carInfoView(==94)]-|": [],
            ],
            [
                "imageView": imageView,
                "openButton": openButton,
                "titleLabel": titleLabel,
                "carInfoView": carInfoView
            ],
            nil
        )
        
        titleLabel.text = "レクサス LS460 バージョンS Iパッケージ"
        yearLabel.text = "H18(2006)年"
        colorLabel.text = "ブラック"
        priceLabel.text = "129万円"
        mileageLabel.text = "8.8万km"
        carNumLabel.text = "0984567453"
        carIdLabel.text = "12345-1234"
        
        AF.request("https://img0.kurumaerabi.com/image/202101/058/a52874a6.160.jpg", method: .get).responseImage { response in
            if case .success(let image) = response.result {
                self.imageView.image = image
            }
        }
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

extension CarDetailBaseView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        var width  = collectionView.bounds.width - 5
        let row    = rows[ indexPath.row ]
        
        if (row is UIView){
            width = (width/2) * 0.6
        } else {
            width = (width/2) * 0.4
        }
        
        return CGSize(width: width, height: 30)
    }
}

extension CarDetailBaseView: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row     = rows[ indexPath.row ]
        let cell    = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: cell.bounds.size.width, height: cell.bounds.size.height))
        title.font = UIFont.systemFont(ofSize: 12)
        
        if (row is UIView){
            title.text = (row as! UILabel).text
            title.textAlignment = .left
            title.frame.origin.x = 8
            title.clipsToBounds = true
            cell.backgroundColor = .white
        } else {
            title.text = (row as! String)
            title.textAlignment = .center
            cell.backgroundColor = UIColor(red: 247, green: 247, blue: 247)
        }
        
        cell.contentView.addSubview(title)
        
        return cell
    }
}
