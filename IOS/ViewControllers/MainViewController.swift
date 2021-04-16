import UIKit

class MainViewController: UITabBarController {
    
    lazy var drag: DragViewController = {
        let drag = DragViewController()
        
        let barItem = UITabBarItem(
            title: "Notify",
            image: UIImage(named: "Noti"),
            tag: 1
        )
        
        drag.tabBarItem = barItem
        
        return drag
    }()
    
    lazy var list: ListViewController = {
        let list = ListViewController()
        
        let barItem = UITabBarItem(
            tabBarSystemItem: .downloads,
            tag: 2
        )
        
        list.tabBarItem = barItem
        
        return list
    }()
    
    lazy var up: UpViewController = {
        let list = UpViewController()
        
        let barItem = UITabBarItem(
            tabBarSystemItem: .contacts,
            tag: 2
        )
        
        list.tabBarItem = barItem
        
        return list
    }()
    
    lazy var mp: MpViewController = {
        let list = MpViewController()
        
        let barItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: 2
        )
        
        list.tabBarItem = barItem
        
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [drag, list, up, mp]
    }
}
