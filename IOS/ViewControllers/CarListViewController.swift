import UIKit
import Alamofire

class CarListViewController: BaseViewController {
    var rows: [Car] = []
    
    lazy var segmented: UISegmentedControl = {
        let segmented = UISegmentedControl(items: ["未回答 (5)", "回答済", "返信あり (2)"])
        segmented.translatesAutoresizingMaskIntoConstraints = false
        segmented.selectedSegmentIndex = 0
        
        segmented.addTarget(self, action:#selector(segmentedValueChanged(_:)), for: .valueChanged)
        
        return segmented
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(CarTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorColor = .gray
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!) {
        print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
    }
    
    override func layout() {
        navigationItem.title = "車両画像"
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                barButtonSystemItem: .camera,
                target: nil,
                action: nil
            )
        ]
        
        self.safeView.addSubviews( segmented, tableView )
        
        NSLayoutConstraint.visual(
            [
                "H:|[tableView]|": [],
                "H:|-[segmented]-|": [],
                "V:|-20-[segmented]-20-[tableView]|": []
            ],
            [
                "segmented": segmented,
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
        let carDetail = CarDetailViewController()
        carDetail.carId = 1
        
        navigationController?.pushViewController(carDetail, animated: true)
    }
}
