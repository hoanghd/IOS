# Extension Delegate
~~~
private let association = AssociatedObject<UICollectionViewCellDelegate>()

extension UICollectionView {
    var cellDelegate: UICollectionViewCellDelegate? {
         get { association[self] }
         set { association[self] = newValue }
     }
}
~~~
