//
//  TableViewCustomCell.swift
//  OneWeekAPILesson02
//
//  Created by UrataHiroki on 2021/11/05.
//

import UIKit

class TableViewCustomCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeMaterialTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rankLabel.text = ""
        mediumImageView.image = UIImage(named: "")
        recipeTitleLabel.text = ""
        recipeMaterialTextView.text = ""
    }
}
