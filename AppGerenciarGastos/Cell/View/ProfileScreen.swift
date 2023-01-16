//
//  ProfileScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/15/23.
//

import UIKit

protocol ProfileScreenProtocol: AnyObject{
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
        image.layer.cornerRadius = 70
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Franklin Solano"
        label.textColor = UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2)
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "franklin@"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Editar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor(red: 104/255, green: 215/255, blue: 147/255, alpha: 2), for: .normal)
        button.addTarget(self, action: #selector(tappedEditButton), for: .touchUpInside)
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configElementsView()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedEditButton(){
        delegate?.actionEditButton()
    }
    
    @objc func tappedBackButton(){
        delegate?.actionBackButton()
    }
    
    func configElementsView(){
        addSubview(backButton)
        addSubview(myProfileLabel)
        addSubview(imageProfile)
        addSubview(editButton)
        addSubview(nameLabel)
        addSubview(emailLabel)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
            backButton.heightAnchor.constraint(equalToConstant: 25),
            backButton.widthAnchor.constraint(equalToConstant: 25),

            myProfileLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor,constant: 30),
            myProfileLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            
            imageProfile.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor,constant: 25),
            imageProfile.leadingAnchor.constraint(equalTo: myProfileLabel.leadingAnchor),
            imageProfile.heightAnchor.constraint(equalToConstant: 150),
            imageProfile.widthAnchor.constraint(equalToConstant: 150),
            
            editButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor,constant: 15),
            editButton.centerXAnchor.constraint(equalTo: imageProfile.centerXAnchor),
        
            nameLabel.topAnchor.constraint(equalTo: myProfileLabel.bottomAnchor,constant: 55),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            
            
            
        ])
    }
    
}








