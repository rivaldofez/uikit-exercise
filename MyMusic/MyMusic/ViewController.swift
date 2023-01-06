//
//  ViewController.swift
//  MyMusic
//
//  Created by Rivaldo Fernandes on 06/01/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    private var player: AVAudioPlayer?
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isPlaying(state: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make sure url not null
        guard let url = Bundle.main.url(forResource: "All Night - The Influence", withExtension: "mp3") else {
            print("url error")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            
            //this code for iOS 11 or later
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            //this code for iOS 10 or lower
            // player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    @IBAction func playMusic(_ sender: Any) {
        print("audio played")
        guard let audioPlayer = player else { return }
        audioPlayer.play()
        isPlaying(state: true)
        
        
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        print("audio played")
        guard let audioPlayer = player else { return }
        audioPlayer.stop()
        isPlaying(state: false)
    }
    
    private func isPlaying(state: Bool){
        stopButton.isEnabled = state
        playButton.isEnabled = !state
    }
    
}

