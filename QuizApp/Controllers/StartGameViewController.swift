//
//  StartGameViewController.swift
//  QuizApp
//
//  Created by Олеся Скидан on 30.04.2024.
//

import UIKit

class StartGameViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if let mainViewController = storyboard?.instantiateViewController(withIdentifier: "ChooseLevelViewController") as? ChooseLevelViewController {
            mainViewController.modalPresentationStyle = .fullScreen
            present(mainViewController, animated: true)
        }
    }
}
