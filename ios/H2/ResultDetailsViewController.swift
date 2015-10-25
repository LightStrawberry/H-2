//
//  ResultDetailsViewController.swift
//  H2
//
//  Created by 谭雅威 on 15/10/24.
//  Copyright © 2015年 songguo. All rights reserved.
//

import CoreData
import UIKit
import Just
import SwiftyJSON
import AVFoundation

private let dateFormatter: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.dateStyle = .MediumStyle
    formatter.timeStyle = .ShortStyle
    return formatter
}()

class ResultDetailsViewController: UITableViewController {
    
    var avPlayer:AVPlayer!
    
    // 实例化AVPlayer
    func initAVPlayer(){
        self.avPlayer = AVPlayer(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("unblacklister", ofType: "mp3")!))
    }
    
    
    var timer:NSTimer!
 
    var managedObjectContext: NSManagedObjectContext!
   
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var musicUrlLabel: UILabel!
    
    var date = NSDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endTimeLabel.text = formatDate(date)
        HealthKit().recentSteps() { steps, error in
            self.stepLabel.text = Int(steps).description
            Just.get("http://h.shokill.com/index.php/Music/get_music/1") { (r) in
                // the same "r" is available asynchronously here
                let jsonData = JSON(r.json!)
                print(jsonData["data"]["location"])
                self.musicUrlLabel.text = String(jsonData["data"]["location"])
            }
            print(steps)
        }
        
    }
    
    func formatDate(date: NSDate) -> String {
        return dateFormatter.stringFromDate(date)
    }
    
    // 开始
    @IBAction func avPlayerStart(sender: AnyObject) {
        // 判断AVPlayer是否为空
        if let player = self.avPlayer{
            player.play()
        }else{
            // 为空则重新实例化
            self.initAVPlayer()
            self.avPlayer.play()
        }
        
    }
    
    // 暂停
    @IBAction func avPlayerPause(sender: AnyObject) {
        self.avPlayer.pause()
    }
    
    // 停止
    @IBAction func avPlayerStop(sender: AnyObject) {
        // AVPlayer没有stop的方法，所以只能先暂停，再清空
        self.avPlayer.pause()
        self.avPlayer = nil
    }
    
    @IBAction func done() { dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancel() { dismissViewControllerAnimated(true, completion: nil)
    } }