import UIKit

class MainViewController: UITabBarController {
    
    lazy var drag: DragViewController = {
        let drag = DragViewController()
        
        let barItem = UITabBarItem(
            title: "Drag",
            image: UIImage(named: "Drag"),
            tag: 1
        )
        
        drag.tabBarItem = barItem
        
        return drag
    }()
    
    lazy var list: CarListViewController = {
        let list = CarListViewController()
        
        let barItem = UITabBarItem(
            title: "List",
            image: UIImage(named: "List"),
            tag: 2
        )
        
        list.tabBarItem = barItem
        
        return list
    }()
    
    lazy var upload: UploadViewController = {
        let list = UploadViewController()
        
        let barItem = UITabBarItem(
            title: "Upload",
            image: UIImage(named: "Upload"),
            tag: 3
        )
        
        list.tabBarItem = barItem
        
        return list
    }()
    
    lazy var multipleUpload: MultipleUploadViewController = {
        let list = MultipleUploadViewController()
        
        let barItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: 4
        )
        
        list.tabBarItem = barItem
        
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [drag, list, upload, multipleUpload]
    }
}
