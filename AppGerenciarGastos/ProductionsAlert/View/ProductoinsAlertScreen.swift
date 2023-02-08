//
//  ProductoinsAlertScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 2/5/23.
//

import UIKit

protocol ProductoinsAlertScreenProtocol: AnyObject {
    func actionCancelButton()
    func actionCreatButton()
}

class ProductoinsAlertScreen: UIView {
    
    weak var delegate: ProductoinsAlertScreenProtocol?
    func delegate(delegate: ProductoinsAlertScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var backgroudView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
        return view
    }()
    
    lazy var CreatNewProductionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Criar Novo Produção"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CULTURA A SER PRODUZIDA"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var informationTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.text = "BANANA"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancelar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(tappedCancelButton), for: .touchUpInside)
        return button
    }()
    
    lazy var creatButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(tappedCreatButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.3)
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedCancelButton(){
        delegate?.actionCancelButton()
    }
    
    @objc func tappedCreatButton(){
        delegate?.actionCreatButton()
    }
    
    func configElements(){
        addSubview(backgroudView)
        backgroudView.addSubview(headerView)
        headerView.addSubview(CreatNewProductionsLabel)
        backgroudView.addSubview(informationLabel)
        backgroudView.addSubview(informationTextField)
        backgroudView.addSubview(creatButton)
        backgroudView.addSubview(cancelButton)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            
            backgroudView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroudView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroudView.heightAnchor.constraint(equalToConstant: 250),
            backgroudView.widthAnchor.constraint(equalToConstant: 300),
            
            headerView.topAnchor.constraint(equalTo: backgroudView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 40),
            
            CreatNewProductionsLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            CreatNewProductionsLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            informationLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 20),
            informationLabel.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor,constant: 30),
            informationLabel.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor,constant: -30),
            
            informationTextField.topAnchor.constraint(equalTo: informationLabel.bottomAnchor,constant: 5),
            informationTextField.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            informationTextField.trailingAnchor.constraint(equalTo: informationLabel.trailingAnchor),
            
            cancelButton.topAnchor.constraint(equalTo: informationTextField.bottomAnchor,constant: 80),
            cancelButton.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor,constant: 25),
            cancelButton.widthAnchor.constraint(equalToConstant: 130),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            creatButton.topAnchor.constraint(equalTo: informationTextField.bottomAnchor,constant: 80),
            creatButton.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor,constant: -25),
            creatButton.widthAnchor.constraint(equalToConstant: 130),
            creatButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}
