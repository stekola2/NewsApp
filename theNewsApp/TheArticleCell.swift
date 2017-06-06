//
//  ArticleCell.swift
//  theNewsApp
//
//  Created by samuel tekola on 4/26/17.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    
    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var desc: UILabel!
     
    @IBOutlet weak var author: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
