//
//  LoginVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    var screen: LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.screen = LoginScreen()
        self.view = self.screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        auth = Auth.auth()
        alert = Alert(controller: self)
        screen?.configTextFieldDelegate(delegate: self)
        screen?.delegate(delegate: self)
        screen?.passwordTextField.setBottomBorder()
        screen?.userTextField.setBottomBorder()
    }
}

extension LoginVC: LoginScreenProtocol{
    
    func tappedButtonHelp() {
        let vc:ForgotPasswordVC = ForgotPasswordVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tappedButtonEnter() {
        
        let email: String = screen?.userTextField.text ?? ""
        let password: String = screen?.passwordTextField.text ?? ""
        
        auth?.signIn(withEmail: email, password: password, completion: { [weak self] usuario, error  in
            if error != nil{
                self?.alert?.getAlert(titulo: "Atenção", mensagem: "Dados incorretos, tenta novamete!")
            } else {
                if usuario == nil {
                    self?.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado")
                } else {
                    let vc:HomeVC = HomeVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        })
    }
    
    func tappedButtonRegister() {
        let vc:RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

extension LoginVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

