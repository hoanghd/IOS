import UIKit

class MainViewController: UITabBarController {
    
    lazy var drag: UINavigationController = {
        let nView = UINavigationController(rootViewController: DragViewController())
        
        nView.tabBarItem = UITabBarItem(
            title: "Drag",
            image: UIImage(named: "Drag"),
            tag: 1
        )
        
        return nView
    }()
    
    lazy var list: UINavigationController = {
        let nView = UINavigationController(rootViewController: CarListViewController())
        
        nView.tabBarItem = UITabBarItem(
            title: "List",
            image: UIImage(named: "List"),
            tag: 2
        )
        
        return nView
    }()
    
    lazy var input: UINavigationController = {
        let nView = UINavigationController(rootViewController: CarInputViewController())
        
        nView.tabBarItem = UITabBarItem(
            title: "Input",
            image: UIImage(named: "Input"),
            tag: 3
        )
        
        return nView
    }()
    
    lazy var detail: UINavigationController = {
        let nView = UINavigationController(rootViewController: DetailViewController())
        
        nView.tabBarItem = UITabBarItem(
            title: "Detail",
            image: UIImage(named: "Detail"),
            tag: 4
        )
        
        return nView
    }()
    
    lazy var upload: UINavigationController = {
        let nView = UINavigationController(rootViewController: UploadViewController())
        
        nView.tabBarItem = UITabBarItem(
            title: "Upload",
            image: UIImage(named: "Upload"),
            tag: 5
        )
        
        return nView
    }()
    
    lazy var multipleUpload: UINavigationController = {
        let nView = UINavigationController(rootViewController: MultipleUploadViewController())
        
        nView.tabBarItem = UITabBarItem(
            tabBarSystemItem: .bookmarks,
            tag: 6
        )
        
        return nView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [drag, list, input, detail, upload, multipleUpload]
    }
}
