//
//  card.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/26/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
class Card {
    internal var img : UIImage
    internal var cover: UIImage
    internal var isClicked : Bool
    
    init() {
        cover = UIImage(named: "question")!
        isClicked = false
        img = UIImage(named: "question")!
    }
    
    func toString() -> String{
        let desc = "the card id \(isClicked)"
        return desc
    }
    
    func setImg(bImg : UIImage){
        self.img = bImg
    }
    func getImg() -> String {
        return img.accessibilityIdentifier!
    }
}
