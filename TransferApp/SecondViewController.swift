//
//  SecondViewController.swift
//  TransferApp
//
//  Created by Andrei Shpartou on 14/02/2024.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var dataTextField: UITextField!
    var updatingData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
        
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
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
