//
//  AcademyTableViewCell.swift
//  DynamicTable
//
//  Created by Rivaldo Fernandes on 03/01/23.
//

import UIKit

class AcademyTableViewCell: UITableViewCell {
    @IBOutlet weak var academyImageView: UIImageView!
    
    @IBOutlet weak var academyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
