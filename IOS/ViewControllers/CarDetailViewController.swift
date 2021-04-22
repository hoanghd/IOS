import UIKit

class CarDetailViewController: BaseViewController {
    var carId: Int?
    
    lazy var noAnsButton: UIButton = {
        let button = UIButton()
        button.setTitle("未回答", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.backgroundColor = UIColor(red: 52, green: 199, blue: 99)
        return button
    }()
    
    lazy var userInfo: CarDetailUserView = {
        let view = CarDetailUserView(frame: .zero)
        return view
    }()
    
    lazy var carInfo: CarDetailBaseView = {
        let view = CarDetailBaseView(frame: .zero)
        return view
    }()
    
    lazy var chatList: CarDetailChatView = {
        let view = CarDetailChatView(frame: .zero)
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = CGSize(width: safeView.frame.width, height: 2000)
        return view
    }()
    
    override func layout() {
        navigationItem.title = "車両画像"
        
        safeView.addSubviews( scrollView )
        scrollView.addSubviews( noAnsButton, userInfo, carInfo, chatList )
        
        NSLayoutConstraint.activate([
            noAnsButton.widthAnchor.constraint(equalToConstant: 150),
            noAnsButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            userInfo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            carInfo.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            chatList.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.visual(
            [
                "H:|[scrollView]|": [],
                "V:|[scrollView]|": [],
                "V:|-[noAnsButton]-[userInfo]-[carInfo]-[chatList]": []
            ],
            [
                "noAnsButton": noAnsButton,
                "userInfo": userInfo,
                "carInfo": carInfo,
                "chatList": chatList,
                "scrollView": scrollView
            ],
            nil
        )
    }
    
    override func viewDidLayoutSubviews() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.noAnsButton.layer.masksToBounds = true
            self.noAnsButton.layer.cornerRadius = 0.5 * self.noAnsButton.bounds.size.height
        }
    }
}
