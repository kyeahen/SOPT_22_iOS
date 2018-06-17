//
//  JoinViewController.swift
//  iOS_HW_01_2
//
//  Created by 김예은 on 2018. 4. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    @IBOutlet weak var textID: UITextField!
    @IBOutlet weak var textPwd: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textBirth: UITextField!
    @IBOutlet weak var textPart: UITextField!
    
    @IBOutlet weak var btnWoman: UIButton!
    @IBOutlet weak var btnMan: UIButton!
    var gender : String = ""
    @IBOutlet weak var BtnJoin: UIButton!
    
    let pickerView = UIPickerView()
    var partArr = ["기획", "디자인", "서버", "안드로이드", "iOS", "Web-Front-End"]
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPicker()
        initDatePicker()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClick(_ sender: UIButton) {

        if sender == btnWoman {
            btnWoman.isSelected = !btnWoman.isSelected
                btnWoman.setImage(#imageLiteral(resourceName: "woman_red"), for: UIControlState.normal)
                btnMan.setImage(#imageLiteral(resourceName: "man"), for: UIControlState.normal)
            gender = "woman"
        }
        
        else {
            btnMan.isSelected = !btnMan.isSelected
            btnMan.setImage(#imageLiteral(resourceName: "man_blue"), for: UIControlState.normal)
            btnWoman.setImage(#imageLiteral(resourceName: "woman"), for: UIControlState.normal)
            gender = "man"
        }
    }
    
    @IBAction func JoinClick(_ sender: UIButton) {
        
        if ((textID.text?.isEmpty)! || (textPwd.text?.isEmpty)!
        || (textName.text?.isEmpty)! || (textBirth.text?.isEmpty)!
            || (textPart.text?.isEmpty)!)
            || (!(btnWoman.isSelected) && !(btnMan.isSelected))
        {
            let dialog = UIAlertController(title: "회원가입 실패", message: "모든 항목을 입력하세요", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "확인", style: UIAlertActionStyle.default)
            
            dialog.addAction(action)
            
            self.present(dialog, animated: true, completion: nil)
            
        }
        
        else {
            
            userArr += [user(id: textID.text!, pwd: textPwd.text!, name: textName.text!, birth: textBirth.text!, part: textPart.text!, gender: gender)]
 
            
            //어디로 갈지 지정
            let infoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
            
            //다음 컨트롤러에 무언가를 전달하고자할 때 코드 쓰기

            infoVC.gender = self.gender
            infoVC.name = self.textName.text
            infoVC.birth = self.textBirth.text
            infoVC.id = self.textID.text
            infoVC.pwd = self.textPwd.text
            
            if (textPart.text == "기획") {
                infoVC.partInfo =
                """
                *기획 파트
                - 아이디어 디벨롭핑 시간을 통해 본인의 아이디어를 발전시키고 기획안을 완성하는 것을 목표로 합니다.
                - 디자인 및 개발파트와의 협업을 위해 필요한 정보를 습득합니다.
                - 기획자이자 프로젝트 매니저로서의 역할 수행이 가능하도록 합니다.
                """
            }
            
            else if (textPart.text == "디자인") {
                infoVC.partInfo =
                """
                *디자인 파트
                - 매주 세미나에서의 강연과 실습을 통해 UI/ UX에 관련하여 디자이너가 알아야 할 개념을 숙지합니다.
                - 이를 디자인 툴로 적용할 수 있는 것을 목표로 합니다.
                - 개발자와의 수월한 소통을 위하여 사용되는 협업툴에 관련된 스터디를 진행합니다.
                """
            }
                
            else if (textPart.text == "서버") {
                infoVC.partInfo =
                """
                *서버 파트
                - Node.js를 이용해 AWS상에서 서버를 구성하는 방법을 배워봅니다.
                - 클라이언트와 서버, DB 사이의 연동과정을 이해하고 구성합니다.
                - 코딩뿐만 아니라 ERD 설계, API Reference 작성 등 프로젝트에서 백엔드를 담당하여 진행하는 과정 전체를 경험합니다.
                """
            }
                
            else if (textPart.text == "안드로이드") {
                infoVC.partInfo =
                """
                *안드로이드 파트
                - 안드로이드 스튜디오를 이용해 기초적인 네이티브 어플리케이션 제작 방법에 대해서 배웁니다.
                - API 사용법 및 통신에 대해서 배웁니다.
                - 기초적인 어플리케이션의 디자인 방법에 대해 배웁니다.
                - 각 세미나 실습 결과물 + 과제를 컴포넌트로 분리하여 8주의 세미나 후에 1~8 주차의 내용이 담긴 하나의 결과물을 남겨 앱잼을 진행하는데 많은 도움이 될 수 있도록 하는 것을 목표로 합니다.
                - 새로운 안드로이드 공식 언어인 코틀린에 대해 배웁니다.
                """
            }
                
            else if (textPart.text == "iOS") {
                infoVC.partInfo =
                """
                *iOS 파트
                - Xcode(통합개발환경)와 Swift를 이용해 iOS 어플리케이션 프로그래밍을 배웁니다.
                - Interface builder를 이용한 레이아웃 구성 및 네트워크 통신 방법에 대해 배웁니다.
                - 매주 실습 세미나를 통해 iOS개발 기초부터 심화까지 1인 1앱 개발을 목표로 공부합니다.
                - Open API 사용법을 숙지합니다.

                """
            }
                
            else if (textPart.text == "Web-Front-End")  {
                infoVC.partInfo =
                """
                *Web Front-End 파트
                - 기본적인 HTML, CSS 부터 컴포넌트 기반 웹 개발에 대해서 배웁니다.
                - 매주 실습 세미나를 통해 Vue.js의 기초부터 심화까지 공부합니다.
                - API 사용법 및 통신에 대해서 배웁니다.
                """
            }
            
            self.present(infoVC, animated: true, completion: nil)
        }
        
    }
}

extension JoinViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    //UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //UIPickerViewDelegate
    //컴포넌트 당 row 가 몇개가 될 것인가
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partArr.count
    }
    
    ///UIPickerViewDataSource 위한 것
    //각각의 row 에 어떠한 내용이 들어갈 것인가
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return partArr[row]
        
    }
    
    func initPicker(){
        //구현 후에 해당 pickerView의 데이터 소스와 델리게이트가 있는 위치 알려 주는 것
        pickerView.delegate = self
        pickerView.dataSource = self
        
        setTextfieldView(textField: textPart, selector: #selector(selectedPicker), inputView: pickerView)
        
    }
    
    func initDatePicker(){

        datePicker.datePickerMode = .date
 
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy.MM.dd"

        guard let date = dateFormatter.date(from: "1996.01.29") else {
            fatalError("포맷과 맞지 않아 데이터 변환이 실패했습니다")
        }
        
        datePicker.date = date
        
        datePicker.maximumDate = Date()
        
        
        setTextfieldView(textField: textBirth, selector: #selector(selectedDatePicker), inputView: datePicker)
    }
    
    func setTextfieldView(textField:UITextField, selector : Selector, inputView : Any){
        
        let bar = UIToolbar()
        bar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "확인", style: .done
            , target: self, action: selector)

        bar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = bar
        
        if let tempView = inputView as? UIView {
            textField.inputView = tempView
        }
        if let tempView = inputView as? UIControl {
            textField.inputView = tempView
        }
        
    }
    
    @objc func selectedDatePicker(){

        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy.MM.dd"

        let date = dateformatter.string(from: datePicker.date)
        
        textBirth.text = date
        
        view.endEditing(true)
    }
    

    @objc func selectedPicker(){

        let row = pickerView.selectedRow(inComponent: 0)
        
        textPart.text = partArr[row]

        view.endEditing(true)
    }
}

