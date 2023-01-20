//
//  HomeVC.swift
//  AppGerenciarGastos
//
//  Created by Franklin  Stilhano on 1/13/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseDatabase

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    var data: [Data] = [Data(description: "Adicionar", subTitle: "Novo Elemento", image: UIImage(named: "test"))]
    var firestore = Firestore.firestore()
    var currentUser = Auth.auth().currentUser
    
    override func loadView() {
        screen = HomeScreen()
        screen?.configTableView(delegate: self, dataSource: self)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        configObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.navigationController?.isNavigationBarHidden = true
        getUserData()
    }
    
    func getUserData(){
        firestore.collection("dadosCel").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot {
                    DispatchQueue.main.async {
                        self.data = snapshot.documents.map({ document in
                            return Data(description: document["nameUnit"] as? String ?? "", subTitle: document["newUnit"] as? String ?? "")
                        })
                        self.populateView(index: self.getIndex(email: self.currentUser?.email ?? ""))
                        print(self.data)
                        
                        self.screen?.tableView.reloadData()
                    }
                }
            } else {
                print(error)
            }
        }
    }
    
    func populateView(index: Int){
        data[index].description
        data[index].subTitle
    }
    
    func getIndex(email: String) -> Int {
        let index = data.firstIndex { $0.description == email } ?? 0
        return index
    }
    
    func configObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(realoadTableView), name: .realoadTableView, object: nil)
    }
    
    @objc func realoadTableView(){
        getUserData()
    }
}

extension HomeVC: HomeScreenProtocol {
    func actionSettingsButton() {
        let vc:SettingsVC = SettingsVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
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
        if indexPath.section == 0 {
            let vc:NewUnitAlertVC = NewUnitAlertVC()
            vc.modalPresentationStyle = .overCurrentContext
            present(vc, animated: true)
        } else {
//            let vc:ProductionsVC = ProductionsVC()
//            self.navigationController?.pushViewController(vc, animated: false)
            print("teste")
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.section)
        let userId = Auth.auth().currentUser?.uid
        let ref = Database.database().reference().child("dadosCel").child("\(userId ?? "")")
        ref.removeValue()
        
        tableView.reloadData()
    }
}


