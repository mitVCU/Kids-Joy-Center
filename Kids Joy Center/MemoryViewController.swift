//
//  MemoryViewController.swift
//  Kids Joy Center
//
//  Created by Mit Amin on 3/19/18.
//  Copyright © 2018 Mit Amin. All rights reserved.
//

import UIKit
struct arra {
    let mvc = MemoryViewController()
    if
    static var imgs = [1,2,3,4,5,6,1,2,3,4,5,6 ]

}

class MemoryViewController: UIViewController {
    var difficulty : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(difficulty!,"how hard")
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        let stackView1 = UIStackView(arrangedSubviews: createButtons( named: "1", "2", "3"))
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.axis = .vertical
        stackView1.spacing = 20
        stackView1.distribution = .fillEqually
        
        let stackView2 = UIStackView(arrangedSubviews: createButtons( named: "1", "2", "3") )
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .vertical
        stackView2.spacing = 20
        stackView2.distribution = .fillEqually
        
        let stackView3 = UIStackView(arrangedSubviews: createButtons( named: "1", "2", "3") )
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.axis = .vertical
        stackView3.spacing = 20
        stackView3.distribution = .fillEqually
        
        let stackView4 = UIStackView(arrangedSubviews: createButtons(named: "1", "2", "3") )
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        stackView4.axis = .vertical
        stackView4.spacing = 20
        stackView4.distribution = .fillEqually
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = UIStackViewDistribution.equalSpacing
        stackView.alignment = .center
        stackView.spacing = 20.0
        
        stackView.addArrangedSubview(stackView1)
        stackView.addArrangedSubview(stackView2)
        stackView.addArrangedSubview(stackView3)
        stackView.addArrangedSubview(stackView4)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
  
    private func createButtons(named: String...) -> [UIButton] {
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
        
//        return named.map{name in
//            let button = UIButton()
//            button.setImage(image, for: .normal)
//            button.sizeToFit()
//            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
//            button.heightAnchor.constraint(equalToConstant: 100).isActive = true
//            button.translatesAutoresizingMaskIntoConstraints = false
//            button.setTitleColor(.white, for: .normal)
//            button.addTarget(self, action: #selector(action), for: UIControlEvents.touchUpInside)
//            return button
//        }
        
    }



//    @objc func buttonClicked(btn: UIButton){
//        print("we made it")
//        btn.alpha = 0.5
//    }
    @objc func action(sender:UIButton!) {
        sender.setImage(nil, for: .normal)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
