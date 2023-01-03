//
//  ViewController.swift
//  SegueTypes
//
//  Created by Rivaldo Fernandes on 03/01/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unWindSegue(_ sender: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }


}

