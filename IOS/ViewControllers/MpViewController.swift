
import UIKit
import PhotosUI
import Alamofire

class MpViewController: BaseViewController {
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
    
    lazy var picker: PHPickerViewController = {
        var configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        configuration.filter = PHPickerFilter.images
        configuration.selectionLimit = 0 //For unlimited selections use 0. Default is 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
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
        tabBarController?.navigationItem.title = "Upload Multiple Files"
        tabBarController?.navigationItem.rightBarButtonItems = []
        
        safeView.addSubviews( uploadButton )
        
        NSLayoutConstraint.activate([
            uploadButton.widthAnchor.constraint(equalToConstant: 100),
            uploadButton.centerXAnchor.constraint(equalTo: safeView.centerXAnchor),
            uploadButton.centerYAnchor.constraint(equalTo: safeView.centerYAnchor)
        ])
    }
}

extension MpViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        let identifiers = results.compactMap(\.assetIdentifier)
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        fetchResult.enumerateObjects { (asset, index, stop) -> Void in
            asset.requestContentEditingInput( with: PHContentEditingInputRequestOptions() ){ (input, _) in
                if let input = input, let imageUrl = input.fullSizeImageURL{
                    AF.upload(
                        multipartFormData: { multipartFormData in
                            multipartFormData.append(imageUrl, withName: "car")
                        },
                        to: "http://bizren.fbc.local/upload.php",
                        method: .post
                    )
                    .responseJSON { response in
                        debugPrint(response)
                    }
                }
            }
       }
    }
    
}

