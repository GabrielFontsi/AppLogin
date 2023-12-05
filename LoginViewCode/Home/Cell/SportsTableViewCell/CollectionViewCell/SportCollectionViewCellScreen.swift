//
//  SportCollectionViewCellScreen.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 04/12/23.
//

import UIKit

class SportCollectionViewCellScreen: UIView {

    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview(){
        self.addSubview(self.viewBackground)
    }
    
    func configContraints(){
        NSLayoutConstraint.activate([
            self.viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackground.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.viewBackground.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
