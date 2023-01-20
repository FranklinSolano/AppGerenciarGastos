//
//  HomeTableViewCell.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .green
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionar"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
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
    
   
    
    
    static let identifier: String = "HomeTableViewCell"
    
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configElementsView()
        configConstraints()
        contentView.backgroundColor = .white
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configElementsView(){
        contentView.addSubview(image)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(subtitleLabel)
      
    }
    
    func setupCell(data: Data){
        descriptionLabel.text = data.description
        subtitleLabel.text = data.subTitle
        image.image = data.image
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func configConstraints(){
        NSLayoutConstraint.activate([
     
        
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            image.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: image.topAnchor,constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor,constant: 15),
            
            subtitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 5),
            subtitleLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            
            
        ])
    }


}
