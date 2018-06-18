//
//  BoardCollectionViewCell.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 6. 8..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class BoardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var boardImageView: UIImageView!
    @IBOutlet weak var userIDLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.borderWidth = 1.6
        self.layer.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)
        self.layer.cornerRadius = 5
        
    }
    
}
