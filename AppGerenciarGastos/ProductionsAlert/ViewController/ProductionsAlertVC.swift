//
//  ProductionsAlertVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 2/5/23.
//

import UIKit

class ProductionsAlertVC: UIViewController {
    
    var screen: ProductoinsAlertScreen?
    
    override func loadView() {
        screen = ProductoinsAlertScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.informationTextField.setBottomBorder()
        screen?.delegate(delegate: self)

    }
}

extension ProductionsAlertVC: ProductoinsAlertScreenProtocol {
    func actionCreatButton() {
        
    }
    
    func actionCancelButton() {
        dismiss(animated: false)
    }
    
    
}
