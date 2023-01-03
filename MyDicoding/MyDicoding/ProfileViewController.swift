//
//  ViewController.swift
//  MyDicoding
//
//  Created by Rivaldo Fernandes on 28/11/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var followedButton: UIButton!
    
    private var isFollow = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCircleImageView()
    }
    
    private func setupCircleImageView(){
        profileImageView.layer.borderWidth = 1
        
        profileImageView.layer.masksToBounds = false
        
        profileImageView.layer.borderColor = UIColor.black.cgColor
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        profileImageView.clipsToBounds = true
    }

    @IBAction func setFollowed(_ sender: UIButton) {
        isFollow.toggle()
        
        followedButton.setTitle((isFollow ? "Following" : "Follow"), for: .normal)
    }
    
}

