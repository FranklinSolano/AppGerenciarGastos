//
//  NewUnitAlertVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/14/23.
//

import UIKit
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAuth

class NewUnitAlertVC: UIViewController {
    
    var screen: NewUnitAlertScreen?
    var checkBoxGerente = false
    var checkBoxAjudante = false
    var firestore: Firestore?
    var celulas: [DataFire] = []
    var currentUser = Auth.auth().currentUser
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func savedDadosDatabase(){
        //MARK: salvar dados no bancos de dados
        let nameUnit = screen?.nameUnitTextField.text ?? ""
        let newUnit = screen?.optionTextField.text ?? ""
        let db = Firestore.firestore()
        let data = ["nameUnit": nameUnit, "newUnit": newUnit]
        db.collection("dadosCel").addDocument(data: data) { (error) in
            if let error = error {
                print("Erro ao salvar dados")
            } else {
                NotificationCenter.default.post(name: .realoadTableView, object: nil)
                self.dismiss(animated: true)
            }
        }
    }
}

extension NewUnitAlertVC: NewUnitAlertScreenProtocol {
    
    func actionCreatButton() {
        savedDadosDatabase()
    }
    
    func actionCancelButton() {
        dismiss(animated: false)
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






