//
//  ViewController.swift
//  DynamicBook
//
//  Created by Louis Jahn on 8/7/18.
//  Copyright © 2018 Louis Jahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBAction func buttonCreatePressed(_ sender: Any) {
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbCreatePagePopUp")
        self.present(viewController, animated: true, completion: nil)
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

