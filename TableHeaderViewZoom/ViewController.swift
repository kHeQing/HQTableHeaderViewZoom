//
//  ViewController.swift
//  TableHeaderViewZoom
//
//  Created by gandijun on 2018/5/21.
//  Copyright © 2018年 HeQing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var headerViewZoom: TableHeaderViewZoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
        let headerV = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200.0))
        headerV.image = UIImage(named: "ll.jpg")
        
        headerViewZoom = TableHeaderViewZoom(tableView: self.tableView, headerV: headerV, headerVH: 200.0)
        
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let headerViewZoom = self.headerViewZoom else { return }
        headerViewZoom.scrollViewDidScroll(scrollView: scrollView)
    }
    
}
