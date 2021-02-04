//
//  LoginViewController.swift
//  ViperModule
//
//  Created by dante on 30/01/2021.
//

import UIKit

class LoginViewController: UIViewController {
    var presenter: LoginViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton! {
        didSet {
            signInButton.backgroundColor = UIColor.init(red: 0,
                                                   green: 170/255,
                                                   blue: 70/255,
                                                   alpha: 1)
            signInButton.titleLabel?.tintColor = .white
            signInButton.layer.cornerRadius = 15
            signInButton.setTitle("Iniciar sesion", for: .normal)
        }
    }
    @IBOutlet weak var errorMessage: UILabel! {
        didSet {
            errorMessage.alpha = 0
        }
    }

    @IBAction func SignIn(_ sender: Any) {
        guard let email = self.emailTextField.text, let password = self.passwordTextField.text else { return }
        self.presenter?.checkCredentials(email: email, pass: password)
    }
}

extension LoginViewController: LoginPresenterToLoginViewProtocol {

    func showErrorMessage() {
        UIView.animate(withDuration: 0.5,
                       animations: { self.errorMessage.alpha = 1 },
                       completion: { _ in UIView.animate(withDuration: 0.5,
                                                         animations: { self.errorMessage.alpha = 0 })}
        )
    }
}
