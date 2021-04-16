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

# Core Data
~~~
https://www.raywenderlich.com/6587213-alamofire-5-tutorial-for-ios-getting-started
https://swapi.dev/api/films/
~~~