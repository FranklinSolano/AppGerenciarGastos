//
//  RegisterScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func actionEnter()
    func actionRegister()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    public func delegate(delegate: RegisterScreenProtocol) {
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
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedEnter), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 33))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        // MARK: risco embaixo do button
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: button.frame.height - 1, width: button.frame.width, height: 2)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        button.layer.addSublayer(bottomBorder)
        return button
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Forneça as informações abaixo:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome Completo"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var fullNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite seu nome"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite seu email"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite o nome do Usuário"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var telephoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Telefone"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var telephoneTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite seu telefone ou celular"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha:"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.placeholder = "Digite sua senha"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.borderStyle = .none
        return tf
    }()
    
    lazy var registerButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(tappedRegister), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configAddElements()
        configConstraints()
        configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedEnter(){
        delegate?.actionEnter()
    }
    
    @objc func tappedRegister(){
        delegate?.actionRegister()
    }
    
    func configAddElements(){
        addSubview(viewGreen)
        addSubview(imageMoney)
        addSubview(enterButton)
        addSubview(registerButton)
        addSubview(informationLabel)
        addSubview(fullNameLabel)
        addSubview(fullNameTextField)
        addSubview(emailLabel)
        addSubview(emailTextField)
        addSubview(userLabel)
        addSubview(userTextField)
        addSubview(telephoneLabel)
        addSubview(telephoneTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(registerButton2)
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        fullNameTextField.delegate = delegate
        emailTextField.delegate = delegate
        userTextField.delegate = delegate
        telephoneTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func configButtonEnable(_ enable:Bool){
        if enable{
            self.registerButton2.setTitleColor(.white, for: .normal)
            self.registerButton2.isEnabled = true
        }else{
            self.registerButton2.setTitleColor(.lightGray, for: .normal)
            self.registerButton2.isEnabled = false
        }
    }
    
    public func validaTextField(){
        
        let name: String = fullNameTextField.text ?? ""
        let email: String = emailTextField.text ?? ""
        let user: String = userTextField.text ?? ""
        let telephone: String = telephoneTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !name.isEmpty && !email.isEmpty && !user.isEmpty && !telephone.isEmpty && !password.isEmpty {
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
            
            imageMoney.topAnchor.constraint(equalTo: viewGreen.topAnchor),
            imageMoney.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageMoney.heightAnchor.constraint(equalToConstant: 200),
            imageMoney.widthAnchor.constraint(equalToConstant: 200),
            
            enterButton.bottomAnchor.constraint(equalTo: viewGreen.bottomAnchor),
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 70),
            enterButton.widthAnchor.constraint(equalToConstant: 100),
            
            registerButton.bottomAnchor.constraint(equalTo: viewGreen.bottomAnchor),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -70),
            registerButton.widthAnchor.constraint(equalToConstant: 120),
            
            informationLabel.topAnchor.constraint(equalTo: viewGreen.bottomAnchor,constant: 17),
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            
            fullNameLabel.topAnchor.constraint(equalTo: informationLabel.bottomAnchor,constant: 14),
            fullNameLabel.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            
            fullNameTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor,constant: 8),
            fullNameTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            fullNameTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            
            emailLabel.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor,constant: 14),
            emailLabel.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            
            userLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 14),
            userLabel.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor,constant: 8),
            userTextField.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            userTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            
            telephoneLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor,constant: 14),
            telephoneLabel.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            
            telephoneTextField.topAnchor.constraint(equalTo: telephoneLabel.bottomAnchor,constant: 8),
            telephoneTextField.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            telephoneTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: telephoneTextField.bottomAnchor,constant: 14),
            passwordLabel.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: informationLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: fullNameTextField.trailingAnchor),
            
            registerButton2.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
            registerButton2.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            registerButton2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            registerButton2.heightAnchor.constraint(equalToConstant: 60),
            registerButton2.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}




