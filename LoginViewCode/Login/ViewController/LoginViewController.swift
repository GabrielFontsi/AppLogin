//
//  LoginViewController.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 20/11/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController  {
    
    var loginScreen:LoginScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.loginScreen = LoginScreen()
        self.view = self.loginScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreen?.delegate(delegate: self)
        self.loginScreen?.configTextFieldDelegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
    }

}

extension LoginViewController: LoginScreenProtocol{
    
    func actionLoginButton() {
        
        let viewController: HomeViewController = HomeViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
//        guard let login = self.loginScreen else { return }
//        
//        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { (usuario, error) in
//      
//            if error != nil {
//                self.alert?.getAlert(title: "Atenção", message: "Dados incorretos, verifique e tente novamente")
//            }else {
//                if usuario == nil {
//                    self.alert?.getAlert(title: "Atenção", message: "Tivemos um problema inesperado, tente novamente mais tarde")
//                }
//                self.alert?.getAlert(title: "Parabéns", message: "Usuario logado")
//            
//            }
//        })
       
    }
    
    func actionRegisterButton() {
        
        let viewController = RegisterViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension LoginViewController: UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.loginScreen?.validTextField()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

