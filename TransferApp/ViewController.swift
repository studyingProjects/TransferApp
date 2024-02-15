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

protocol DataUpdateProtocol {
    func onDataUpdate(data: String)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toEditScreen":
            prepareEditScreen(segue)
        default:
            break
        }
    }
    
    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {
        
        
    }
    
    @IBAction func editDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! UpdatingDataController
        
        editScreen.updatingData = dataLabel.text ?? ""
        
        navigationController?.pushViewController(editScreen as! UIViewController, animated: true)
        
    }
    
    @IBAction func editDataWithDelegate(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.handleUpdatedDataDelegate = self
        secondViewController.updatingData = dataLabel.text ?? ""
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func editDataWithClosure(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondViewController.updatingData = dataLabel.text ?? ""
        
        secondViewController.completionHandler = { [unowned self] updatedValue in
            updatedData = updatedValue
            updateLabel(withText: updatedValue)
        }
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    private func updateLabel(withText text: String) {
        dataLabel.text = text
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondViewController else {
            return
        }
        
        destinationController.updatingData = dataLabel.text ?? ""
        
    }

}

extension ViewController: DataUpdateProtocol {
    func onDataUpdate(data: String) {
        updatedData = data
        updateLabel(withText: data)
    }
    
    
}

