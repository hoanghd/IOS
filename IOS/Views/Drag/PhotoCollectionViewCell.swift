import UIKit

class PhotoCollectionViewCell: UICollectionViewCell{
    var delegate: UICollectionViewCellDelegate?
    var row: [String: String]? = [:]
    var index: IndexPath? = []
}
