//
//  EducationViewController.swift
//  LoginApp
//
//  Created by Alena Belenets on 06.07.2022.
//

import UIKit

class EducationViewController: UIViewController {

    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var educationImage: UIImageView!

    private let person = User.Person(imagePerson: "Image-2")

    override func viewDidLoad() {
        super.viewDidLoad()
        educationLabel.text = person.educationPerson
        educationImage.image = UIImage.init(named: person.imagePerson)
    }
}
