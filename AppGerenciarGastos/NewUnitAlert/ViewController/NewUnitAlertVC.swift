//
//  NewUnitAlertVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/14/23.
//

import UIKit

class NewUnitAlertVC: UIViewController {
    
    var screen: NewUnitAlertScreen?
    var checkBoxGerente = false
    var checkBoxAjudante = false
    
    override func loadView() {
        screen = NewUnitAlertScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.nameUnitTextField.setBottomBorder()
        screen?.optionTextField.setBottomBorder()
        
    }
    
    
    
}
extension NewUnitAlertVC: NewUnitAlertScreenProtocol {
    func actionCancelButton() {

        dismiss(animated: false)

    }
    
    func actionCreatButton() {
      
    }
    
    func actionAjudanteCheckBox() {
        if (checkBoxAjudante == false){
            screen?.checkBoxAjudanteButton.setBackgroundImage(UIImage(systemName: "square.fill"), for: .normal)
            screen?.checkBoxAjudanteButton.tintColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2)
            checkBoxAjudante = true
        } else {
            screen?.checkBoxAjudanteButton.setBackgroundImage(UIImage(systemName: ""), for: .normal)
            checkBoxAjudante = false
        }
    }
    
    func actionGerenteCheckBox() {
        if (checkBoxGerente == false){
            screen?.checkBoxGerenteButton.setBackgroundImage(UIImage(systemName: "square.fill"), for: .normal)
            screen?.checkBoxGerenteButton.tintColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2)
            checkBoxGerente = true
        } else {
            screen?.checkBoxGerenteButton.setBackgroundImage(UIImage(systemName: ""), for: .normal)
            checkBoxGerente = false
        }
    }
}






