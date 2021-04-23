import UIKit

protocol PhotoCollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCell(_ collectionViewCell: UICollectionViewCell, _ indexPath: IndexPath?, _ data: [String:Any]?)
}

class PhotoCollectionViewCell: UICollectionViewCell{
    var delegate: PhotoCollectionViewCellDelegate?
    var row: [String: String]? = [:]
    var index: IndexPath? = []
}
