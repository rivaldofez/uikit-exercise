//
//  ViewController.swift
//  CleanArchitectureSimple
//
//  Created by Rivaldo Fernandes on 24/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.'
        
        let usecase = Injection.init().provideUseCase()
        let presenter = MessagePresenter(useCase: usecase)
        let message = presenter.getMessage(name: "Rivaldo Fernandes")
        
        welcomeLabel.text = message.welcomeMessage
        
        
    }


}

