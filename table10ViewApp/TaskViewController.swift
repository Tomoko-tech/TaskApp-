//
//  TaskViewController.swift
//  table10ViewApp
//
//  Created by Takahashi Tomoko on 2020/09/16.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //ユーザーがTaskを追加できるテキストフィールド
    @IBOutlet var addTask: UITextField!
    
    var taskArray = [String]()
    
    //テキストフィールドaddTaskに入力した内容を配列arrayに追加
    @IBAction func addTaskButton(_ sender: Any) {
        
        //保存されている値を配列arrayに再度保存 (空の配列の状態だから)
        if UserDefaults.standard.object(forKey: "task") != nil {
            taskArray = UserDefaults.standard.object(forKey: "task") as! [String]
        }
        
        //アペンド
        taskArray.append(addTask.text!)
        
        //配列arrayを保存
        UserDefaults.standard.set(taskArray, forKey: "task")
        
        //保存したので、前画面に戻る
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
