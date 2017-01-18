//
//  ExtensionHelper.swift
//  MeetTheTeam
//
//  Created by Anoop tomar on 1/17/17.
//  Copyright © 2017 Devtechie. All rights reserved.
//

import UIKit
extension UIImageView {
    
    func loadImageUsingUrlString(urlString: String) {
        let url = URL(string: urlString)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.image = nil
        
        if let imageCache = appDelegate.imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if err != nil {
                print(err!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                appDelegate.imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                self.image = imageToCache
            }
        }.resume()
    }
}

extension UIFont {
    class func DancingScriptFont() -> UIFont{
        return UIFont(name: "DancingScript", size: 14)!
    }
}
