//
//  PopUpController.swift
//  DynamicBook
//
//  Created by Louis Jahn on 8/8/18.
//  Copyright © 2018 Louis Jahn. All rights reserved.
//

import UIKit

class PopUpController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    public var parentCtrl: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.clipsToBounds = true
        popUpView.layer.cornerRadius = 10
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func textBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        parentCtrl?.addPlainText()
    }
    
}
