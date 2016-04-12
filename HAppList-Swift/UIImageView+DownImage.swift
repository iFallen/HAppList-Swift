//
//  UIImageView+DownImage.swift
//  HAppList-Swift
//
//  Created by JuanFelix on 4/12/16.
//  Copyright © 2016 JuanFelix. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageWithURL(url: NSURL) -> NSURLSessionDownloadTask {
        let session = NSURLSession.sharedSession()
        let downloadTask = session.downloadTaskWithURL(url) { [weak self] url, response, error in
            if error == nil, let url = url, data = NSData(contentsOfURL: url), image = UIImage(data: data) {
                dispatch_async(dispatch_get_main_queue(), {
                    if let strongSelf = self {
                        strongSelf.image = image
                    }
                })
            }
        }
        downloadTask.resume()
        return downloadTask
    }
}