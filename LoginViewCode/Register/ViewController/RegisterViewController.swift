//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by Gabriel Fontenele da Silva on 20/11/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    var registerScreen: RegisterScreen?
    var auth: Auth?
    var alert: Alert?
    
    override func loadView() {
        self.registerScreen = RegisterScreen()
        self.view = self.registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerScreen?.configTextFieldDelegate(delegate: self)
        self.registerScreen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerScreen?.validTextField()
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension RegisterViewController: RegisterScreenProtocol{
    
    func actionRegisterButton() {
        
        guard let register = self.registerScreen else { return }
     
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { (result, error) in
            
            // != Diferente
            if error != nil {
                self.alert?.getAlert(title: "Atenção", message: "Erro ao cadastrar")
            } else {
                self.alert?.getAlert(title: "Parabéns", message: "Usuario cadastrado com sucesso", completion:{
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
        print("Register button")
    }
    
    
}

