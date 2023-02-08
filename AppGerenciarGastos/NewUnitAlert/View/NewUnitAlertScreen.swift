//
//  NemUnitAlertScreen.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/14/23.
//

import UIKit



protocol NewUnitAlertScreenProtocol: AnyObject{
    func actionGerenteCheckBox()
    func actionAjudanteCheckBox()
    func actionCancelButton()
    func actionCreatButton()
}

class NewUnitAlertScreen: UIView {
    
    weak var delegate: NewUnitAlertScreenProtocol?
    func delegate(delegate: NewUnitAlertScreenProtocol){
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
    
    lazy var newUnitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Criar Novo Unidade"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    lazy var nameUnitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NOME DA UNIDADE"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    lazy var nameUnitTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Digite sua Unidade"
        tf.backgroundColor = .white
        return tf
    }()
    
    lazy var activityAreaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AREA DE ATIVIDADE"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    lazy var optionTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.borderStyle = .none
        tf.keyboardType = .default
        tf.placeholder = "Agricultura"
        tf.backgroundColor = .white
        tf.text = "teste"
        return tf
    }()
    
    lazy var addCollaboratorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "DESEJA ADICIONAR UM COLABORADOR?"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var addSearch: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.placeholder = "Usuário do colaborador"
        search.searchBarStyle = .minimal
        return search
    }()
    
    lazy var officeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "QUAL O CARGO DO COLABPRADOR?"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var checkBoxGerenteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(tappedGerenteCheckBox), for: .touchUpInside)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.init(red: 104/255, green: 215/255, blue: 147/255, alpha: 1).cgColor
        return button
    }()
    
    lazy var checkBoxGerenteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Gerente"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var checkBoxAjudanteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(tappedAjudanteCheckBox), for: .touchUpInside)
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.init(red: 104/255, green: 215/255, blue: 147/255, alpha: 1).cgColor
        return button
    }()
    
    lazy var checkBoxAjudanteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ajudante"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
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
        configElementsViews()
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
    
    @objc func tappedAjudanteCheckBox(){
        delegate?.actionAjudanteCheckBox()
    }
    
    @objc func tappedGerenteCheckBox(){
        delegate?.actionGerenteCheckBox()
    }
    
    func configElementsViews(){
        addSubview(backgroudView)
        backgroudView.addSubview(headerView)
        headerView.addSubview(newUnitLabel)
        backgroudView.addSubview(nameUnitLabel)
        backgroudView.addSubview(nameUnitTextField)
        backgroudView.addSubview(activityAreaLabel)
        backgroudView.addSubview(optionTextField)
        backgroudView.addSubview(addCollaboratorLabel)
        backgroudView.addSubview(addSearch)
        backgroudView.addSubview(officeLabel)
        backgroudView.addSubview(checkBoxGerenteButton)
        backgroudView.addSubview(checkBoxGerenteLabel)
        backgroudView.addSubview(checkBoxAjudanteButton)
        backgroudView.addSubview(checkBoxAjudanteLabel)
        backgroudView.addSubview(cancelButton)
        backgroudView.addSubview(creatButton)
    }
    
    func configConstraints(){
        NSLayoutConstraint.activate([
            
            backgroudView.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroudView.centerYAnchor.constraint(equalTo: centerYAnchor),
            backgroudView.heightAnchor.constraint(equalToConstant: 400),
            backgroudView.widthAnchor.constraint(equalToConstant: 300),
            
            headerView.topAnchor.constraint(equalTo: backgroudView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),
            
            newUnitLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            newUnitLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor,constant: 27),
            
            nameUnitLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor,constant: 15),
            nameUnitLabel.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor,constant: 25),
            
            nameUnitTextField.topAnchor.constraint(equalTo: nameUnitLabel.bottomAnchor,constant: 5),
            nameUnitTextField.leadingAnchor.constraint(equalTo: nameUnitLabel.leadingAnchor),
            nameUnitTextField.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor,constant: -25),
            
            activityAreaLabel.topAnchor.constraint(equalTo: nameUnitTextField.bottomAnchor,constant: 15),
            activityAreaLabel.leadingAnchor.constraint(equalTo: nameUnitLabel.leadingAnchor),
            
            optionTextField.topAnchor.constraint(equalTo: activityAreaLabel.bottomAnchor,constant: 5),
            optionTextField.leadingAnchor.constraint(equalTo: nameUnitLabel.leadingAnchor),
            optionTextField.trailingAnchor.constraint(equalTo: nameUnitTextField.trailingAnchor),
            
            addCollaboratorLabel.topAnchor.constraint(equalTo: optionTextField.bottomAnchor,constant: 15),
            addCollaboratorLabel.leadingAnchor.constraint(equalTo: nameUnitLabel.leadingAnchor),
            addCollaboratorLabel.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor,constant: 5),
            
            addSearch.topAnchor.constraint(equalTo: addCollaboratorLabel.bottomAnchor,constant: 5),
            addSearch.leadingAnchor.constraint(equalTo: nameUnitTextField.leadingAnchor),
            addSearch.trailingAnchor.constraint(equalTo: nameUnitTextField.trailingAnchor),
            
            officeLabel.topAnchor.constraint(equalTo: addSearch.bottomAnchor,constant: 12),
            officeLabel.leadingAnchor.constraint(equalTo: nameUnitLabel.leadingAnchor),
            officeLabel.trailingAnchor.constraint(equalTo: nameUnitLabel.trailingAnchor),
            
            checkBoxGerenteButton.topAnchor.constraint(equalTo: officeLabel.bottomAnchor,constant: 12),
            checkBoxGerenteButton.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor,constant: 30),
            checkBoxGerenteButton.heightAnchor.constraint(equalToConstant: 13),
            checkBoxGerenteButton.widthAnchor.constraint(equalToConstant: 13),
            
            checkBoxGerenteLabel.centerYAnchor.constraint(equalTo: checkBoxGerenteButton.centerYAnchor),
            checkBoxGerenteLabel.leadingAnchor.constraint(equalTo: checkBoxGerenteButton.trailingAnchor, constant: 5),
            
            checkBoxAjudanteLabel.centerYAnchor.constraint(equalTo: checkBoxGerenteButton.centerYAnchor),
            checkBoxAjudanteLabel.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor,constant: -35),
            
            checkBoxAjudanteButton.topAnchor.constraint(equalTo: officeLabel.bottomAnchor,constant: 12),
            checkBoxAjudanteButton.trailingAnchor.constraint(equalTo: checkBoxAjudanteLabel.leadingAnchor,constant: -5),
            checkBoxAjudanteButton.heightAnchor.constraint(equalToConstant: 13),
            checkBoxAjudanteButton.widthAnchor.constraint(equalToConstant: 13),
            
            cancelButton.topAnchor.constraint(equalTo: checkBoxGerenteLabel.bottomAnchor,constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: backgroudView.leadingAnchor,constant: 25),
            cancelButton.widthAnchor.constraint(equalToConstant: 130),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            creatButton.topAnchor.constraint(equalTo: checkBoxAjudanteLabel.bottomAnchor,constant: 20),
            creatButton.trailingAnchor.constraint(equalTo: backgroudView.trailingAnchor,constant: -25),
            creatButton.widthAnchor.constraint(equalToConstant: 130),
            creatButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

