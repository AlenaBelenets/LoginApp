//
//  ActivityViewController.swift
//  LoginApp
//
//  Created by Alena Belenets on 06.07.2022.
//

import UIKit

class ActivityViewController: UIViewController {

    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var activityImage: UIImageView!

    let person = User.Person(imagePerson: "Image-1")

    override func viewDidLoad() {
        super.viewDidLoad()
        activityLabel.text = person.activityPerson
        activityImage.image = UIImage.init(named: person.imagePerson)
    }
}
