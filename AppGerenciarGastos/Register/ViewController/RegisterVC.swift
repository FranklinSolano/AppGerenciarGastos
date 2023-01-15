//
//  RegisterVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
import FirebaseFirestore


class RegisterVC: UIViewController {
    
    var screen: RegisterScreen?
    var alert: Alert?
    var auth: Auth?
    var user = Auth.auth().currentUser
    var firestore: Firestore?
    
    override func loadView() {
        self.screen = RegisterScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        alert = Alert(controller: self)
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        configTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    func configTextField(){
        screen?.configTextFieldDelegate(delegate: self)
        screen?.fullNameTextField.setBottomBorder()
        screen?.emailTextField.setBottomBorder()
        screen?.userTextField.setBottomBorder()
        screen?.telephoneTextField.setBottomBorder()
        screen?.passwordTextField.setBottomBorder()
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func actionEnter() {
        self.navigationController?.popViewController(animated: false)
    }
    
    func actionRegister() {
        //        let _: String = screen?.fullNameTextField.text ?? ""
        let user: String = screen?.userTextField.text ?? ""
        let email: String = screen?.emailTextField.text ?? ""
        let telephone: String = screen?.telephoneTextField.text ?? ""
        let senha: String = screen?.passwordTextField.text ?? ""
        
        self.auth?.createUser(withEmail: email, password: senha, completion: { ( result, error) in
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao registrar, verifique os dados e tente novamente")
            } else {
                let name = result?.user.email ?? "no email"
                let emailFormatted = email.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-")
                let userRef = self.firestore?.collection("usuarios").document(emailFormatted)
                
                userRef?.getDocument { snapshot, error in
                    guard let snapshot else { return }
                    if !snapshot.exists {
                        userRef?.setData([
                            "nome": self.screen?.fullNameTextField.text ?? "user",
                            "email": self.screen?.emailTextField.text ?? "no email",
                            "User": self.screen?.userTextField.text ?? "",
                            "telephone": self.screen?.telephoneTextField.text ?? ""
                        ]) { error in
                            if error != nil {
                                print("Error writing document: (error.localizedDescription)")
                            } else {
                                print("User data successfully written to Firestore!")
                            }
                        }
                    }
                }
                self.alert?.getAlert(titulo: "Parabens", mensagem: "Usuario cadastrado com Sucesso!", completion: {
                    
                    DispatchQueue.global(qos: .userInitiated).async {
                        let database = Database.database().reference()
                        let data = ["name": name,
                                    "email": email,
                                    "user": user,
                                    "telephone": telephone]
                        let emailFormatted = email.replacingOccurrences(of: ".", with: "_").replacingOccurrences(of: "@", with: "_")
                        database.child("users").child(emailFormatted).setValue(data)
                    }
                    let vc: HomeVC = HomeVC()
                    self.navigationController?.pushViewController(vc, animated: true)
                })
            }
        })
    }
}

extension RegisterVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

