//
//  SettingsScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit

protocol SettingsScreenProtocol: AnyObject{
    func  actionProfile()
    func actionPrivate()
    func actionHelp()
    func actoinTips()
    func actionLogout()
    func actionBackButton()
}

class SettingsScreen: UIView {
    
    weak var delegate: SettingsScreenProtocol?
    func delegate(delegate: SettingsScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Perfil", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedProfileButton), for: .touchUpInside)
        return button
    }()
    
    lazy var privationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Politica de \nPrivacida", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "text.insert"), for: .normal)
        button.tintColor = .white
        button.subtitleLabel?.numberOfLines = 0
        // MARK: Quebrar linha de um title do botao
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.addTarget(self, action: #selector(tappedPrivationButton), for: .touchUpInside)
        return button
    }()
    
    lazy var helpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ajuda e \nSuporte", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.subtitleLabel?.numberOfLines = 0
        // MARK: Quebrar linha de um title do botao
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.addTarget(self, action: #selector(tappedHelpButton), for: .touchUpInside)
        return button
    }()
    
    lazy var tipsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dicas de \nEconomia", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.subtitleLabel?.numberOfLines = 0
        // MARK: Quebrar linha de um title do botao
        button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        button.addTarget(self, action: #selector(tappedHelpButton), for: .touchUpInside)
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sair da Conta", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = .white
        button.semanticContentAttribute = .forceRightToLeft
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2)
        configElementsViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    @objc func tappedProfileButton(){
        delegate?.actionProfile()
    }
    
    @objc func tappedPrivationButton(){
        delegate?.actionPrivate()
    }
    
    @objc func tappedHelpButton(){
        delegate?.actionHelp()
    }
    
    @objc func tappedTipsButton(){
        delegate?.actoinTips()
    }
    
    @objc func tappedLogoutButton(){
        delegate?.actionLogout()
    }
    
    func configElementsViews(){
        addSubview(profileButton)
        addSubview(privationButton)
        addSubview(helpButton)
        addSubview(tipsButton)
        addSubview(logoutButton)
        addSubview(backButton)
    }

    func configConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25),
            
            profileButton.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 30),
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            profileButton.widthAnchor.constraint(equalToConstant: 110),
            profileButton.heightAnchor.constraint(equalToConstant: 45),
            
            privationButton.topAnchor.constraint(equalTo: profileButton.bottomAnchor,constant: 25),
            privationButton.leadingAnchor.constraint(equalTo: profileButton.leadingAnchor),
            privationButton.widthAnchor.constraint(equalToConstant: 110),
            privationButton.heightAnchor.constraint(equalToConstant: 45),
            
            helpButton.topAnchor.constraint(equalTo: privationButton.bottomAnchor,constant: 25),
            helpButton.leadingAnchor.constraint(equalTo: privationButton.leadingAnchor),
            helpButton.widthAnchor.constraint(equalToConstant: 110),
            helpButton.heightAnchor.constraint(equalToConstant: 45),
            
            tipsButton.topAnchor.constraint(equalTo: helpButton.bottomAnchor,constant: 25),
            tipsButton.leadingAnchor.constraint(equalTo: helpButton.leadingAnchor),
            tipsButton.widthAnchor.constraint(equalToConstant: 110),
            tipsButton.heightAnchor.constraint(equalToConstant: 45),
            
            logoutButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -40),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            logoutButton.widthAnchor.constraint(equalToConstant: 130),
            logoutButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
}
