//
//  ProfileVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/14/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import Firebase
import AlamofireImage

class ProfileVC: UIViewController {
    
    var screen: ProfileScreen?
    let imagePicker: UIImagePickerController = UIImagePickerController()
    var alert: Alert?
    let storage = Storage.storage().reference()
    let firestore = Firestore.firestore()
    var user: [User] = []
    var currentUser = Auth.auth().currentUser
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        configImagePicker()
        alert = Alert(controller: self)
        configImagePicker()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
                getUserData()
    }
    
    
    func configImagePicker(){
        imagePicker.delegate = self
    }
    
        func getUserData(){
            firestore.collection("usuarios").getDocuments { snapshot, error in
                if error == nil {
                    if let snapshot {
                        DispatchQueue.main.async {
                            self.user = snapshot.documents.map({ document in
                                return User(nome: document["nome"] as? String ?? "",
                                            email: document["email"] as? String ?? "",
                                            image: document["image"] as? String ?? "")
                            })
                            self.populateView(index: self.getIndex(email: self.currentUser?.email ?? ""))
                        }
                    }
                }
            }
        }
        func populateView(index: Int){
            screen?.emailLabel.text = user[index].email
            screen?.emailLabel.textColor = .lightGray
            screen?.nameLabel.text = user[index].nome
            screen?.nameLabel.textColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
            let url = URL(string: user[index].image) ?? URL(fileURLWithPath: "")
            screen?.imageProfile.af.setImage(withURL: url)
        }
    
        func getIndex(email: String) -> Int {
            let index = user.firstIndex { $0.email == email } ?? 0
                return index
        }
    }
    

extension ProfileVC: ProfileScreenProtocol{
    func actionEditButton() {
        self.alert?.alertEditPhoto(completion: { option in
            switch option {
            case .camera:
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true)
                
            case .library:
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true)
                
            case .cancel:
                break
            }
        })
    }
    
    func actionBackButton() {
      
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.screen?.imageProfile.image = image
        
            guard let imageData = image.pngData() else { return }
            
            let currentUser = GetCurrentUserEmail.getCurrentUserEmail
            
            storage.child("images/file.png").putData(imageData,metadata: nil) { _, error in
                guard error == nil else {
                    print("failed to upload", String(describing: error?.localizedDescription))
                    return
                }
                self.storage.child("images/file.png").downloadURL { url, error in
                    guard let url = url, error == nil else {return}
                    let urlString = url.absoluteString

                    DispatchQueue.main.async {
                        self.screen?.imageProfile.image = image
                    }

                    let doc = self.firestore.collection("usuarios").document(currentUser)
                    doc.updateData([
                        "image": urlString
                    ])
                }
            }
        }
        picker.dismiss(animated: true)
    }
}
