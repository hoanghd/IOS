import UIKit

class CarDetailViewController: BaseViewController {
    var carId: Int?
    
    override func layout() {
        print("CarId:\(String(describing: carId))")
    }
}
