//
//  ViewController.swift
//  AnimationButton
//
//  Created by Danny Gim on 2017/07/25.
//  Copyright © 2017 Danny Gim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plusButton: PlusButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onChangeType(_ sender: UIButton) {
        plusButton.type = {
            switch sender.tag {
            case 2:
                return .close
            default:
                return .plus
            }
        }()
    }

    @IBAction func onChangeRotationDegree(_ sender: UISegmentedControl) {
        plusButton.type = .plus

        plusButton.rotateDegree = {
            switch sender.selectedSegmentIndex {
            case 1:
                return Double.pi * 3.0 / 4.0
            case 2:
                return Double.pi * 5.0 / 4.0
            case 3:
                return Double.pi * 7.0 / 4.0
            default:
                return Double.pi / 4.0
            }
        }()
    }
    @IBAction func onChangeTimeFunction(_ sender: UISegmentedControl) {
        plusButton.timeFunction = {
            switch sender.selectedSegmentIndex {
            case 1:
                return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            case 2:
                return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            case 3:
                return CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            default:
                return nil
            }
        }()
    }
    @IBAction func onChangeDamping(_ sender: UISegmentedControl) {
        plusButton.damping = CGFloat(sender.selectedSegmentIndex + 5)
    }
}

