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

https://developer.apple.com/documentation/uikit/uirefreshcontrol
https://developer.apple.com/design/human-interface-guidelines/ios/controls/pickers/
https://www.brihaspatitech.com/blog/local-ios-data-storage-guidelines-for-ios-applications/


https://dev.classmethod.jp/articles/wwdc-20-lists-in-uicollectionview/#toc-7
https://useyourloaf.com/blog/creating-lists-with-collection-view/