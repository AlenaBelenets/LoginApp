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

    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        hobbyLabel.text = user.person.hobby
        hobbyImage.image = UIImage.init(named: user.person.image)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let activityVC = segue.destination as? ActivityViewController else { return }
        activityVC.user = user
    }
  
}
