//
//  ViewController.swift
//  NewWordsDictionary
//
//  Created by 박관규 on 2022/07/10.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tf_search: UITextField!
    @IBOutlet weak var btn_search: UIButton!
    @IBOutlet weak var lb_results: UILabel!
    @IBOutlet weak var lb_warning: UILabel!
    
    var newWords = ["만반잘부": "만나서 반가워 잘 부탁해", "킹받네": "매우 화가난다", "꾸안꾸": "꾸민듯 안꾸민듯", "오운완": "오늘의 운동 완료"]
    
    var userText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tf_search.layer.borderWidth = 2
        tf_search.layer.borderColor = UIColor.black.cgColor
        self.tf_search.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tf_search.resignFirstResponder()
    }

    @IBAction func btn_searchClicked(_ sender: UIButton) {
        userText = tf_search.text ?? ""
        print(userText)
        for rs in newWords{
            if userText == rs.key{
                lb_results.text = rs.value
            }else if userText.isEmpty || userText != rs.key{
                lb_warning.text = "올바른 검색어를 입력하세요."
                // 경고을 띄워주며 입력했던 값 없애기
                tf_search.text = ""
                lb_warning.textColor = .red
                lb_warning.font = .boldSystemFont(ofSize: 14)
            }
        }
        
    }
    
}

