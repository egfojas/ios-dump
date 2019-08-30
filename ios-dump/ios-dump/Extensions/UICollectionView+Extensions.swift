//
//  UICollectionView+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView, T: NibView {
        register(T.nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerReusableSupplementaryView<T: UIView>(_: T.Type) where T: ReusableView {
        self.register(T.self, forSupplementaryViewOfKind: T.defaultReuseIdentifier, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerReusableSupplementaryView<T: UIView>(_: T.Type) where T: ReusableView, T: NibView {
        self.register(T.nib, forSupplementaryViewOfKind: T.defaultReuseIdentifier, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(indexPath: NSIndexPath) -> T where T: ReusableView {
        guard let view = self.dequeueReusableSupplementaryView(ofKind: T.defaultReuseIdentifier,
                                                               withReuseIdentifier: T.defaultReuseIdentifier,
                                                               for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue supplementaryView with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return view
    }
    
    func dequeueCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T  where T:ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
