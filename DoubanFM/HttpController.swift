//
//  HttpController.swift
//  DoubanFM
//
//  Created by jzhone on 14-8-8.
//  Copyright (c) 2014年 jzhone. All rights reserved.
//

import UIKit

protocol HttpProtocol{
    func didiRecleveResults(results:NSDictionary)
}

class HttpController:NSObject{
    
    var delegate:HttpProtocol?
    
    func onSearch(url:String){
        var nsUrl: NSURL = NSURL(string: url)
        var request: NSURLRequest = NSURLRequest(URL: nsUrl)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response:NSURLResponse!, data:NSData!, error: NSError!) -> Void in
            var jsonResult:NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            self.delegate?.didiRecleveResults(jsonResult)
        })
    }
}
