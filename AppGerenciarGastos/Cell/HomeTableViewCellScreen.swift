//
//  HomeTableViewCellScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit

class HomeTableViewCellScreen: UIView {
    
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionar"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Unidade"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "")
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray.withAlphaComponent(0.6)
        addSubview(descriptionLabel)
        addSubview(subtitleLabel)
        addSubview(image)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            
            subtitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15)
            
            
            
            
            
        ])
    }
    
}
