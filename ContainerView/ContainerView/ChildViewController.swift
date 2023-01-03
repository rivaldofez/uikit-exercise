//
//  ChildViewController.swift
//  ContainerView
//
//  Created by Rivaldo Fernandes on 03/01/23.
//

import UIKit

class ChildViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButton(_ sender: Any) {
        if let name = nameTextField.text {
            outputLabel.text = "Selamat Datang \(name)!"
        }else{
            outputLabel.text = "Masukan dahulu namamu"
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
