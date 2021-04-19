import UIKit
import Alamofire

class CarListViewController: BaseViewController {
    var rows: [Car] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    override func layout() {
        tabBarController?.navigationItem.title = "車両画像"
        tabBarController?.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                barButtonSystemItem: .camera,
                target: nil,
                action: nil
            )
        ]
        
        self.safeView.addSubviews( tableView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[tableView]|": [],
                "V:|[tableView]|": []
            ],
            [
                "tableView": tableView
            ],
            nil
        )
        
        CarListApi.get(1, {(rows) in
            self.rows = rows
            self.tableView.reloadData()
        })
    }
}

extension CarListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CarTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.row = rows[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
