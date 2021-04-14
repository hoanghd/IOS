
import UIKit
import Photos
import Alamofire

class UpViewController: BaseViewController {
    lazy var uploadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Upload", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        button.layer.cornerRadius = 6.0
        button.layer.borderWidth  = 2
        button.layer.borderColor  = UIColor.red.cgColor
        
        button.addTarget(self, action:#selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    lazy var picker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.sourceType      = .photoLibrary
        picker.delegate        = self
        picker.allowsEditing   = false
        return picker
    }()
    
    @objc func buttonClicked() {
        switch PHPhotoLibrary.authorizationStatus() {
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization { (status) in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.present(self.picker, animated: true, completion: nil)
                        }
                    }
                }
                break
            
            case .authorized:
                self.present(self.picker, animated: true, completion: nil)
                break
            
            case .denied, .restricted: break
            default: break
        }
    }
    
    override func layout() {
        safeView.addSubviews( uploadButton )
        
        NSLayoutConstraint.activate([
            uploadButton.widthAnchor.constraint(equalToConstant: 100),
            uploadButton.centerXAnchor.constraint(equalTo: safeView.centerXAnchor),
            uploadButton.centerYAnchor.constraint(equalTo: safeView.centerYAnchor)
        ])
    }
}

extension UpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageUrl = info[.imageURL]{
            let parameters: Parameters = [
                "id" : "100"
            ]
            
            AF.upload(
                multipartFormData: { multipartFormData in
                    for (key,value) in parameters {
                        multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
                    }
                    multipartFormData.append(imageUrl as! URL, withName: "car")
                },
                to: "http://bizren.fbc.local/upload.php",
                method: .post
            )
            .responseJSON { response in
                debugPrint(response)
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
