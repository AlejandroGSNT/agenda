//
//  Table.swift
//  AgendaFinal
//
//  Created by orlando  arias on 2/22/17.
//  Copyright © 2017 orlando  arias. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var personTable: UITableView!
    var people = [NSDictionary]()
    var page = 0
    var holdPage = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.personTable.delegate = self
        self.personTable.dataSource = self
        fetchData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("personCell") as! TableViewCell
        cell.usernameLabel.text = people[indexPath.row]["username"] as? String
        return cell
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let actualPosition:CGFloat  = scrollView.contentOffset.y;
        let contentHeight:CGFloat  = scrollView.contentSize.height
        let viewHeight:CGFloat = scrollView.frame.height
        if (actualPosition + viewHeight >= contentHeight && self.holdPage == false && self.page < 3) {
            self.holdPage = true //this is used to stop this if statement from running more than once.
            self.page++
            self.fetchData()
        }
    }
    
    func fetchData(){
        let post = PostService()
        let startIndex = self.page * 20
        let data = ["startIndex":String(startIndex),"limit":"20"]
        let url = "http://*********/index.php?action=fetchPersonList"
        post.post(data, url: url) { (succeeded, msg) -> () in
            if succeeded{
                if let data = msg as? [NSDictionary]{
                    self.people = self.people + data
                    self.holdPage = false
                    self.personTable.reloadData()
                }
            }
        }
    }
}
