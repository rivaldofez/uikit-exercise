//
//  ViewController.swift
//  GreetingAppInstrumentTest
//
//  Created by Rivaldo Fernandes on 13/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var haloButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        haloButton.isEnabled = false
    }

    @IBAction func showHalo(_ sender: Any) {
        
        let alert = UIAlertController(title: "Message", message: "Hello World!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
    }
    
}

