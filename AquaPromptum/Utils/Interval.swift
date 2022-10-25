//
//  Interval.swift
//  AquaPromptum
//
//  Created by gtxtreme on 24/10/22.
//

import Foundation
import SwiftUI

extension Binding where Value == Int {
    public func float() -> Binding<Float> {
        return Binding<Float>(get:{ Float(self.wrappedValue) },
            set: { self.wrappedValue = Int($0)})
    }
}

extension UserDefaults {
    
    private func selectedInterval() -> Int {
        return integer(forKey: PreferenceType.interval.rawValue)
    }
    
    func saveSelectedInterval(_ interval: Int) {
        set(interval, forKey: PreferenceType.interval.rawValue)
    }
    
    func intervalAsSeconds() -> Double {
        var mins = 0
        switch selectedInterval() {
        case 0:
            mins = 30
        case 1:
            mins = 45
        case 2:
            mins = 60
        case 3:
            mins = 90
        case 4:
            mins = 120
        default:
            break
        }
        
        return Double(mins * 60)
    }
    
    func intervalAsString() -> String {
        
        var time = ""
        switch selectedInterval() {
        case 0:
            time = "30 mins"
        case 1:
            time = "45 mins"
        case 2:
            time = "1 hour"
        case 3:
            time = "1.5 hours"
        case 4:
            time = "2 hours"
        default:
            break
        }
        
        return time
    }
}
