import UIKit
import Nantes

class CarDetailListView: UIView{
    var rows = [QA]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CarDetailTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    func layout() {
        addSubviews( tableView )
        
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
        
        QAListApi.get({(rows) in
            self.rows = rows
            self.tableView.reloadData()
        })
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layout()
    }
}

extension CarDetailListView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarDetailTableViewCell
        cell.row = rows[indexPath.row]
        cell.delegate = self
        cell.layoutIfNeeded()
        return cell
    }
}

extension CarDetailListView: CarDetailTableViewCellDelegate{
    func tableView(_ tableViewCell: UITableViewCell, _ label: NantesLabel){
        tableView.beginUpdates()
        label.numberOfLines = label.numberOfLines == 0 ? 2 : 0
        tableView.endUpdates()
    }
}
