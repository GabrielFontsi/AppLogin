//
//  UserDetailTableViewCell.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 27/11/23.
//

import UIKit
import SnapKit

class UserDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuneIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuneIdentifier)
        self.addSubview()
        configConstrainstsDescriptionCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        self.contentView.addSubview(self.userDetailView)
    }
    
    public func setUpCell(data: DataUser) {
        self.userDetailView.nameLabel.text = data.name
        self.userDetailView .userImageView.image = UIImage(named: data.nameImage)
    }
    
    private func configConstrainstsDescriptionCell(){
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
