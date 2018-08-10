//
//  WebViewController.swift
//  DynamicBook
//
//  Created by Louis Jahn on 8/10/18.
//  Copyright © 2018 Louis Jahn. All rights reserved.
//

import UIKit

class WebViewController: UIViewController
{
    
    @IBOutlet weak var webAdress: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func webAdressReturned(_ sender: Any)
    {
        webView.loadRequest(URLRequest(url: URL(string: webAdress.text!)!))
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

}
