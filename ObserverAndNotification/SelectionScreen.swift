//
//  SelectionScreen.swift
//  DelegatesAndProtocol
//
//  Created by shelly.gupta on 5/29/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit

class SelectionScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rebelButton(_ sender: Any) {
        let name = Notification.Name(rawValue: lightNotifictaionKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func jediButton(_ sender: Any) {
        let name = Notification.Name(rawValue: darkNotifictaionKey)
        NotificationCenter.default.post(name: name, object: nil)
        dismiss(animated: true, completion: nil)
    }
   
}
