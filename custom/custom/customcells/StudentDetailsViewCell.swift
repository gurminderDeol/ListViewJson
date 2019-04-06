//
//  StudentDetailsViewCell.swift
//  custom
//
//  Created by gurminder on 2019-03-14.
//  Copyright © 2019 Kiran Mehal. All rights reserved.
//

import UIKit

class StudentDetailsViewCell: UITableViewCell {

    @IBOutlet weak var lblfname: UILabel!
    
    @IBOutlet weak var lbllname: UILabel!
    
    @IBOutlet weak var lblgender: UILabel!
    
    @IBOutlet weak var lblresult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
