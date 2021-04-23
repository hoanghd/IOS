import UIKit
import Nantes

class CarDetailQAView: UIView{
    var rows = [QA]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CarDetailQATableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CarDetailAnswerTableViewCell.self, forCellReuseIdentifier: "answer")
        tableView.register(CarDetailQuestionTableViewCell.self, forCellReuseIdentifier: "question")
        
        tableView.separatorStyle = .none
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

extension CarDetailQAView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row  = rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.type, for: indexPath) as! CarDetailQATableViewCell
        cell.row = row
        cell.delegate = self
        cell.layoutIfNeeded()
        return cell
    }
}

extension CarDetailQAView: CarDetailQATableViewCellDelegate{
    func tableView(_ tableViewCell: UITableViewCell, _ label: NantesLabel){
        tableView.beginUpdates()
        label.numberOfLines = label.numberOfLines == 0 ? 2 : 0
        tableView.endUpdates()
    }
}
