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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageIndicator: UILabel!
    
    private var pages: Array<BookPage> = Array()
    
    private var currentPageIndex: Int = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func swipedRight(_ sender: Any)
    {
        if (pages.count == 1)
        { return }
        
        containerView.subviews[0].removeFromSuperview()
        currentPageIndex = (currentPageIndex == pages.count - 1 ? 0 : currentPageIndex + 1)
        containerView.addSubview(pages[currentPageIndex].viewCtrl.view)
        
        pageIndicator.text = String(currentPageIndex + 1) + " / " + String(pages.count)
    }
    
    @IBAction func swipedLeft(_ sender: Any)
    {
        if (pages.count == 1)
        { return }
        
        containerView.subviews[0].removeFromSuperview()
        currentPageIndex = (currentPageIndex == 0 ? pages.count - 1 : currentPageIndex - 1)
        containerView.addSubview(pages[currentPageIndex].viewCtrl.view)
        
        pageIndicator.text = String(currentPageIndex + 1) + " / " + String(pages.count)
    }
    
    @IBAction func screenEdgeDetected(_ sender: Any) {
        //Show the page creation pop-up
        let viewController: PopUpController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbCreatePagePopUp") as! PopUpController
        viewController.parentCtrl = self
        self.present(viewController, animated: true, completion: nil)
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

        
        //Show the newly added page
        pages.insert(newPage, at: currentPageIndex)
        if (containerView.subviews.count > 0)
        {
            containerView.subviews[0].removeFromSuperview()
        }
        containerView.addSubview(pages[currentPageIndex].viewCtrl.view)

        //Update the page indicator
        pageIndicator.text = String(currentPageIndex + 1) + " / " + String(pages.count)
    }
    
    public func addWebView()
    {
        //Instantiate components
        let content: PageContent = PageContent(content: "", type: PageType.plainText)
        let viewController: UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbWeb") as! WebViewController
        let newPage = BookPage(content: content, viewCtrl: viewController)
        
        //Show the newly added page
        pages.insert(newPage, at: currentPageIndex)
        if (containerView.subviews.count > 0)
        {
            containerView.subviews[0].removeFromSuperview()
        }
        containerView.addSubview(pages[currentPageIndex].viewCtrl.view)
        
        //Update the page indicator
        pageIndicator.text = String(currentPageIndex + 1) + " / " + String(pages.count)
    }

}

