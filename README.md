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

# Link
~~~
https://xd.adobe.com/view/a500aed2-b5bb-4e75-9c5e-fbd7f01ceeba-f053/screen/ad599d04-006e-49fe-8fcc-912c1f34df7c
~~~