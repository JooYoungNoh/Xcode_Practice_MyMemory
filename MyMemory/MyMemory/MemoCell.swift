//
//  MemoCell.swift
//  MyMemory
//
//  Created by 노주영 on 2022/04/07.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var regdate: UILabel!
    @IBOutlet var img: UIImageView!
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
