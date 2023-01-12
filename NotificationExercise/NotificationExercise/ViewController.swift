//
//  ViewController.swift
//  NotificationExercise
//
//  Created by Rivaldo Fernandes on 12/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UNUserNotificationCenter.current().requestAuthorization(options : [.alert, .badge, .sound]){ (granted, _) in
            if granted {
                print("Mendapatkan izin dari pengguna untuk local notifications")
            }else{
                print("Tidak mendapatkan izin dari pengguna untuk local notifications")
            }
        }
    }
    
    
}

