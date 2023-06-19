//
//  DeviceTool.swift
//  ZCombinator
//
//  Created by 吴彤 on 2023/6/14.
//

import SwiftUI

class DeviceTool {
    static public func isPhone() -> Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static public func isPad() -> Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static public func isMac() -> Bool {
        UIDevice.current.userInterfaceIdiom == .mac
    }
}
