//
//  ProductionsVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/19/23.
//

import UIKit

class ProductionsVC: UIViewController {
    
    
    var screen: ProductionsScreen?
    var data: [Data] = [Data(description: "Planto de", subTitle: "Tomate", image: UIImage(named: "tomate"))]
    
    override func loadView() {
        screen = ProductionsScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.configTableView(delegate: self, dataSource: self)
    }
}

extension ProductionsVC: ProductionsScreenProtocol {
    func actionButtonSettings() {
        let vc:SettingsVC = SettingsVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func actoinbackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductionsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell: HomeTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell
            cell?.setupCell(data: data[indexPath.section])
            return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: ProductionsAlertVC = ProductionsAlertVC()
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.section)
        tableView.reloadData()
    }
}
