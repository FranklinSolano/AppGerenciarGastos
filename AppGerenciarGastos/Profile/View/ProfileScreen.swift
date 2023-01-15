//
//  ProfileScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/14/23.
//

import UIKit

protocol ProfileScreenProtocol: AnyObject {
    func actionBackButton()
    func actionEditButton()
}

class ProfileScreen: UIView {
    
    weak var delegate: ProfileScreenProtocol?
    func delegate(delegate: ProfileScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var myProfileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Meu Perfil"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()

    lazy var imageProfile: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "profileImage")
        image.clipsToBounds = true
        return image
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("editar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.setTitleColor(UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1) , for: .normal)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedEditButton), for: .touchUpInside)
        return button
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Franklin Solano"
        label.textColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "franklin@gmail.com"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configElementsViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    @objc func tappedEditButton(){
        delegate?.actionEditButton()
    }
    
    func configElementsViews(){
        addSubview(backButton)
        addSubview(myProfileLabel)
        addSubview(imageProfile)
        addSubview(editButton)
        addSubview(userLabel)
        addSubview(emailLabel)
    }

    func configConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            
            myProfileLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 35),
            myProfileLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            
            imageProfile.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor,constant: 30),
            imageProfile.leadingAnchor.constraint(equalTo: myProfileLabel.leadingAnchor),
            imageProfile.heightAnchor.constraint(equalToConstant: 150),
            imageProfile.widthAnchor.constraint(equalToConstant: 150),
            
            editButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor,constant: 15),
            editButton.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor),
            
            userLabel.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor,constant: 50),
            userLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            emailLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor,constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: userLabel.trailingAnchor),
        ])
    }
}
