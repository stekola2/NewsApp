//
//  WebviewViewController.swift
//  theNewsApp
//
//  Created by samuel tekola on 4/27/17.
//  Copyright © 2017 samuel. All rights reserved.
//

import UIKit

class WebviewViewController: UIViewController {
    
    
    @IBOutlet weak var webview: UIWebView!
    
    var url : String?
 
    override func viewDidLoad() {
        super.viewDidLoad()

        webview.loadRequest(URLRequest(url: URL(string: url!)!))
    }

 

}
