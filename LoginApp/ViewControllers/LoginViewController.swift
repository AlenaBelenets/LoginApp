//
//  LoginViewController.swift
//  LoginApp
//
//  Created by MacBook Pro 13 2020 on 01.07.2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!

    @IBOutlet weak var logInButton: UIButton!

    // MARK: - Private properties
    private let user = User.getUserData()

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.login
        passwordLabel.text = user.userPassword
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }

        viewControllers.forEach {
            if let welcomeVC = $0 as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = $0 as? UINavigationController {
                guard
                    let hobbyVC = navigationVC.topViewController as? HobbyViewController
                else { return }
                hobbyVC.user = user
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

//     MARK: - Actions
    @IBAction func doneButtonPressed() {
        guard nameLabel.text == user.login || nameLabel.text == user.userPassword else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordLabel
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }

    @IBAction func getNameOrPassword(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(user.login) 😊")
        : showAlert(title: "Oops!", message: "Your password is \(user.userPassword) 😊")

    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameLabel.text = ""
        passwordLabel.text = ""
    }
}


// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
