//
//  CommentTableViewCell.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 5. 14..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labCommentNickName: UILabel!
    @IBOutlet weak var labCommentDate: UILabel!
    @IBOutlet weak var labCommentContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
