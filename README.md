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
https://swiftsenpai.com/development/collectionview-expandable-list-part1/


UISwitch UICollectionView cell
https://www.biteinteractive.com/user-interactive-cell-configurations-in-ios-14/
search
https://www.raywenderlich.com/8241072-ios-tutorial-collection-view-and-diffable-data-source

UICollectionViewListCell.accessories
https://www.donnywals.com/how-to-add-accessories-to-a-uicollectionviewlistcell/

https://www.donnywals.com/how-to-add-a-custom-accessory-to-a-uicollectionviewlistcell/

ICON
https://developer.apple.com/design/human-interface-guidelines/sf-symbols/overview/