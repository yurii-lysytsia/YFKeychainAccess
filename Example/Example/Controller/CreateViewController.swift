//
//  CreateViewController.swift
//  Example
//
//  Created by Yuri Fox on 24.11.17.
//  Copyright © 2017 Yuri Lysytsia. All rights reserved.
//

import UIKit
import YFKeychainAccess

class CreateViewController: UIViewController {

    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction private func createButtonDidTap(_ sender: UIButton) {
        guard let login = self.loginTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        let keychain = YFKeychainAccess(keyPrefix: "TESTAPP")

        do {
            try keychain.set(login, forKey: "LOGIN")
            try keychain.set(password, forKey: "PASSWORD")
            self.navigationController?.popViewController(animated: true)
        } catch {
            print(error)
        }
        
    }
    
}



extension CreateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

