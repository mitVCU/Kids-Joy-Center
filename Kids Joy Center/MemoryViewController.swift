//
//  MemoryViewController.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/19/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
class arra {
    static var imgs = [1,2,3,4,5,6,1,2,3,4,5,6]
}


class MemoryViewController: UIViewController {
    var difficulty : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (makeList(n: 15))
        print(difficulty!,"how hard")
        var dif : Array<String> = []

        //defining difficulty
        if difficulty == 1 {
            dif = ["1", "2", "3"]
            arra.imgs = [1,2,3,4,5,6,1,2,3,4,5,6]
        }
        else if difficulty == 2 {
            dif = ["1", "2", "3", "4"]
            arra.imgs = [1,2,3,4,5,6,7,8,1,2,3,4,5,6,7,8]
        }
        else if difficulty == 3 {
            dif = ["1", "2", "3", "4", "5"]
            arra.imgs = [1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10]
        }

        
        // creating the mystery blocks
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        let stackView = createStackView(quant: dif)
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true


    }
    


    private func createStackView(quant: [String])-> UIStackView {
        let retStackView = UIStackView()
        retStackView.axis = .vertical
        retStackView.distribution = UIStackViewDistribution.equalSpacing
        retStackView.alignment = .center
        retStackView.spacing = 20.0
        retStackView.translatesAutoresizingMaskIntoConstraints = false

        var i = 1
        while (i <= 4) {
            let stackView = UIStackView(arrangedSubviews: createButtons(named: quant))
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .horizontal
            stackView.spacing = 20
            stackView.distribution = .fillEqually
            retStackView.addArrangedSubview(stackView)
            i = i+1
        }

        return retStackView
    }

    private func createButtons(named: [String]) -> [UIButton] {
        let image = UIImage(named: "question") as UIImage?
        var returnArr = [UIButton]()

        for name in named{
            let randomIndex = Int(arc4random_uniform(UInt32(arra.imgs.count)))
            let button = UIButton()
            button.setTitle(name, for: .normal)
            button.setImage(image, for: .normal)
            button.setBackgroundImage(UIImage(named: "\(arra.imgs[randomIndex])"), for: .normal)
            arra.imgs.remove(at: randomIndex)
            button.sizeToFit()
            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(action), for: UIControlEvents.touchUpInside)
            returnArr.append(button)
        }
        return returnArr
    }

    @objc func action(sender:UIButton!) {
        sender.setImage(nil, for: .normal)
    }
    
    func makeList(n:Int ) -> [Int] {
        var result:[Int] = []
        for _ in 0..<n {
            result.append(Int(arc4random_uniform(20) + 1))
        }
        return result.sorted()
    }
} // end of MemoryViewController class
