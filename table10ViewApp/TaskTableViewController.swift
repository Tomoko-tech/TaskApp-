//
//  TaskTableViewController.swift
//  table10ViewApp
//
//  Created by Takahashi Tomoko on 2020/09/16.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UITableView.isEditing を true にすると編集モードに切り替わる
        tableView.isEditing = true
        //Cellをタップ選択できるようにする
        tableView.allowsSelectionDuringEditing = true
        
    }

    
    var resultTaskArray = [String]()
    
    //削除ボタンを選ぶと、テーブルから削除される
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        resultTaskArray.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        UserDefaults.standard.set(resultTaskArray, forKey: "task")
    }
    
    
    //右側の三本線をドラッグすることで、選択しているセルの並び替えができる
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //選択している行の内容をresultTask変数に入れて、
        let resultTask = resultTaskArray[sourceIndexPath.row]
        //その選択している行からremove取り去って、
        resultTaskArray.remove(at: sourceIndexPath.row)
        //destination行き先とする行に、変数をinsert差し込む
        resultTaskArray.insert(resultTask, at: destinationIndexPath.row)
        UserDefaults.standard.set(resultTaskArray, forKey: "task")
    }
   
    
    //ユーザーが追加したTaskの内容がUserDefaultsに入っている
    //この画面に戻って来る度に 受け皿のresultTaskArrayにそれを入れる
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "task") != nil {
            resultTaskArray = UserDefaults.standard.object(forKey: "task") as! [String]
        }
        //リロードする
        tableView.reloadData()
    }
    
    
        
    
    
    // MARK: - Table view data source
    
    //セクション数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //セルを何行表示するか
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultTaskArray.count
    }

    //セルの表示
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //セルの指定
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        //セルの数と配列の中身の数をとの数合わせ
        cell.textLabel?.text = resultTaskArray[indexPath.row]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
