//
//  ScorecardNavigationController.swift
//  Golf League
//
//  Created by Andrew Motika on 12/30/17.
//  Copyright © 2017 Andrew Motika. All rights reserved.
//

import UIKit

class ScorecardNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        print(viewControllers)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func show(_ vc: UIViewController, sender: Any?) {
        print("in show")
        print(viewControllers)
        
        super.show(vc, sender: sender)
        
        //self.performSegue(withIdentifier: "RoundToScorecardSegue", sender: self)
    }
    
    //MARK: UINavigationControllerDelegate
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
