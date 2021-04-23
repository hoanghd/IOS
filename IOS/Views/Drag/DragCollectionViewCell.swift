import UIKit

protocol DragCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCell(_ collectionViewCell: UICollectionViewCell, _ indexPath: IndexPath?, _ data: [String:Any]?)
}

class DragCollectionViewCell: UICollectionViewCell{
    var delegate: DragCollectionViewCellDelegate?
    var row: [String: String]? = [:]
    var index: IndexPath? = []
}
