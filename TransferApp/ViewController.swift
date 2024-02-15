//
//  ViewController.swift
//  TransferApp
//
//  Created by Andrei Shpartou on 14/02/2024.
//

import UIKit

protocol UpdatableDataController: AnyObject {
    var updatedData: String { get set }
}

class ViewController: UIViewController, UpdatableDataController {

    @IBOutlet var dataLabel: UILabel!
    var updatedData: String = "Label"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(withText: updatedData)
    }
    
    private func updateLabel(withText text: String) {
        dataLabel.text = text
    }

    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! UpdatingDataController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
        
    }
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen":
            prepareEditScreen(segue)
        default:
            break
        }
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        
        destinationController.updatingData = dataLabel.text ?? ""
        
    }
    

}

