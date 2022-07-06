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
    var user = User()

    // MARK: - Override Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }

        viewControllers.forEach { viewController in
            if let secondVC = viewController as? EducationViewController {
                secondVC.view.backgroundColor = .gray
            } else if let thirdVC = viewController as? HobbyViewController {
                thirdVC.view.backgroundColor = .lightGray
            } else if let fourthVC = viewController as? ActivityViewController {
                fourthVC.view.backgroundColor = .opaqueSeparator
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

//     MARK: - Actions
    @IBAction func doneButtonPressed() {
        guard nameLabel.text == user.userName || nameLabel.text == user.userPassword else {
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
        ? showAlert(title: "Oops!", message: "Your name is \(user.userName) 😊")
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
