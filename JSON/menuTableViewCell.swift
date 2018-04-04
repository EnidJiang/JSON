//
//  menuTableViewCell.swift
//  JSON
//
//  Created by 蒋旖旎 on 2018/4/4.
//  Copyright © 2018年 蒋旖旎. All rights reserved.
//

import UIKit

class menuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dishNameLabel: UILabel!

    @IBOutlet weak var dishIngreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for result:OneData){
        dishNameLabel.text = result.title
        dishIngreLabel.text = result.ingredients
        
    }
    
}


