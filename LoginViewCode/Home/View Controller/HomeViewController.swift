//
//  HomeViewController.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 25/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeScreen: HomeScreen?
    var data:[DataUser] = [DataUser(name: "Gabriel", nameImage: "menino01"),
                           DataUser(name: "Caio", nameImage: "menino02"),
                           DataUser(name: "Bruna", nameImage: "menina01")
    ]
    
    override func loadView(){
        self.homeScreen = HomeScreen()
        self.view = self.homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeNavigationBar()
        self.homeScreen?.configTableViewDelegate(delegate: self, dataSource: self)
    }
        
    public func customizeNavigationBar() {
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.data[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
