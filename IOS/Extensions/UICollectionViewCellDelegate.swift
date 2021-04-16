import UIKit

protocol UICollectionViewCellDelegate: NSObjectProtocol {
    func collectionViewCell(_ collectionViewCell: UICollectionViewCell, _ indexPath: IndexPath?, _ data: [String:Any]?)
}
