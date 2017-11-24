//
//  LoginViewController.swift
//  Example
//
//  Created by Yuri Fox on 24.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import UIKit
import YFKeychainAccess

class LoginViewController: UIViewController {

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction private func enterButtonDidTap(_ sender: UIButton) {
        
        var isSucces = false
        
        defer {
            self.performSegue(withIdentifier: "ShowSuccesController", sender: isSucces)
        }
        
        guard let login = self.loginTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        let keychain = YFKeychainAccess(keyPrefix: "TESTAPP")
        
        do {
            let savedLogin = try keychain.string(forKey: "LOGIN")
            let savedPassword = try keychain.string(forKey: "PASSWORD")
            isSucces = savedLogin == login && savedPassword == password
        } catch {
            print(error)
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let resultController = segue.destination as? ResultViewController {
            resultController.isSuccess = sender as! Bool
        }
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
