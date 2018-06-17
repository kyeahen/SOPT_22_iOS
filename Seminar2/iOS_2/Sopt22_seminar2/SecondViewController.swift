//
//  SecondViewController.swift
//  Sopt22_seminar2
//
//  Created by 이혜진 on 2018. 4. 7..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var text: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = text
    }

    // pop 코드로 하기 : navigationController 필수
    @IBAction func popAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // dismiss
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // present
    @IBAction func presentAction(_ sender: Any) {
        if let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
            self.present(thirdVC, animated: true, completion: {
                print(22222222) // present 이후 실행될 것.
            })
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
