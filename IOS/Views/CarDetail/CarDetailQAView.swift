import UIKit
import Nantes

class CarDetailQAView: UIView{
    var rows = [QA]()
    
    lazy var lessButton: UIButton = {
        let button = UIButton()
        button.setTitle("過去のメッセージを閉じる", for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 82, blue: 163), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        button.setImage(UIImage(named: "Up")?.resized(16.0,  16.0).withTintColor(UIColor(red: 0, green: 82, blue: 163)), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.sizeToFit()
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CarDetailQATableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CarDetailAnswerTableViewCell.self, forCellReuseIdentifier: "answer")
        tableView.register(CarDetailQuestionTableViewCell.self, forCellReuseIdentifier: "question")
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    func layout() {
        addSubviews( tableView, lessButton )
        
        NSLayoutConstraint.visual(
            [
                "H:|[tableView]|": [],
                "V:|[lessButton]-[tableView]|": [ .alignAllCenterX ]
            ],
            [
                "tableView": tableView,
                "lessButton": lessButton
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
        cell.selectionStyle = .none
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
