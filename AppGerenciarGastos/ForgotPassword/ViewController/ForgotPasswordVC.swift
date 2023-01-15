//
//  ForgotPasswordScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit
import FirebaseAuth

class ForgotPasswordVC: UIViewController {
    
    var screen: ForgotPasswordScreen?
    var auth: Auth?
    var alert : Alert?
     
    override func loadView() {
        screen = ForgotPasswordScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alert = Alert(controller: self)
        auth = Auth.auth()
        screen?.delegate(delegate: self)
        screen?.configTextFieldDelegate(delegate: self)
        screen?.forgotPasswordTextField.setBottomBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension ForgotPasswordVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        screen?.validaTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ForgotPasswordVC: ForgotPasswordScreenProtocol{
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }

    func actionSendButton() {
        let email:String = screen?.forgotPasswordTextField.text ?? ""
        self.auth?.sendPasswordReset(withEmail: email)
        self.alert?.getAlert(titulo: "Atenção", mensagem: "Email enviado para resetar a senha!",completion: {
            self.navigationController?.popViewController(animated: true)
        })
    }
}
