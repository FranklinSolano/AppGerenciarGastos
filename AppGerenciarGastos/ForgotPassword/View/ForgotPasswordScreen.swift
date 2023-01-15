//
//  ForgotPassword.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit

protocol ForgotPasswordScreenProtocol: AnyObject {
    func actionSendButton()
    
    func actionBackButton()
}

class ForgotPasswordScreen: UIView {
    
    weak var delegate: ForgotPasswordScreenProtocol?
    func delegate(delegate: ForgotPasswordScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var viewGreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2)
        view.clipsToBounds = true
        view.layer.cornerRadius = 27
        return view
    }()
    
    lazy var imageMoney: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "img")
        return image
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Informe seu email abaixo!"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var forgotPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite seu email"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(tappedSendButton), for: .touchUpInside)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButon), for: .touchUpInside)
        return button
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configButtonEnable(false)
        configElementsViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedSendButton(){
        delegate?.actionSendButton()
    }
    
    @objc func tappedBackButon(){
        delegate?.actionBackButton()
    }
 
    func configElementsViews(){
        addSubview(viewGreen)
        addSubview(informationLabel)
        addSubview(forgotPasswordTextField)
        addSubview(sendButton)
        addSubview(backButton)
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        forgotPasswordTextField.delegate = delegate
    }
    
    private func configButtonEnable(_ enable:Bool){
        
        if enable{
            self.sendButton.setTitleColor(.white, for: .normal)
            self.sendButton.isEnabled = true
        }else{
            self.sendButton.setTitleColor(.lightGray, for: .normal)
            self.sendButton.isEnabled = false
        }
    }
    
    public func validaTextField(){
        
        let forgotPasswword: String = forgotPasswordTextField.text ?? ""
        
        if !forgotPasswword.isEmpty  {
            self.configButtonEnable(true)
        }else{
            self.configButtonEnable(false)
        }
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            viewGreen.topAnchor.constraint(equalTo: topAnchor),
            viewGreen.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewGreen.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewGreen.heightAnchor.constraint(equalToConstant: 270),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
    
            informationLabel.topAnchor.constraint(equalTo: viewGreen.bottomAnchor,constant: -25),
            informationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            forgotPasswordTextField.topAnchor.constraint(equalTo: viewGreen.bottomAnchor,constant: 30),
            forgotPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            forgotPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
            sendButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            sendButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}


