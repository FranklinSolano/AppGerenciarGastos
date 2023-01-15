//
//  Extension-TextField.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/15/23.
//

import UIKit

extension UITextField {
    // MARK: deixar a borda no textField
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
