//
//  UIView+Extension.swift
//  RxSwiftExample
//
//  Created by Bee_MacPro on 17/05/2021.
//

import UIKit

extension UIView {
    
    func addShadow(offSet: CGSize = CGSize(width: 0, height: 0), radius: CGFloat = 4, opactity: Float = 0.3, shadowColor: UIColor = .secondary1) {
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opactity
        self.layer.shadowColor = shadowColor.cgColor
    }
    
    func set(borderWidth: CGFloat? = nil, borderColor: UIColor? = nil, cornerRadius: CGFloat? = nil) {
        if let borderWidth = borderWidth, let borderColor = borderColor {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = borderColor.cgColor
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func roundCornersAndShadow(corners: UIRectCorner,
                               cornerRadius: CGFloat,
                               fillColor: UIColor = .white,
                               offSet: CGSize = CGSize(width: 0, height: 0),
                               shadowRadius: CGFloat = 4,
                               opactity: Float = 0.3,
                               shadowColor: UIColor = .secondary1) {
        
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let shadowCornerLayer = CAShapeLayer()
        shadowCornerLayer.path = path.cgPath
        
        shadowCornerLayer.shadowOffset = offSet
        shadowCornerLayer.shadowRadius = shadowRadius
        shadowCornerLayer.shadowOpacity = opactity
        shadowCornerLayer.shadowColor = shadowColor.cgColor
        shadowCornerLayer.fillColor = fillColor.cgColor
        
        layer.insertSublayer(shadowCornerLayer, at: 0)
    }
    
    func roundCornerAndBorder(corners: UIRectCorner, radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask        = CAShapeLayer()
        mask.path       = path.cgPath
        layer.mask      = mask
        
        let borderShape             = CAShapeLayer()
        borderShape.frame           = bounds
        borderShape.path            = path.cgPath
        borderShape.strokeColor     = borderColor.cgColor
        borderShape.fillColor       = UIColor.clear.cgColor
        borderShape.lineWidth       = borderWidth
        layer.addSublayer(borderShape)
    }
    
    func drawDashLine(start p0: CGPoint, end p1: CGPoint, color: UIColor = UIColor.secondary3) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.secondary3.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [7, 3]
        
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        self.layer.sublayers?.insert(shapeLayer, at: 1)
    }
}

// MARK: - Getter

extension UIView {
    
    var width: CGFloat {
        return self.bounds.size.width
    }
    
    var height: CGFloat {
        return self.bounds.size.height
    }
    
    var x: CGFloat {
        return self.frame.origin.x
    }
    
    var y: CGFloat {
        return self.frame.origin.y
    }
    
    var bottom: CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    var right: CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
}

// MARK: - Animation

extension UIView {
    func rotate(_ angleRad: CGFloat, duration: Double = 0.3) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.transform = CGAffineTransform(rotationAngle: angleRad)
        }
    }
}

// MARK: - Gesture

extension UIView {
    
    func addTapGesture(target: Any?, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tapGesture)
    }
}
