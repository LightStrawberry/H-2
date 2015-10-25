//
//  FirstViewController.swift
//  H2
//
//  Created by 谭雅威 on 15/10/24.
//  Copyright © 2015年 songguo. All rights reserved.
//

import UIKit
import HealthKit
import CoreData


class FirstViewController: UIViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    var step = 0
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var startTimeDisplayLabel: UILabel!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var endTimeDisplayLabel: UILabel!
    @IBOutlet weak var stepCountLabel: UILabel!
    @IBOutlet weak var stepCountDisplayLabel: UILabel!
    
    @IBAction func getStartTime(sender: UIButton) {
        let nowDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.stringFromDate(nowDate)
        startTimeDisplayLabel.text = dateString
    }
    
    @IBAction func getEndTime(sender: UIButton) {
        let nowDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = formatter.stringFromDate(nowDate)
        endTimeDisplayLabel.text = dateString
        
        HealthKit().recentSteps() { steps, error in
            self.step = Int(steps)
        }
        
        stepCountDisplayLabel.text = step.description
        
    }
    
    
    @IBAction func buildButton(sender: UIButton) {
        print(stepCountDisplayLabel.text!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Build" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ResultDetailsViewController
            
            controller.managedObjectContext = managedObjectContext
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

