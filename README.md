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

# UIBarButtonItem
~~~
	barButtonSystemItem: .trash

	image: UIImage(named: "Back")

	title: "編集"
    style: .plain
~~~

https://github.com/TTTAttributedLabel/TTTAttributedLabel
https://stackoverflow.com/questions/32309247/add-read-more-to-the-end-of-uilabel