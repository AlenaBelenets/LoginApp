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

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        activityLabel.text = user.person.activity
        activityImage.image = UIImage.init(named: "Image-2")
    }
   
}
