//
//  UIStackView+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    
    func removeArrangedSubviews() {
        for subview in arrangedSubviews {
            subview.removeFromSuperview()
        }
    }
    
    func setArrangedSubviews(hidden: Bool) {
        for subview in arrangedSubviews {
            subview.isHidden = hidden
        }
    }
}
