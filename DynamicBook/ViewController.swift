//
//  ViewController.swift
//  DynamicBook
//
//  Created by Louis Jahn on 8/7/18.
//  Copyright © 2018 Louis Jahn. All rights reserved.
//

import UIKit

enum PageType
{
    case plainText
    case url
}

struct PageContent
{
    public var content: String
    public var type: PageType
}

struct BookPage
{
    public var content: PageContent
    public var viewCtrl: UIViewController
}

class ViewController: UIViewController
{
    private var pages: Array<BookPage> = Array()
    
    private var currentPageIndex: Int = 0
    @IBOutlet weak var pageNbLabel: UILabel!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
   
    @IBAction func buttonCreatePressed(_ sender: Any)
    {
        //Show the page creation pop-up
        let viewController: PopUpController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbCreatePagePopUp") as! PopUpController
        viewController.parentCtrl = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    public func addPlainText()
    {
        //Instantiate components
        let content: PageContent = PageContent(content: "", type: PageType.plainText)
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPlainText") as! PlainTextViewController
        let newPage = BookPage(content: content, viewCtrl: viewController)

        
        //Prepare and show the newly added page
        if (pages.count > 0)
        {
            pages[currentPageIndex].viewCtrl.dismiss(animated: true, completion: nil)
        }
        pages.insert(newPage, at: currentPageIndex)
        self.present(pages[currentPageIndex].viewCtrl, animated: true, completion: nil)
        
        //Update the page indicator
        pageNbLabel.text = String(currentPageIndex + 1) + " / " + String(pages.count)
    }

}

