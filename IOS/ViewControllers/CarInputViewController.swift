import UIKit

class CarInputViewController: BaseViewController {
    let options = ["English", "Maths", "History", "German", "Science"]
    
    lazy var textField: UITextField = {
        let input = UITextField()
        input.font = UIFont.systemFont(ofSize: 14)
        input.attributedPlaceholder = NSAttributedString(string: "input",
                                                             attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        input.layer.cornerRadius = 5
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.gray.cgColor
        
        input.inputView = pickerView
        input.inputAccessoryView = toolBar
        return input
    }()
    
    lazy var passField: UITextField = {
        let input = UITextField()
        input.isSecureTextEntry = true
        input.font = UIFont.systemFont(ofSize: 14)
        input.layer.cornerRadius = 5
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.gray.cgColor
        return input
    }()
    
    lazy var switchField = UISwitch()
    
    lazy var textView: UITextView = {
        let input = UITextView()
        input.font = UIFont.systemFont(ofSize: 14)
        input.text = "textarea"
        input.layer.cornerRadius = 5
        input.layer.borderWidth = 1
        input.layer.borderColor = UIColor.gray.cgColor
        return input
    }()
    
    lazy var datePicker: UIDatePicker = {
        let input = UIDatePicker()
        input.datePickerMode = .date
        input.preferredDatePickerStyle = .compact
        return input
    }()
    
    lazy var pickerView: UIPickerView = {
        let input = UIPickerView()
        input.dataSource = self
        input.delegate = self
        input.backgroundColor = UIColor.white
        return input
    }()
    
    lazy var toolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.tintColor = UIColor.black
        toolbar.sizeToFit()
        
        toolbar.setItems([
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick)),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        ], animated: false)
        
        return toolbar
    }()
    
    @objc func doneClick() {
        textField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        textField.resignFirstResponder()
    }
    
    override func layout() {
        safeView.addSubviews( textField, passField, switchField, textView, datePicker )
        
        NSLayoutConstraint.visual(
            [
                "H:|-[textField]-|": [],
                "H:|-[passField]-|": [],
                "H:|-[switchField]-|": [],
                "H:|-[textView]-|": [],
                "H:|-[datePicker]-|": [],
                "V:|-[textField]-[passField]-[textView(==100)]-[datePicker]-[switchField]": []
            ],
            [
                "textView": textView,
                "textField": textField,
                "passField": passField,
                "datePicker": datePicker,
                "switchField": switchField
            ],
            nil
        )
    }
}

extension CarInputViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      return options[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = options[row]
    }
}
