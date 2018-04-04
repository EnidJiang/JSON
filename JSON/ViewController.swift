//
//  ViewController.swift
//  JSON
//
//  Created by 蒋旖旎 on 2018/4/4.
//  Copyright © 2018年 蒋旖旎. All rights reserved.
//

import UIKit

struct Menu:Codable {
    let resultcode:String
    let reason:String
    let result:Result
    let error_code:Int
}

struct Result:Codable{
    let data:[OneData]
    let totalNum:String
    let pn:Int
    let rn:String
}

struct OneData:Codable{
    let id:String
    let title:String
    let tags:String
    let imtro:String
    let ingredients:String
    let burden:String
    let albums:[String]
    let steps:[Steps]
}
struct Steps:Codable {
    let img:String
    let step:String
}

class ViewController: UIViewController {

     var menu:Menu?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        self.tableView.estimatedRowHeight = 130
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        let settingsURl = URL(fileURLWithPath:path!)
        if let data = try? Data.init(contentsOf: settingsURl){
            menu = try? JSONDecoder().decode(Menu.self, from: data)
        }
        
        let cellNib = UINib(nibName:"menuTableViewCell",bundle:nil)
        tableView.register(cellNib, forCellReuseIdentifier: "menuTableViewCell")
    }

}
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (menu?.result.data.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuTableViewCell", for: indexPath) as! menuTableViewCell
        cell.configure(for: (menu?.result.data[indexPath.row])!)
        return cell
    }
}

