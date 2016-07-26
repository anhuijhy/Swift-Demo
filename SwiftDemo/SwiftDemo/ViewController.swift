//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Jason Jiang on 15/4/28.
//  Copyright (c) 2015年 Jason Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    var items  = ["first","second","third","forth","five"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        super.loadView()
        self.initLSubView()
        self.initImgV()
        self.initBtn()
        self.initSeg()
        self.initTV()
    }
    
    
    func initLSubView(){
        
        var l :UILabel = UILabel()
        l.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.5, alpha: 1.0)
        l.text = "hello"
        l.textAlignment = NSTextAlignment.Center
        l.frame = CGRect(x: 0, y: 20, width: 80, height: 40)
        self.view.addSubview(l)
    }
    
    
    func initImgV(){
        
        var imgV = UIImageView()
        imgV.backgroundColor = UIColor.blueColor()
        imgV.frame = CGRect(x: 100, y: 20, width: 100, height: 40)
        imgV.image = UIImage (named: "1")
        self.view.addSubview(imgV)
    }
    
    func initBtn(){
        
        var btn = UIButton ()
        btn.frame = CGRect(x: 210, y: 20, width: 40, height: 40)
        btn.backgroundColor = UIColor.grayColor()
        btn.addTarget(self, action: Selector("doAction:"), forControlEvents: UIControlEvents.TouchUpInside)
        btn.setTitle("title", forState: UIControlState.Normal)
        self.view.addSubview(btn)
    }
    
    func doAction(btn:UIButton){
        
        println("the action \(btn)")
        
    }
    
    func initSeg(){
        
        var attiDic :NSDictionary = [NSForegroundColorAttributeName:UIColor.grayColor(),
        ]
        var items:Array = ["item1","item2"]
        var seg:UISegmentedControl = UISegmentedControl (items: items)
        seg.frame = CGRect(x: 260, y: 20, width: 80, height: 40);
        seg.tintColor = UIColor.redColor()
        seg.setTitleTextAttributes(attiDic as [NSObject : AnyObject], forState: UIControlState.Normal)
        seg.addTarget(self, action: Selector("segAction:"), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(seg)
    }

    
    func segAction(seg:UISegmentedControl){
        
        if seg.selectedSegmentIndex == 0{
            
            println("action 0")
            
        }else{
            
            println("action 1")
        }
        
        
    }
    
    func initTV(){
        
        var tv:UITableView = UITableView ()
        tv.separatorInset = UIEdgeInsetsZero
        tv.frame = CGRectMake(0, 70, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))
        tv.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
        tv.dataSource = self
        tv.delegate = self
        self.view.addSubview(tv)
    }
    
    

    //prama marks
    //uitableView delegate and dataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = "Hello"
        cell.imageView?.image = UIImage (named:"1")
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            self.items .removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.Delete
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var delAction = UITableViewRowAction (style: UITableViewRowActionStyle.Default, title: "删除") { (rowAction , index) -> Void in
            
            println("del \(index)")
            self.items .removeAtIndex(index.row)
            tableView.deleteRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Bottom)
        }
        
        var showAction = UITableViewRowAction (style: UITableViewRowActionStyle.Default, title: "哈哈")
            { (rowAction , index) -> Void in
            
            let alert:UIAlertController = UIAlertController (title: "提示", message: "你点击可哈哈", preferredStyle: UIAlertControllerStyle.Alert)
            
            let defaultAction = UIAlertAction(title: "确定", style: UIAlertActionStyle.Default, handler: { (alertAction) -> Void in
                
                
            })
        
            
            alert.addAction(defaultAction)
            self.presentViewController(alert, animated: true, completion: { () -> Void in
                
            })

        }
        
        showAction.backgroundColor = UIColor.grayColor()
        return [delAction,showAction]
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 80
        
        
    }

}



