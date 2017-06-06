//
//  MenuManager.swift
//  theNewsApp
//
//  Created by samuel tekola on 4/27/17.
//  Copyright © 2017 samuel. All rights reserved.
//


import UIKit

class MenuManager: NSObject, UITableViewDelegate, UITableViewDataSource {
    let blackView = UIView()
    let menuTableView = UITableView()
    let arrayOfSources = ["bbc-news", "al-jazeera-english"]
    var theVC: ViewController?
    public func OpenMenu()
    {
        if let window = UIApplication.shared.keyWindow
        {
            blackView.frame = window.frame
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.addGestureRecognizer(UITapGestureRecognizer( target: self, action: #selector(self.dissmissMenu) ))
            let height: CGFloat = 100
            let y = window.frame.height - height
            menuTableView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            window.addSubview(blackView)
            window.addSubview(menuTableView)
            UIView.animate(withDuration: 0.5, animations: {
                self.blackView.alpha = 1
                self.menuTableView.frame.origin.y = y
            })
        }
        
    }
    
    public  func dissmissMenu()
    {
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow{
            self.menuTableView.frame.origin.y = window.frame.height
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfSources.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as UITableViewCell
        cell.textLabel?.text = arrayOfSources[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = theVC {
           vc.source = arrayOfSources[indexPath.item].lowercased()
           vc.fetchArticles(fromSource: arrayOfSources[indexPath.item].lowercased())
            dissmissMenu() 
        }
    }
    override init()
    {
        super.init()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.isScrollEnabled = false
        menuTableView.bounces  = false
        menuTableView.register(BaseViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        
        
        
    }

}
