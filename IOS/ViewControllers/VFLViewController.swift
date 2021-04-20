
import UIKit

class VFLViewController: BaseViewController {
    let button1_1: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(named: "Camera")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    let button1_2: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Cancel1", for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    let button2_1: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Send2", for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    let button2_2: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Cancel2", for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.safeView.addSubviews( button1_1 , button1_2, button2_1, button2_2 )
        
        NSLayoutConstraint.activate([
            button2_1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2_2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.visual(
            [
                "H:|-[button1_1]-[button1_2]": [ .alignAllCenterY ],
                "V:|-20-[button1_1]-50-[button2_1]-50-[button2_2]": []
            ],
            [
                "button1_1": button1_1,
                "button1_2": button1_2,
                "button2_1": button2_1,
                "button2_2": button2_2
            ],
            nil
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
