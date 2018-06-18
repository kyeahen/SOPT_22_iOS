//
//  LongPress.swift
//  Sopt22_seminar4
//
//  Created by 김예은 on 2018. 6. 8..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import Foundation
import UIKit

class LongPress {
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended {
            return
        }
        
        let p = gesture.location(in: self.collectionView)
        
        if let indexPath = self.collectionView.indexPathForItem(at: p) {
            // get the cell at indexPath (the one you long pressed)
            let cell = self.collectionView.cellForItem(at: indexPath)
            // do stuff with the cell
        } else {
            print("couldn't find index path")
        }
    }
}
