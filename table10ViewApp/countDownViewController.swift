//
//  countDownViewController.swift
//  table10ViewApp
//
//  Created by Takahashi Tomoko on 2020/09/21.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit

class countDownViewController: UIViewController {
   
    

    @IBOutlet var testLabel: UILabel!
    

    @IBOutlet var goalLabel: UILabel!
    
    //機能 3つに別れている
    //①目標日をデートピッカーから取得
    //②目標日まで何日あるのかを計算
    //③その目標日までの日数のカウントダウンが開始
    
    //まずはユーザーにデイトピッカーを使って目標の日付を指定してもらいます
    @IBAction func changeDate(_ sender: UIDatePicker) {
        
        //DateFormatterクラスにアクセスし、日付の表示形式を決めます。(DateFormatterは日付や時間について定義されているクラス)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        //ピッカーで取得した目標日をラベルに表示
        testLabel.text = formatter.string(from: sender.date)
        print(formatter.string(from: sender.date))
        
    }


    //2つ目の機能 目標日まで後何日かを計算する
    //ピッカーで取得した日付から今日の日付の日数を計算していく passedDaysはこの日数が入る変数です
    var passedDays = 0
    @IBAction func goalButton(_ sender: Any) {
    
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        //var goalDate = "2029/04/02 19:51:25"
        
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        
        //ラベルに表示されている目標日を変数に格納
        var goalDate = String(testLabel.text!)
        print(goalDate,"これこれ")
        
        //String型のgoalDateをDate型に変換して、新たな変数に格納します
        let formatedGoalDate = formatter.date(from: goalDate)
        //Dateクラスを使って今日の日付を取得し、変数currentDateに格納
        let currentDate = Date()
        
        //日数を調べる
        //Calender.current.dateComponentsの第３引数に目標日を渡し、第２引数に今日の日付を渡すことで、2つの日付間の日数が求められる passedDaysに入る
        passedDays = Calendar.current.dateComponents([.day], from: currentDate, to: formatedGoalDate!).day!

        //[.year, .month, .day, .hour, .minute]
        
        print(passedDays)
        
        //ラベルに目標日までの日数を表示します
        goalLabel.text = String("目標日まで後\(passedDays)日です")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
    }
    
    
    
    //3つ目の機能 カウントダウン カウントダウン開始ボタンを押すと、目標日までの日数の値を渡し、カウントダウンが始まるようにします
        
        
        @IBOutlet var timerLabel: UILabel!
        
        //初期化式 引数に変数を入れられないとエラー
        //現在の日付に、先ほど取得した目標日までの日数を加えると目標日になるので、これを変数に格納するという初期化式
        var toDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        
        

        @IBAction func Button(_ sender: Any) {
            
            
            //Timer.scheduledTimerはカウントダウンの機能で、 timerIntervalを1にし、1秒毎にカウントダウンが進む
            Timer.scheduledTimer(timeInterval: 1,target: self, selector: #selector(countDownViewController.timerCounter),userInfo: nil, repeats: true)
            
            
            //引数のvalueの所にpassedDays＝目標日までの日数を渡し、格納
            toDate = Calendar.current.date(byAdding: .day, value: Int(passedDays), to: Date())!

        }
        

        //TimerFunction関数を呼び、timerLabelにカウントダウンを表示
        @objc func timerCounter(){
            
            timerLabel.text = TimerFunction(setDate: toDate)
            
        }
                
        
        //TimerFunction関数では、引数setDateに目標日までの日数を渡し、その日数分のカウントダウンを返すようにしている
        func TimerFunction(setDate: Date) -> String {
            //今日の日時
            var nowDate: Date = Date()
            
            //Calendar構造体にアクセスする カレンダーのタイプにグレゴリオ暦を指定
            let calender = Calendar(identifier: .gregorian)
            //dateComponentsは2つのDate間の日数を取得するメソッド
            let timeValue = calender.dateComponents([.day, .hour, .minute, .second], from: nowDate, to: setDate)
            
            return String(format:"残り"+"%02d日:%02d時間:%02d分:%02d秒",timeValue.day!,timeValue.hour!,timeValue.minute!,timeValue.second!)
        }

    }



