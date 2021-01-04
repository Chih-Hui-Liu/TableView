//
//  FirstTableViewCell.swift
//  TableView
//
//  Created by Leo on 2021/1/3.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
