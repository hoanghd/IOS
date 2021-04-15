import UIKit

class DragViewController: BaseViewController {
    var rows: [[String: String]] = [
        ["cell": "large", "title": "コーションプレート", "src": "https://img1.kurumaerabi.com/image/202101/226/e1bf4906.jpg" ],
        ["cell": "large", "title": "メイン" , "src": "https://img0.kurumaerabi.com/image/202101/228/c387fa43.jpg"],
        ["cell": "large", "title": "後面", "src": "https://img1.kurumaerabi.com/image/202101/227/157b90a2.jpg" ],
        ["cell": "large", "title": "内装", "src": "https://img0.kurumaerabi.com/image/202101/220/78ec5cf9.jpg" ],
        ["cell": "large", "title": "エンジン", "src": "https://img0.kurumaerabi.com/image/202101/226/c9eccb0e.jpg" ],
        ["cell": "cell", "title": "", "src": "" ], //empty cell
        ["cell": "small", "title": "写真6枚目", "src": "https://img0.kurumaerabi.com/image/202101/220/1c411183.jpg" ],
        ["cell": "small", "title": "写真7枚目", "src": "https://img1.kurumaerabi.com/image/202101/227/e0790ba9.jpg"],
        ["cell": "small", "title": "写真8枚目", "src": "https://img1.kurumaerabi.com/image/202101/227/e4f1f0d4.jpg"],
        ["cell": "small", "title": "写真9枚目", "src": "https://img1.kurumaerabi.com/image/202101/224/ea727eb9.jpg"],
        ["cell": "small", "title": "写真10枚目", "src": "https://img1.kurumaerabi.com/image/202101/223/2af9e2fe.jpg"],
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
        collectionView.dragInteractionEnabled = true
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.dragDelegate = self
        collectionView.dropDelegate = self
        
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
            return CGSize(width: (width - (spacing + 1) * 4)/3, height: height)
        }
        
        return CGSize(width: (width - (spacing + 1) * 2), height: height * 0.6)
    }
}

extension DragViewController: UICollectionViewDragDelegate{
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let row = rows[ indexPath.row ]
        
        if( row["src"] == "" || row["title"] == "" ){
            return []
        }
        
        let rowProvider = NSItemProvider(object: row["title"]! as NSString)
        let dragItem = UIDragItem(itemProvider: rowProvider)
        return [dragItem]
    }
}

extension DragViewController: UICollectionViewDropDelegate{
    func collectionView(_ collectionView: UICollectionView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal{
        if(
            session.localDragSession == nil ||
            !collectionView.hasActiveDrag ||
            destinationIndexPath == nil ||
            rows[destinationIndexPath!.row]["cell"] == "cell"
        ){
            return UICollectionViewDropProposal(operation: .forbidden)
        }
        
        return UICollectionViewDropProposal(operation: .copy, intent: .insertIntoDestinationIndexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        guard let indexPath = coordinator.destinationIndexPath else { return }
        
        if coordinator.session.localDragSession != nil {
            for item in coordinator.items {
                guard let sourceIndex = item.sourceIndexPath else {
                  return
                }
                
                (rows[indexPath.row]["src"], rows[sourceIndex.row]["src"]) = (rows[sourceIndex.row]["src"], rows[indexPath.row]["src"])
                collectionView.reloadData()
            }
        }
    }
}
