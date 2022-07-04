//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Alena Belenets on 03.07.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var greetingUserName: UILabel!
    @IBOutlet weak var greetingLabel: UILabel!

    @IBOutlet weak var logOutButton: UIButton!

    // MARK: - Public Methods
    var greetingName: String!

    // MARK: - Actions
    @IBAction func pressedLogOut() {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingUserName.text = greetingName
    }
}
