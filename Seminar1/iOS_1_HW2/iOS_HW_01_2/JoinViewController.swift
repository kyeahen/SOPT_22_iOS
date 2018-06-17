//
//  JoinViewController.swift
//  iOS_HW_01_2
//
//  Created by 김예은 on 2018. 4. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var btnWoman: UIButton!
    @IBOutlet weak var btnMan: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(_ sender: UIButton) {

        if sender == btnWoman {
            
                btnWoman.setImage(#imageLiteral(resourceName: "woman_red"), for: UIControlState.normal)
                btnMan.setImage(#imageLiteral(resourceName: "man"), for: UIControlState.normal)
        }
        
        else {
            
            btnMan.setImage(#imageLiteral(resourceName: "man_blue"), for: UIControlState.normal)
            btnWoman.setImage(#imageLiteral(resourceName: "woman"), for: UIControlState.normal)
        }
    }
}
