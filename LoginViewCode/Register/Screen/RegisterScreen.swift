//
//  RegisterScreen.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 20/11/23.
//

import UIKit

protocol RegisterScreenProtocol: class {
    func actionRegisterButton()
}

class RegisterScreen: UIView {
    
    weak private var delegate: RegisterScreenProtocol?
    
    func delegate(delegate: RegisterScreenProtocol?){
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrowshape.backward"), for: .normal)
        return button
    }()
    
    lazy var imageAddUser: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.circle.fill")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
       let textField = UITextField()
       textField.translatesAutoresizingMaskIntoConstraints = false
       textField.autocorrectionType = .no
       textField.backgroundColor = .white
       textField.borderStyle = .roundedRect
       textField.keyboardType = .emailAddress
       textField.placeholder = "Digite seu Email:"
       textField.textColor = .darkGray
       return textField
   }()
    
    lazy var passwordTextField: UITextField = {
       let textField = UITextField()
       textField.translatesAutoresizingMaskIntoConstraints = false
       textField.autocorrectionType = .no
       textField.backgroundColor = .white
       textField.borderStyle = .roundedRect
       textField.keyboardType = .default
       textField.isSecureTextEntry = true
       textField.placeholder = "Digite sua senha:"
       textField.textColor = .darkGray
       return textField
   }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        
        configimageAddUserConstrait()
        configEmailTextFieldConstrait()
        configPasswordTextFieldConstrait()
        configRegisterButtonConstrait()
        
        //setContraints()
        configButtonEnable(false)
    }
    
    private func configBackground(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    @objc private func tappedRegisterButton(){
        self.delegate?.actionRegisterButton()
    }
    
    public func validTextField(){
        let email: String = self.emailTextField.text ?? ""
        let password: String = self.passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            self.configButtonEnable(true)
        } else {
            self.configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool){
        if enable {
            self.registerButton.setTitleColor(.white, for: .normal)
            self.registerButton.isEnabled = true
        }else {
            self.registerButton.setTitleColor(.lightGray, for: .normal)
            self.registerButton.isEnabled = false
        }
    }
    
    public func getEmail()-> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword()-> String {
        return self.emailTextField.text ?? ""
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSuperView(){
        self.addSubview(backButton)
        self.addSubview(imageAddUser)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }
    
    private func setContraints(){
        NSLayoutConstraint.activate([
//            imageAddUser.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            imageAddUser.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            imageAddUser.widthAnchor.constraint(equalToConstant: 100),
//            imageAddUser.heightAnchor.constraint(equalToConstant: 100),
            
//            emailTextField.topAnchor.constraint(equalTo: imageAddUser.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 45),
//
//            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 18),
//            passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
//
//            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
//            registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor)
        ])
    }
    
    func configimageAddUserConstrait(){
        self.imageAddUser.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
    }
    
    func configEmailTextFieldConstrait(){
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(imageAddUser.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
    }
    
    func configPasswordTextFieldConstrait(){
        self.passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(18)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstrait(){
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(32)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
}
