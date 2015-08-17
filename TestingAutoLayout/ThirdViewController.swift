//
//  ThirdViewController.swift
//  TestingAutoLayout
//
//  Created by Adriana Pineda on 8/17/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var settingsTest: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        self.settingsTest.setTitle("Configuraciones 2", forState: UIControlState.Normal)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func clickButton(sender: AnyObject) {
        
        if sender.titleForState(UIControlState.Normal) == "Button 3" {
            sender.setTitle("This is a very long title for my initial button", forState: UIControlState.Normal)

        } else {
            sender.setTitle("Button 3", forState: UIControlState.Normal)
        }
    }
    
}
