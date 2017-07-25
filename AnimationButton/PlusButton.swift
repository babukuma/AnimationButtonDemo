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
    override func layoutSubviews() {
        super.layoutSubviews()

        initLayer()
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
    var rotateDegree = Double.pi / 4
    var timeFunction: CAMediaTimingFunction?
    var damping: CGFloat = 5
    private let _duration = CFTimeInterval(0.2)

    private func rotateAnimation() {
        let animation = CASpringAnimation(keyPath: "transform.rotation")
        animation.fromValue = type == .plus ? rotateDegree : 0.0
        animation.toValue = type == .plus ? 0 : rotateDegree
        animation.duration = _duration
        animation.damping = damping
        animation.duration = animation.settlingDuration
        if let timeFunction = timeFunction {
            animation.timingFunction = timeFunction
        }
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        plusLayer.add(animation, forKey: "transform.rotation")
    }
}
