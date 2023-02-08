//
//  ProductionsScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/19/23.
//

import UIKit

protocol ProductionsScreenProtocol: AnyObject {
    func actionButtonSettings()
    func actoinbackButton()
}

class ProductionsScreen: UIView {
    
    weak var delegate: ProductionsScreenProtocol?
    func delegate(delegate: ProductionsScreenProtocol){
        self.delegate = delegate
    }
    
    lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "text.alignleft"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(tappedSettingsButton), for: .touchUpInside)
        return button
    }()
    
    lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Produções"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 33, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier:HomeTableViewCell.identifier)
        return tableView
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedSettingsButton(){
        delegate?.actionButtonSettings()
    }
    
    @objc func tappedBackButton(){
        delegate?.actoinbackButton()
    }
    
    func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
   
    
    func configElements(){
        addSubview(settingsButton)
        addSubview(informationLabel)
        addSubview(tableView)
        addSubview(backButton)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            settingsButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            settingsButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            
            informationLabel.topAnchor.constraint(equalTo: settingsButton.bottomAnchor,constant: 25),
            informationLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            informationLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            
            tableView.topAnchor.constraint(equalTo: informationLabel.bottomAnchor,constant: 12),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
 
        ])
    }
    
}
