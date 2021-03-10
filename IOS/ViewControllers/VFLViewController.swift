
import UIKit

class VFLViewController: BaseViewController {
    let button: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .blue
        return button
    }()
    
    let labelField: UILabel = {
        let labelField = UILabel()
        labelField.translatesAutoresizingMaskIntoConstraints = false
        labelField.text = "I made a label on the screen #toogood4you"
        labelField.textColor = .red
        labelField.numberOfLines = 5
        labelField.backgroundColor = .blue
        labelField.textAlignment = .center
        return labelField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview( button )
        self.view.addSubview( labelField )

        NSLayoutConstraint.activate({
            var constraints: [NSLayoutConstraint] = []
            let views: [String: Any] = [
                "button": button,
                "labelField": labelField
            ]
            
            constraints.append(contentsOf: NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-50-[button]",
                metrics: nil,
                views: views
            ))
            
            constraints.append(contentsOf: NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-50-[labelField]",
                metrics: nil,
                views: views
            ))
            
            constraints.append(contentsOf: NSLayoutConstraint.constraints(
                withVisualFormat: "|-8-[button]-[labelField]-8-|",
                metrics: nil,
                views: views
            ))
            
            return constraints
        }())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
