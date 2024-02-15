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
    var handleUpdatedDataDelegate: DataUpdateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toFirstScreen":
            prepareFirstScreen(segue)
        default:
            break
        }
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        self.navigationController?.viewControllers.forEach { viewController in
            (viewController as? UpdatableDataController)?.updatedData = dataTextField.text ?? ""
        }
        
    }
    
    @IBAction func saveDataWithDelegate(_ sender: UIButton) {
        handleUpdatedDataDelegate?.onDataUpdate(data: dataTextField.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    private func prepareFirstScreen(_ segue: UIStoryboardSegue) {
        guard let destinationVC = segue.destination as? ViewController else {
            return
        }
        destinationVC.updatedData = dataTextField.text ?? ""
    }


}
