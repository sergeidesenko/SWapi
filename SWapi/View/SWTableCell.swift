//
//  SWTableCell.swift
//  SWapi
//
//  Created by user on 30.10.2020.
//

import UIKit

class SWTableCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        contentView.layer.cornerRadius = 15
        nameLabel.textColor = #colorLiteral(red: 1, green: 0.9098039216, blue: 0.1215686275, alpha: 1)
    }

    @IBOutlet weak var nameLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {

        // Configure the view for the selected state
    }

    
}
