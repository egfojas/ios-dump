//
//  UITableView+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView, T: NibView {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    func registerReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_: T.Type) where T: ReusableView, T: NibView {
        self.register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeReusableCell<T: UITableViewCell>() -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue table cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier,
                                             for: indexPath as IndexPath) as? T else {
                                                fatalError("Could not dequeue table cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>() -> T where T: ReusableView {
        guard let view  = self.dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else{
            fatalError("Could not dequeue view with identifier: \(T.reuseIdentifier)")
        }
        
        return view
    }
}
