import UIKit

class DragViewController: BaseViewController {
    let images: [String] = [
        "コーションプレート", "メイン", "後面", "内装", "エンジン", "",
        "写真6枚目", "写真7枚目", "写真8枚目", "写真9枚目", "写真10枚目",
        "写真11枚目", "写真12枚目", "写真13枚目", "写真14枚目", "写真15枚目",
        "写真16枚目", "写真17枚目", "写真18枚目", "写真19枚目", "写真20枚目", "写真21枚目"
    ]
    
    var spacing: CGFloat = 5
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
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
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}

extension DragViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let width  = collectionView.bounds.width
        let height = width/3 + 20
        
        
        if( indexPath.row < 6 ){
            return CGSize(width: (width - spacing * 4)/3, height: height)
        }
        
        return CGSize(width: (width - spacing * 2), height: height * 0.6)
    }
}
