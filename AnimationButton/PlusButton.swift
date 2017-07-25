//
//  PlusButton.swift
//  AnimationButton
//
//  Created by Danny Gim on 2017/07/25.
//  Copyright © 2017 Danny Gim. All rights reserved.
//

import UIKit

class PlusButton: UIButton {
    var plusLayer: CAShapeLayer! = CAShapeLayer()

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initLayer()
    }

    private func initLayer() {
        plusLayer.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: self.frame.height)
        plusLayer.fillColor = nil
        plusLayer.lineWidth = CGFloat(2)
        plusLayer.strokeColor = UIColor(red: 70 / 255, green: 80 / 255, blue: 99 / 255, alpha: 1.0).cgColor
        plusLayer.lineCap = kCALineCapRound
        plusLayer.masksToBounds = true

        let path = CGMutablePath()
        path.move(to: CGPoint(x: frame.width / 2.0, y: 2.0))
        path.addLine(to: CGPoint(x: frame.width / 2.0, y: frame.height - 2.0))
        path.move(to: CGPoint(x: 2.0, y: frame.height / 2.0))
        path.addLine(to: CGPoint(x: frame.width - 2.0, y: frame.height / 2.0))

        plusLayer.path = path

        self.layer.addSublayer(plusLayer)
    }

    // MARK: - Button Type
    enum ButtonType {
        case plus
        case close
    }
    var type: ButtonType = .plus {
        didSet {
            if oldValue != type {
                rotateAnimation()
            }
        }
    }

    // MARK: - Animation
    private let _rotateDegree = Double.pi / 4
    private let _duration = CFTimeInterval(0.2)

    private func rotateAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = type == .plus ? _rotateDegree : 0.0
        animation.toValue = type == .plus ? 0 : _rotateDegree
        animation.duration = _duration
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        plusLayer.add(animation, forKey: "transform.rotation")
    }
}
