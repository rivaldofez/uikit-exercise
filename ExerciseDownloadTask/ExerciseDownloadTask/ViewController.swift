//
//  ViewController.swift
//  ExerciseDownloadTask
//
//  Created by Rivaldo Fernandes on 05/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var messageView: UILabel!
    @IBOutlet weak var buttonView: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        messageView.text = ""
        progressView.isHidden = true
        
        
        DownloadManager.shared.progress = { (totalBytesWritten, totalBytesExpectedToWrite) in
            let totalMB = ByteCountFormatter.string(fromByteCount: totalBytesExpectedToWrite, countStyle: .binary)
            let writtenMB = ByteCountFormatter.string(fromByteCount: totalBytesWritten, countStyle: .binary)
            let progress = Float(totalBytesWritten) / Float(totalBytesExpectedToWrite)
            
            DispatchQueue.main.async {
                self.buttonView.isEnabled = false
                self.progressView.isHidden = false
                self.progressView.progress = progress
                self.messageView.text = "Downloading \(writtenMB) of \(totalMB)"
            }
        }
        
        DownloadManager.shared.completed = { (location) in
            try? FileManager.default.removeItem(at: location)
            DispatchQueue.main.async {
                self.messageView.text = "Download Finished"
                self.buttonView.isEnabled = true
            }
        }
        
        DownloadManager.shared.downloadError = { (task, error) in
            print("Task Completed: \(task), error: \(String(describing: error?.localizedDescription))")
        }
    }
    
    @IBAction func buttonDownload(_ sender: Any) {
        let url = URL(string: "http://212.183.159.230/50MB.zip")
        let task = DownloadManager.shared.session.downloadTask(with: url!)
        task.resume()
    }
    
}

