import UIKit

class DragViewController: BaseViewController {
    let rows: [[String: String]] = [
        ["cell": "large", "title": "コーションプレート", "src": "" ],
        ["cell": "large", "title": "メイン" , "src": ""],
        ["cell": "large", "title": "後面", "src": "" ],
        ["cell": "large", "title": "内装", "src": "" ],
        ["cell": "large", "title": "エンジン", "src": "" ],
        ["cell": "cell", "title": "", "src": "" ], //empty cell
        ["cell": "small", "title": "写真6枚目", "src": "" ],
        ["cell": "small", "title": "写真7枚目", "src": ""],
        ["cell": "small", "title": "写真8枚目", "src": ""],
        ["cell": "small", "title": "写真9枚目", "src": ""],
        ["cell": "small", "title": "写真10枚目", "src": ""],
        ["cell": "small", "title": "写真11枚目", "src": ""],
        ["cell": "small", "title": "写真12枚目", "src": ""],
        ["cell": "small", "title": "写真13枚目", "src": ""],
        ["cell": "small", "title": "写真14枚目", "src": ""],
        ["cell": "small", "title": "写真15枚目", "src": ""],
        ["cell": "small", "title": "写真16枚目", "src": ""],
        ["cell": "small", "title": "写真17枚目", "src": ""],
        ["cell": "small", "title": "写真18枚目", "src": ""],
        ["cell": "small", "title": "写真19枚目", "src": ""],
        ["cell": "small", "title": "写真20枚目", "src": ""],
        ["cell": "small", "title": "写真21枚目", "src": ""]
    ]
    
    var spacing: CGFloat = 5
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(SmallPhotoCollectionViewCell.self, forCellWithReuseIdentifier: "small")
        collectionView.register(LargePhotoCollectionViewCell.self, forCellWithReuseIdentifier: "large")
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    override func layout() {
        navigationItem.title = "車両画像"
        
        safeView.addSubviews( collectionView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[collectionView]|": [],
                "V:|[collectionView]|": []
            ],
            [
                "collectionView": collectionView
            ],
            nil
        )
    }
}

extension DragViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let row = rows[ indexPath.row ]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row["cell"]!, for: indexPath) as! PhotoCollectionViewCell
        cell.backgroundColor = .white
        cell.row = row
        return cell
    }
}

extension DragViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width  = collectionView.bounds.width
        let height = width/3 + 22
        
        
        if( indexPath.row < 6 ){
            return CGSize(width: (width - spacing * 4)/3, height: height)
        }
        
        return CGSize(width: (width - spacing * 2), height: height * 0.6)
    }
}
