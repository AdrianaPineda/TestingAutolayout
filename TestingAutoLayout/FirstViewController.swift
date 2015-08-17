//
//  FirstViewController.swift
//  TestingAutoLayout
//
//  Created by Adriana Pineda on 8/17/15.
//  Copyright © 2015 Adriana Pineda. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var blue: UIView!
    var green: UIView!
    var red: UIView!
    
    var orange: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.initViews()
        self.createConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initViews() {
        
        // Initialize
        blue = UIView()
        green = UIView()
        red = UIView()
        orange = UIView()
        
        // Prep autolayout
        blue.translatesAutoresizingMaskIntoConstraints = false
        green.translatesAutoresizingMaskIntoConstraints = false
        red.translatesAutoresizingMaskIntoConstraints = false
        orange.translatesAutoresizingMaskIntoConstraints = false
        
        // Color
        blue.backgroundColor = UIColor.blueColor()
        green.backgroundColor = UIColor.greenColor()
        red.backgroundColor = UIColor.redColor()
        orange.backgroundColor = UIColor.orangeColor()
        
        // Add views
        self.view.addSubview(blue)
        self.view.addSubview(green)
        self.view.addSubview(red)
        
        self.view.addSubview(orange)
        
    }
    
    func createConstraints() {
        
        // Dictionary of views
        let views = NSDictionary(dictionaryLiteral: ("blue", blue), ("green", green), ("red", red))
        let metrics = NSDictionary(dictionaryLiteral: ("spacing", 10), ("lowerWidth", 100), ("higherWidth", 200), ("priority", 20), ("redBlueSpacing", 0), ("greenHeight", 40))
        
        // Horizontal constraints
        let horizontalRedBlueConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-spacing-[red(>=lowerWidth,<=higherWidth@priority)]-0-[blue(==red)]-spacing-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics as? [String: AnyObject], views: views as! [String: AnyObject])
        self.view.addConstraints(horizontalRedBlueConstraints)
        
        let horizontalGreenConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[green]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics as? [String: AnyObject], views: views as! [String: AnyObject])
        self.view.addConstraints(horizontalGreenConstraints)
        
        // Vertical constraints
        let verticalRedGreenConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[red]-spacing-[green(greenHeight)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics as? [String: AnyObject], views: views as! [String : AnyObject])
        self.view.addConstraints(verticalRedGreenConstraints)
        
        let verticalBlueGreenConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[blue]-spacing-[green(greenHeight)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics as? [String: AnyObject], views: views as! [String : AnyObject])
        self.view.addConstraints(verticalBlueGreenConstraints)
        
        // Other way to add constraints programmatically
        
        // --Width
        self.view.addConstraint(NSLayoutConstraint(item: orange, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: self.blue, attribute: NSLayoutAttribute.Width, multiplier: 0.5, constant: 0))
        
        // --Height
        self.view.addConstraint(NSLayoutConstraint(item: self.orange, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.blue, attribute: NSLayoutAttribute.Height, multiplier: 0.5, constant: 0))
        
        // --Center Horizontaly
        self.view.addConstraint(NSLayoutConstraint(item: self.orange, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.blue, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        // --Center Vertically
        self.view.addConstraint(NSLayoutConstraint(item: self.orange, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.blue, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
