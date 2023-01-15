//
//  Alert.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import Foundation
import UIKit

class Alert:NSObject{
    
    enum TypeImageSelected{
        case camera
        case library
        case cancel
    }
    
    var controller:UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    
    func getAlert(titulo:String,mensagem:String,completion:(() -> Void)? = nil){
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Ok", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true, completion: nil)
    }
    
    func alertEditPhoto(completion: @escaping (_ option: TypeImageSelected) -> Void){

        let alertController: UIAlertController = UIAlertController(title: "Select one of the options below", message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { action in
            completion(.camera)
        }
        
        let library = UIAlertAction(title: "Library", style: .default) { action in
            completion(.library)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
            completion(.cancel)
            
        }
        
        
        alertController.addAction(camera)
        alertController.addAction(library)
        alertController.addAction(cancel)
        controller.present(alertController, animated: true)
        
        
    }
}
