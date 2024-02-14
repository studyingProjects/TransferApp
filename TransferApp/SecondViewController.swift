//
//  SecondViewController.swift
//  TransferApp
//
//  Created by Andrei Shpartou on 14/02/2024.
//

import UIKit

protocol UpdatingDataController: AnyObject {
    var updatingData: String { get set }
}

class SecondViewController: UIViewController, UpdatingDataController {

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
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach { viewController in
            (viewController as? UpdatableDataController)?.updatedData = dataTextField.text ?? ""
        }
        
    }


}
