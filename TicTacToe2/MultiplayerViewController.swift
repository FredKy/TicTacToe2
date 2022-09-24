//
//  MultiplayerViewController.swift
//  TicTacToe2
//
//  Created by Fredrik Kypta on 2022-09-22.
//

import UIKit

class MultiplayerViewController: UIViewController {

    @IBOutlet weak var nameField1: UITextField!
    @IBOutlet weak var nameField2: UITextField!
    @IBOutlet weak var yesNoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func toggle(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected //By default sender.isSelected is false

                if sender.isSelected {
                    sender.setTitle("No", for: .normal)
//                    sender.setTitleColor(UIColor.green, for: .normal)
                } else {
                    sender.setTitle("Yes", for: .normal)
//                    sender.setTitleColor(UIColor.red, for: .normal)
                }
    }
    
    
    @IBAction func nextScreen(_ sender: UIButton) {
        performSegue(withIdentifier: "multiplayerStart", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? ViewController
        if yesNoButton.title(for: .normal) == "Yes" {
            destinationVC?.playingAI = true
        }
        
        if let name1 = nameField1.text {
            destinationVC?.name1 = name1

        }
        if let name2 = nameField2.text {
            destinationVC?.name2 = name2
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
