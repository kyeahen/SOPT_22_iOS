//
//  ViewController.swift
//  iOS_01_3
//
//  Created by 김예은 on 2018. 4. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var answer: UILabel! //정답 수 라벨
    @IBOutlet weak var count: UILabel! //문제 시간 라벨
    @IBOutlet weak var Question: UILabel! //문제 라벨
    @IBOutlet weak var btnStart: UIButton! //시작 버튼
    @IBOutlet weak var tfInput: UITextField! //정답 입력 폼
    @IBOutlet weak var btnOk: UIButton! //확인 버튼

    
    var mTimer: Timer?
    var timerNum : Int = 15 //타이머 시간 변수
    
    var num1: UInt32 = 0
    var num2: UInt32 = 0
    var arrNum: UInt32 = 0
    var arr = ["+", "-", "x"]
    var ok : Bool = true //정답이 맞는지를 체크하는 변수
    var check: Int = 0 //정답 수 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Question.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
    }

    //시작 버튼 액션
    @IBAction func onStartClick(_ sender: UIButton) {
        
        check = 0
        answer.text = String(check)
        answerText.textColor = UIColor.black
        answer.textColor = UIColor.black
        
        if sender == btnStart {
            btnStart.isHidden = true
            Question.isHidden = false
            
            onTimerStart()
            randomQuestion()
        }
    }
    
    //확인 버튼 액션
    @IBAction func onOkClick(_ sender: UIButton) {
        
        isOk()
        
        if ok == false {
            mistake()
        }
        
        else
        {
            mTimer?.invalidate()
            timerNum = 15
            count.text = String(timerNum)
            
            answer.text = String(check)
            
            onTimerStart()
            randomQuestion()
            
        }
        
        tfInput.text = ""
    }
    
    //타이머를 시작하는 함수
    @objc func onTimerStart() {
        
        if timerNum == 0 {
            mTimer?.invalidate()
        }
        
        if let timer = mTimer {
            //timer 객체가 nil 이 아닌경우에는 invalid 상태에만 시작
            
            if !timer.isValid {
                // 1초마다 timerCallback함수를 호출하는 타이머
                mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
            }
        }
            
        else{
            
            mTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
    }
    
    //타이머가 호출하는 콜백함수
    @objc func timerCallback(){

        timerNum -= 1
        count.text = String(timerNum)
        
        if timerNum == 0 {
            mistake()
        }
    }
    
    var Qs : String = "" //문제 텍스트를 담을 변수
    
    //문제를 출력하는 함수
    @objc func randomQuestion(){
        
        num1 = arc4random_uniform(100) + 1;
        num2 = arc4random_uniform(100) + 1;
        arrNum = arc4random_uniform(3);
        
        Qs = String(num1)
        Qs.append(" ")
        Qs.append(String(arr[Int(arrNum)]))
        Qs.append(" ")
        Qs.append(String(num2))
        
        Question.text = Qs
    }
    
    var ans: Int = 0 // 올바른 문제 정답을 담을 변수
    
    // 문제를 계산하는 함수
    @objc func answerN(num1 : Int, num2 : Int, arrNum: Int) -> Int{

        if arrNum == 0 {
            ans = num1 + num2
        }
    
        else if arrNum == 1 {
            ans = num1 - num2
        }
        else {
            ans = num1 * num2
        }
        
        return ans
    }
    
    var greatAns : Int = 0 //올바른 문제 정답을 담을 변수
    var userAns : Int = 0 //사용자가 입력한 정답을 담을 변수
    
    //사용자가 답을 맞췄는지 아닌지를 판별하는 함수
    func isOk() {
        greatAns = answerN(num1:Int(num1), num2:Int(num2), arrNum:Int(arrNum))
        
        userAns = Int(tfInput.text!)!
        
        if greatAns == userAns {
                ok = true
                check += 1;
        }
        
        else {
            ok = false
            
        }
    }
    
    // 문제를 틀렸을 때 초기화 시키는 함수
    func mistake() {
        mTimer?.invalidate()
        timerNum = 15
        count.text = String(timerNum)
        
        answerText.textColor = UIColor.red
        answer.textColor = UIColor.red
        answerText.font = UIFont.boldSystemFont(ofSize: 16.0)
        answer.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        btnStart.isHidden = false
        Question.isHidden = true
    }
}

