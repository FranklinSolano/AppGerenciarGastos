//
//  HomeVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var data: [Data] = [Data(description: "Adicionar", subTitle: "Novo Elemento", image: UIImage(named: "test"))]

    override func loadView() {
        screen = HomeScreen()
        screen?.configTableView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeVC: HomeScreenProtocol {
    func actionSettingsButton() {
        let vc:SettingsVC = SettingsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
        cell?.setupCell(data: data[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:NewUnitAlertVC = NewUnitAlertVC()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
    }
}
 

