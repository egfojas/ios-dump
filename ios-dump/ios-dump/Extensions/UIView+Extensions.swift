//
//  UIView+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // MARK: convenience accessors
    
    var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    
    var borderColor: CGColor? {
        set {
            self.layer.borderColor = newValue
        }
        get {
            return self.layer.borderColor
        }
    }

    var cornerRadius: CGFloat {
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
}


extension UIView {
    // MARK: Subviews manipulations
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func removeSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
    
    func setSubviews(hidden: Bool) {
        for subview in subviews {
            subview.isHidden = hidden
        }
    }
    
    func moveToBack() {
        superview?.sendSubviewToBack(self)
    }
    
    func moveToFront() {
        superview?.bringSubviewToFront(self)
    }

    func addCenteredSubview(_ view: UIView) {
        addSubview(view)
        if view.translatesAutoresizingMaskIntoConstraints == true {
            view.center = self.center
        }
        else {
            view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
    }
    
    func boundToSuperview(withInset inset: UIEdgeInsets? = nil) {
        guard let superview = superview else { return }
        let topInset = inset?.top ?? 0.0
        let leftInset = inset?.left ?? 0.0
        let bottomInset = inset?.bottom ?? 0.0
        let rightInset = inset?.right ?? 0.0
        
        if translatesAutoresizingMaskIntoConstraints == true {
            let x = superview.bounds.origin.x + rightInset
            let y = superview.bounds.origin.y + topInset
            let width = superview.bounds.width - leftInset
            let height = superview.bounds.height - bottomInset
            self.frame = CGRect(x: x, y: y, width: width, height: height)
        }
        else {
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leftInset).isActive = true
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -rightInset).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottomInset).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor, constant: topInset).isActive = true
        }
    }
}


extension UIView {
    // MARK: layer manipulations
    
    func makeBorder(width: CGFloat, color: CGColor) {
        self.clipsToBounds = true
        
        self.borderWidth = width
        self.borderColor = color
    }
    
    func makeRounded(corners: UIRectCorner? = nil,
                     radius: CGFloat? = nil) {
        let radius = radius ?? self.bounds.height/2.0
        self.clipsToBounds = true
        
        if let corners = corners {
            let maskPath = UIBezierPath(roundedRect: self.bounds,
                                        byRoundingCorners: corners,
                                        cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = bounds
            maskLayer.path = maskPath.cgPath
            layer.mask = maskLayer
        }
        else {
            self.cornerRadius = radius
        }
    }
    
    func makeRounded(corners: UIRectCorner? = nil,
                     radius: CGFloat? = nil,
                     borderWidth: CGFloat,
                     borderColor: CGColor) {
        makeBorder(width: borderWidth, color: borderColor)
        makeRounded(corners: corners, radius: radius)
    }
    
    func makeDashedBorder(pattern: [NSNumber]? = [1, 1],
                          width: CGFloat,
                          color: CGColor,
                          corners: UIRectCorner? = nil,
                          radius: CGFloat? = nil) {
        self.clipsToBounds = true
        
        let dottedBorderLayer = CAShapeLayer()
        dottedBorderLayer.strokeColor = color
        dottedBorderLayer.lineDashPattern = pattern
        dottedBorderLayer.frame = self.bounds
        dottedBorderLayer.fillColor = nil
        
        let radius = radius ?? self.layer.cornerRadius
        let maskPath: UIBezierPath
        if let corners = corners {
            maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        }
        else {
            maskPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        }
        
        dottedBorderLayer.path = maskPath.cgPath
        self.layer.borderWidth = width
        self.layer.addSublayer(dottedBorderLayer)
    }
}
