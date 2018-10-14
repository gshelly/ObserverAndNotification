//
//  BaseScreen.swift
//  DelegatesAndProtocol
//
//  Created by shelly.gupta on 5/29/18.
//  Copyright © 2018 shelly.gupta. All rights reserved.
//

import UIKit

let lightNotifictaionKey = "co.seanallen.lightSide"
let darkNotifictaionKey = "co.seanallen.darkSide"

class BaseScreen: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    let light = Notification.Name(rawValue: lightNotifictaionKey)
    let dark = Notification.Name(rawValue: darkNotifictaionKey)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       createObserver()
    }

    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionScreen = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionScreen
        present(selectionScreen, animated: true, completion: nil)
    }
    
    func createObserver() {
        //Light
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: light, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateBackground(notification:)), name: light, object: nil)
        
        //Dark
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateCharacterImage(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateNameLabel(notification:)), name: dark, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(BaseScreen.updateBackground(notification:)), name: dark, object: nil)
    }
    
    @objc func updateCharacterImage(notification:NSNotification) {
        let isLight = notification.name == light
        let image = isLight ? UIImage(named: "darthVader") : UIImage(named: "luke")
        mainImageView.image = image
    }
    
    @objc func updateNameLabel(notification:NSNotification) {
        let isLight = notification.name == light
        let name = isLight ? "Darth Vader" : "Luke Skywalker"
        nameLabel.text = name
    }
    
    @objc func updateBackground(notification:NSNotification) {
        let isLight = notification.name == light
        let color = isLight ? UIColor.red : UIColor.cyan
        view.backgroundColor = color
    }
}
