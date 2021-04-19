import UIKit
import Alamofire

class ListViewController: BaseViewController {
    var rows: [Film] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "cell")
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
        
        FilmsApi.get{ (rows) in
            self.rows = rows
            self.tableView.reloadData()
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FilmTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilmTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.row = rows[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}
