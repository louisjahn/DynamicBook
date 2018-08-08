//
//  PopUpController.swift
//  DynamicBook
//
//  Created by Louis Jahn on 8/8/18.
//  Copyright © 2018 Louis Jahn. All rights reserved.
//

import UIKit

class PopUpController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        print("Cancel")
    }
    
}
