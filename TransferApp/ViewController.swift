//
//  ViewController.swift
//  TransferApp
//
//  Created by Andrei Shpartou on 14/02/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        navigationController?.pushViewController(editScreen, animated: true)
        
    }

}

