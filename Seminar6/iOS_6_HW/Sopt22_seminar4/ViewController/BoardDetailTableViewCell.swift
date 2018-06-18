//
//  BoardDetailTableViewCell.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 5. 14..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class BoardDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var labNickName: UILabel!
    @IBOutlet weak var labDate: UILabel!
    @IBOutlet weak var labTitle: UILabel!
    @IBOutlet weak var labContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
