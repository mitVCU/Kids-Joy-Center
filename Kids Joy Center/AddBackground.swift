//
//  AddBackground.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/28/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func addBackground(image:String) {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        print("height: ", height, "width: ", width)
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 160, width: width, height: 608))
        imageViewBackground.image = UIImage(named: image)
        
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubview(toBack: imageViewBackground)
    }}
