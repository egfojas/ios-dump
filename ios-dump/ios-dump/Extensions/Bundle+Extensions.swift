//
//  Bundle+Extensions.swift
//  ios-dump
//
//  Created by Edgar Allan Fojas on 30/8/19.
//  Copyright © 2019 Edgar Allan Fojas. All rights reserved.
//

import Foundation

extension Bundle {
    var identifier: String? {
        return object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }
    
    var name: String? {
        return object(forInfoDictionaryKey: "CFBundleName") as? String
    }
    
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    var version: String? {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
    
    var shortVersion: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    var infoDictionaryVersion: String? {
        return object(forInfoDictionaryKey: "CFBundleInfoDictionaryVersion") as? String
    }

    var executable: String? {
        return object(forInfoDictionaryKey: "CFBundleExecutable") as? String
    }
    
    var packageType: String? {
        return object(forInfoDictionaryKey: "CFBundlePackageType") as? String
    }
    
    var developmentRegion: String? {
        return object(forInfoDictionaryKey: "CFBundleDevelopmentRegion") as? String
    }
}
