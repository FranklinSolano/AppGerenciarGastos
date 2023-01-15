//
//  ProfileVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/14/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    var screen: ProfileScreen?
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
    


}
extension ProfileVC: ProfileScreenProtocol {
    func actionBackButton() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func actionEditButton() {
        
    }
    
    
}
