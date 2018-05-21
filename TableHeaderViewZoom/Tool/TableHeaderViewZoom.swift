//
//  TableHeaderViewZoom.swift
//  TableHeaderViewZoom
//
//  Created by gandijun on 2018/5/21.
//  Copyright © 2018年 HeQing. All rights reserved.
//

import UIKit

class TableHeaderViewZoom: NSObject {

    fileprivate var tableView: UITableView?
    fileprivate var view: UIView?
    fileprivate var viewH: Float = 0
    
    init(tableView: UITableView, headerV: UIView, headerVH: Float) {
        
        self.tableView = tableView
        self.view = headerV
        self.viewH = headerVH
        
        guard let tableView = self.tableView, let view = self.view else { return }
        
        view.frame = CGRect(x: CGFloat(0), y: CGFloat(-headerVH), width: UIScreen.main.bounds.width, height: CGFloat(headerVH))
        tableView.addSubview(view)
        tableView.sendSubview(toBack: view)
        tableView.contentInset = UIEdgeInsetsMake(CGFloat(headerVH), 0, 0, 0)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y < CGFloat(-viewH) {
         
            guard let view = self.view else { return }
            view.layer.position = CGPoint(x: UIScreen.main.bounds.width / 2.0, y: scrollView.contentOffset.y / 2.0)
            let scale = fabs(scrollView.contentOffset.y) / CGFloat(viewH)
            view.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
}
