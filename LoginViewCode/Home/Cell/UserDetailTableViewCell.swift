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
    
    lazy var userImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuneIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuneIdentifier)
        self.addSubview()
        //self.setUpConstraits()
        configUserImageViewConstrainsts()
        configNameLabelViewConstrainsts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        self.contentView.addSubview(self.userImageView)
        self.contentView.addSubview(self.nameLabel)
    }
    
    public func setUpCell(data: DataUser) {
        self.nameLabel.text = data.name
        self.userImageView.image = UIImage(named: data.nameImage)
    }

    private func setUpConstraits(){
        NSLayoutConstraint.activate([
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.heightAnchor.constraint(equalToConstant: 80),
            self.userImageView.widthAnchor.constraint(equalToConstant: 80),
            
            self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20),
        ])
    }
    
    func configUserImageViewConstrainsts(){
        self.userImageView.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
    
    func configNameLabelViewConstrainsts(){
        self.nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
        }
    }

}
