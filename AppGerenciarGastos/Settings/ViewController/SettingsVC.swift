//
//  SettingsVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit
import FirebaseAuth

class SettingsVC: UIViewController {
    
    var screen: SettingsScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        screen = SettingsScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        auth = Auth.auth()
        alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension SettingsVC: SettingsScreenProtocol {
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionProfile() {
        let vc:ProfileVC = ProfileVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionPrivate() {
        
    }
    
    func actionHelp() {
        
    }
    
    func actoinTips() {
        
    }
    
    func actionLogout() {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            let defauts = UserDefaults.standard
            defauts.set(false, forKey: "isUserSignedIn ")
            self.dismiss(animated: true,completion: nil)
        } catch {
            alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao Sair")
        }
        let vc:LoginVC = LoginVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
