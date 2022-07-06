//
//  HobbyViewController.swift
//  LoginApp
//
//  Created by Alena Belenets on 06.07.2022.
//

import UIKit

class HobbyViewController: UIViewController {

    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobbyImage: UIImageView!

    private let person = User.Person(imagePerson: "Image")

    override func viewDidLoad() {
        super.viewDidLoad()
        hobbyLabel.text = person.hobbyPerson
        hobbyImage.image = UIImage.init(named: person.imagePerson)
    }
}
