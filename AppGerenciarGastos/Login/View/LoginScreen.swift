//
//  LoginScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//


import UIKit

protocol LoginScreenProtocol: AnyObject {
    func tappedButtonHelp()
    func tappedButtonEnter()
    func tappedButtonRegister()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol){
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
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 33))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        // MARK: risco embaixo do button 
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: button.frame.height - 1, width: button.frame.width, height: 2)
        bottomBorder.backgroundColor = UIColor.black.cgColor
        button.layer.addSublayer(bottomBorder)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Criar Conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(tappedButtonRegister), for: .touchUpInside)
        return button
    }()
    
    lazy var usuarioLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuários"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    lazy var userTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite seu email"
        tf.backgroundColor = .white
        tf.text = "franklin@gmail.com"
        return tf
    }()
    
    lazy var senhaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Senha"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.keyboardType = .default
        tf.placeholder = "Digite sua Senha:"
        tf.isSecureTextEntry = true
        tf.backgroundColor = .white
        tf.text = "12345678"
        return tf
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Perdeu sua senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(tappedButtonHelp), for: .touchUpInside)
        return button
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 26
        button.addTarget(self, action: #selector(tappedButtonEnter), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedButtonHelp(){
        delegate?.tappedButtonHelp()
    }
    
    @objc func tappedButtonEnter(){
        delegate?.tappedButtonEnter()
    }
    
    @objc func tappedButtonRegister(){
        delegate?.tappedButtonRegister()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configViews()
        configConstraints()
        configButtonEnable(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configViews(){
        addSubview(viewGreen)
        addSubview(imageMoney)
        addSubview(enterButton)
        addSubview(registerButton)
        addSubview(usuarioLabel)
        addSubview(userTextField)
        addSubview(senhaLabel)
        addSubview(passwordTextField)
        addSubview(helpButton)
        addSubview(goButton)
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate){
        userTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func configButtonEnable(_ enable:Bool){
        if enable{
            self.goButton.setTitleColor(.white, for: .normal)
            self.goButton.isEnabled = true
        }else{
            self.goButton.setTitleColor(.lightGray, for: .normal)
            self.goButton.isEnabled = false
        }
    }
    
    public func validaTextField(){
        
        let user: String = userTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
  
        if !user.isEmpty && !password.isEmpty {
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
            
            usuarioLabel.topAnchor.constraint(equalTo: viewGreen.bottomAnchor,constant: 60),
            usuarioLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            
            userTextField.topAnchor.constraint(equalTo: usuarioLabel.bottomAnchor,constant: 10),
            userTextField.leadingAnchor.constraint(equalTo: usuarioLabel.leadingAnchor),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            
            senhaLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor,constant: 30),
            senhaLabel.leadingAnchor.constraint(equalTo: usuarioLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: senhaLabel.bottomAnchor,constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: usuarioLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: userTextField.trailingAnchor),
            
            helpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 17),
            helpButton.leadingAnchor.constraint(equalTo: usuarioLabel.leadingAnchor),
            
            goButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
            goButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 40),
            goButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            goButton.heightAnchor.constraint(equalToConstant: 60),
            goButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
}





