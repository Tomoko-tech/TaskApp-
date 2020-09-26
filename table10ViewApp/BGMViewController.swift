//
//  BGMViewController.swift
//  table10ViewApp
//
//  Created by Takahashi Tomoko on 2020/09/16.
//  Copyright © 2020 takatomo.com. All rights reserved.
//

import UIKit
//音を扱うクラスをインポート
import AVFoundation

class BGMViewController: UIViewController {
    //流したいBGMファイルがどういう道筋にあるかを定数musicPathに格納
    let musicPath = Bundle.main.bundleURL.appendingPathComponent("nekoMusic.mp3")
    
    var musicPlayer = AVAudioPlayer()
    
    //STARTボタンを押した時の処理
    //do catch文 musicPlayerが動作するかトライしてみて、できない時はエラーが出力される
    @IBAction func startButton(_ sender: Any) {
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: musicPath)
            //ループ再生させる
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch  {
            print("エラー")
        }
        
        //音楽STARTボタンを押した時に同時に背景画像が等間隔に切り替わるようにする
        // アニメーションの適用   imageArrayは画像を格納する配列
        imageView.animationImages = imageArray
        // アニメーション1週分の時間の長さ
        imageView.animationDuration = 8
        // 無限に繰り返し
        imageView.animationRepeatCount = 0
        // アニメーションを開始
        imageView.startAnimating()
        
    }
    
    //STOPボタン押したら音楽とアニメーションを停止
    @IBAction func stopButton(_ sender: Any) {
        musicPlayer.stop()
        
        imageView.stopAnimating()
    }
    
    
    
    //画像を格納する配列
    var imageArray:Array<UIImage> = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //画像をループする while文の書き方
        //while (ループ条件) {
        //}
        
        while let image = UIImage(named: "picture\(imageArray.count + 1)") {
            imageArray.append(image)
            
            //ボタンを角丸にする
            startButton.layer.cornerRadius = startButton.bounds.midY
            
            
            stopButton.layer.cornerRadius = 10.0
        }
    }
    
    //使用している大きなメモリの解放
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //背景画像を表示するImageView
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var stopButton: UIButton!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
