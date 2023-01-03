//
//  MainSegueProgrammaticallyViewController.swift
//  SegueTypes
//
//  Created by Rivaldo Fernandes on 03/01/23.
//

import UIKit

class MainSegueProgrammaticallyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unWindSegue(_ sender: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func moveToNextPage(_ sender: Any) {
        performSegue(withIdentifier: "moveToNextPage", sender: sender)
    }
}
