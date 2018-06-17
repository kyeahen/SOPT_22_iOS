//
//  ViewController.swift
//  Sopt22_seminar2
//
//  Created by 이혜진 on 2018. 4. 7..
//  Copyright © 2018년 hyejin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiddenVIew: UIView!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var pickerTextField: UITextField!
    
    // 피커에 들어갈 항목.
    let colorArray = ["red", "green", "pink"]
    let pickerview = UIPickerView()
    
    
    // Unwind Segue를 위해 필요합니다. UIStoryboard가 아니라 UIStoryboardSegue인 점 주의하세요.
    @IBAction func goFirst(segue: UIStoryboardSegue) {}
    
    // viewDidLoad 복습
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionLabel.text = "각 뷰를 만져보세요."
        
        initPicker()
    }
    
    // Storyboard Segue를 이영히야 데이터를 전달하는 방법.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Storyboard에서 Segue를 클릭하여 identifier를 확인해보세요.
        if segue.identifier == "push" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.text = "push"
        } else if segue.identifier == "present" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.text = "present"
        }
    }
    
    // Segue를 이용하면 데이터 전달을 prepare(for segue: ) 메서드를 이용해야하지만 아래처럼 직접 코드로 push하면 바로 데이터 전달을 할 수 있습니다.
    @IBAction func pushAction(_ sender: Any) {
//        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
//
//            secondVC.text = "push22222"
//
//
//            self.navigationController?.pushViewController(secondVC, animated: true)
//        }
        
        guard let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        
        secondVC.text = "push2222"
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // UISwitch : Switch를 킬 때 뷰가 보이고 끌 때 뷰가 사라집니다.
    // sender: UISwitch는 처음엔 Any로 나오지만 switch의 isOn을 쓰기 위해서는 Any를 UISwitch로 바꿔주어야합니다.
    @IBAction func switchOn(_ sender: UISwitch) {
        // 직관적으로 짠 코드.
//        if sender.isOn {
//            hiddenVIew.isHidden = false
//        } else {
//            hiddenVIew.isHidden = true
//        }
        
        // 한 줄로 줄이면 이렇게 됩니다.
        hiddenVIew.isHidden = !sender.isOn
    }
    
    // TextField에서 IBAction 사용 : TextField의 상태가 바뀔 때마다 호출됩니다.
    @IBAction func changedTextField(_ sender: UITextField) {
        let text = sender.text
        
        actionLabel.text = text
        
        // textField에서 각 color를 타자칠 때 어떻게 변하는지 확인해보세요.
        if text == "red" {
            actionLabel.textColor = UIColor.red
        } else if text == "green" {
            actionLabel.textColor = UIColor.green
        } else if text == "pink" {
            actionLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        } else {
            actionLabel.textColor = UIColor.black
        }
    }
    
    // UISlider : Slider의 상태가 변하면 Label의 크기도 뱐합니다.
    @IBAction func changedSlider(_ sender: UISlider) {
        let size = CGFloat(sender.value)
        
        actionLabel.font = UIFont(name: actionLabel.font.fontName, size: size)
    }
    
    // UISegmentedControl : 터치하는 Sement에 해당하는 title을 Label에 띄웁니다. : Segment의 title을 각각 바꿔보기도 합시다.
    @IBAction func changedSegment(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            actionLabel.text = sender.titleForSegment(at: 0)
//        } else {
//            actionLabel.text = sender.titleForSegment(at: 1)
//        }
        
        actionLabel.text = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    
    // UIStepper
    @IBAction func pressedStepper(_ sender: UIStepper) {
        let progress = Float(sender.value/sender.maximumValue)
        
        progressView.progress = progress
    }
    
}


// pickerView를 위해 필요한 것들.
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    // picker 구성.
    func initPicker() {
        pickerview.delegate = self; pickerview.dataSource = self
        
        let bar = UIToolbar()
        bar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(selectedPicker))
        
        bar.setItems([doneButton], animated: true)
        pickerTextField.inputAccessoryView = bar
        pickerTextField.inputView = pickerview
    }
    
    // picker에서 완료 버튼을 눌렀을 때 실행되는 function.
    // #selector(function)에 들어갈 function은 @objc 어노테이션이 필요합니다.
    @objc func selectedPicker() {
        let row = pickerview.selectedRow(inComponent: 0)
        
        // 선택된 항목 textField에 넣기.
        pickerTextField.text = colorArray[row]
        changedTextField(pickerTextField)
        
        view.endEditing(true)
    }
    
    // Component : 피커의 열.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Row in component : Component 안의 행.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    // title : 피커에 넣고 싶은 내용.
    // titleForRow : 외부매개변수명, row : 내부매개변수명.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }
    
    
}
























