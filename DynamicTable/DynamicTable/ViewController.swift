//
//  ViewController.swift
//  DynamicTable
//
//  Created by Rivaldo Fernandes on 03/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        academyTableView.dataSource = self
        academyTableView.delegate = self
        
        academyTableView.register(UINib(nibName: "AcademyTableViewCell", bundle: nil), forCellReuseIdentifier: "AcademyCell")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dummyAcademyData.count)
        return dummyAcademyData.count
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AcademyCell", for: indexPath) as? AcademyTableViewCell {
            
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyImageView.image = academy.image
            
            
            return cell
        }else{
            return UITableViewCell()
        }
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: nil)
    }
}

