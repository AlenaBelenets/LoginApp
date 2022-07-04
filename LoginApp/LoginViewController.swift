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
    private let user = "User"
    private let password = "Password"

    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.greetingName = "Welcome, " + (nameLabel.text ?? "") + " !"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    // MARK: - Actions
    @IBAction func doneButtonPressed() {
        guard nameLabel.text == user || nameLabel.text == password else {
            showAlert(
                with: "Invalid login or password",
                and: "Please, enter correct login or password")
            return
        }
    }

    @IBAction func forgotNamePressed() {
        showAlert(with: "Oops!", and: "Your name is \(user) 😊")
    }

    @IBAction func forgotPasswordPressed() {
        showAlert(with: "Oops!", and: "Your password is \(password) 😊")
    }

    @IBAction func unwind(for segue: UIStoryboardSegue) {
        nameLabel.text = ""
        passwordLabel.text = ""
    }
}


// MARK: - UIAlertController
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.nameLabel.text = ""
            self.passwordLabel.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
