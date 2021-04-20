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
    
    override func layout() {
        navigationItem.title = "車両画像"
        
        safeView.addSubviews( noAnsButton, userInfo, carInfo, chatList )
        
        NSLayoutConstraint.activate([
            noAnsButton.centerXAnchor.constraint(equalTo: safeView.centerXAnchor),
            noAnsButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.visual(
            [
                "V:|-[noAnsButton]-[userInfo]-|": [],
                "H:|-[userInfo]-|": []
            ],
            [
                "noAnsButton": noAnsButton,
                "userInfo": userInfo,
                "carInfo":  carInfo,
                "chatList": chatList
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
