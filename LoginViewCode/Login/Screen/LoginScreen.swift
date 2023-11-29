//
//  LoginScreen.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 19/11/23.
//

import UIKit

protocol LoginScreenProtocol:class{
    func actionLoginButton()
    func actionRegisterButton()
}

class LoginScreen: UIView {
    
    weak var delegate: LoginScreenProtocol?
    
    func delegate(delegate:LoginScreenProtocol?){
        self.delegate = delegate
    }

    lazy var loginlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Login App"
        return label
    }()
    
     lazy var logoAppImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
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
    
     lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        button.addTarget(self, action: #selector(self.tappedLoginButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta ? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(self.tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configBackground()
        configSuperView()
        
        configLoginLabelConstraint()
        configlogoAppImageViewConstrait()
        configEmailTextFieldConstrait()
        configPasswordTextFieldConstrait()
        configLoginButtonConstrait()
        configRegisterButtonConstrait()
        
        //setContraints()
        configButtonEnable(false)
    }
    
    private func configBackground(){
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    private func configSuperView(){
        self.addSubview(loginlabel)
        self.addSubview(logoAppImageView)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(registerButton)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
        
    }
    
    @objc private func tappedLoginButton(){
        self.delegate?.actionLoginButton()
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
            self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.isEnabled = true
        }else {
            self.loginButton.setTitleColor(.lightGray, for: .normal)
            self.loginButton.isEnabled = false
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
    
    private func setContraints(){
        NSLayoutConstraint.activate([
            
//            loginlabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
//            loginlabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
//            logoAppImageView.topAnchor.constraint(equalTo: loginlabel.bottomAnchor, constant: 20),
//            logoAppImageView.heightAnchor.constraint(equalToConstant: 40),
//            logoAppImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 60),
//            logoAppImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            
//            emailTextField.topAnchor.constraint(equalTo: self.logoAppImageView.bottomAnchor, constant: 20),
//            emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
        
//            passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 18),
//            passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
//            loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 32),
//            loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
//            registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 32),
//            registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
//            registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
//            registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        ])
    }
    
    func configLoginLabelConstraint(){
        self.loginlabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    func configlogoAppImageViewConstrait(){
        self.logoAppImageView.snp.makeConstraints { make in
            make.top.equalTo(loginlabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(40)
        }
    }
    
    func configEmailTextFieldConstrait(){
        self.emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoAppImageView.snp.bottom).offset(20)
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
    
    func configLoginButtonConstrait(){
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(18)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    func configRegisterButtonConstrait(){
        self.registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(32)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }

}
