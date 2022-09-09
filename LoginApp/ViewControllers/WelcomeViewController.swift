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

    // MARK: - Private Properties
    var user: User!

    // MARK: - Private Properties
    private let primaryColor = UIColor(
        red: 44/255,
        green: 100/255,
        blue: 80/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 205/255,
        green: 255/255,
        blue: 255/255,
        alpha: 0.78
    )

    // MARK: - Override Method
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor:primaryColor,
                                      bottomColor: secondaryColor)
        greetingUserName.text = "Welcome, \(user.person.fullName)!"
    }
    
}

// MARK: - Set background color
extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
