import UIKit

extension UIView {
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}

