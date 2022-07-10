//
//  ViewController.swift
//  NewWordsDictionary
//
//  Created by 박관규 on 2022/07/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: - IBOutlets
    @IBOutlet weak var tf_search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    @IBOutlet weak var lb_results: UILabel!
    @IBOutlet weak var lb_warning: UILabel!
    
    @IBOutlet weak var btn_firstHashTag: UIButton!
    @IBOutlet weak var btn_secondHashTag: UIButton!
    @IBOutlet weak var btn_thirdHashTag: UIButton!
    @IBOutlet weak var btn_fourthHashTag: UIButton!
    
    var newWords = ["만반잘부": "만나서 반가워 잘 부탁해", "킹받네": "매우 화가난다", "꾸안꾸": "꾸민듯 안꾸민듯", "오운완": "오늘의 운동 완료"]
    var userText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tf_search.layer.borderWidth = 2
        tf_search.layer.borderColor = UIColor.black.cgColor
        self.tf_search.delegate = self
        // 엑코 버그로 인한 버튼 타이틀 빈값 지정
        btn_search.setTitle("", for: .normal)
        
        buttonDesign(customButton: btn_firstHashTag)
        buttonDesign(customButton: btn_secondHashTag)
        buttonDesign(customButton: btn_thirdHashTag)
        buttonDesign(customButton: btn_fourthHashTag)
        
    }

    
    // MARK: - Functions
    func buttonDesign(customButton:UIButton){
        customButton.layer.borderWidth = 2
        customButton.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tf_search.resignFirstResponder()
        // 기존의 검색 버튼 액션을 가져와 리턴 키 클릭 시 액션하도록 사용하기
        self.btn_searchClicked(btn_search)
        return true
    }

    
    // MARK: - IBActions
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func btn_searchClicked(_ sender: UIButton) {
        userText = tf_search.text ?? ""
        print(userText)
        for rs in newWords{
            if userText == rs.key{
                lb_results.text = rs.value
            }else if userText.isEmpty{
                lb_warning.text = "올바른 검색어를 입력하세요."
                // 경고을 띄워주며 입력했던 값 없애기
                tf_search.text = ""
                lb_warning.textColor = .red
                lb_warning.font = .boldSystemFont(ofSize: 14)
            }
        }
        view.endEditing(true)
    }
    
    @IBAction func btn_firstHashTagClicked(_ sender: UIButton) {
        tf_search.text = btn_firstHashTag.currentTitle
    }
    
    @IBAction func btn_secondHashTagClicked(_ sender: UIButton) {
        tf_search.text = btn_secondHashTag.currentTitle
    }
    
    @IBAction func btn_thirdHashTagClicked(_ sender: UIButton) {
        tf_search.text = btn_thirdHashTag.currentTitle
    }
    
    @IBAction func btn_fourthHashTagClicked(_ sender: UIButton) {
        tf_search.text = btn_fourthHashTag.currentTitle
    }
    
    
    
}

