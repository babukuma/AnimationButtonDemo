//
//  ViewController.swift
//  AnimationButton
//
//  Created by Danny Gim on 2017/07/25.
//  Copyright © 2017 Danny Gim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var animationButton: PlusButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onChangeType(_ sender: UIButton) {
        animationButton.type = {
            switch sender.tag {
            case 2:
                return .close
            default:
                return .plus
            }
        }()
    }
}

