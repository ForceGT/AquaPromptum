//
//  Preferences.swift
//  AquaPromptum
//
//  Created by gtxtreme on 24/10/22.
//

import Foundation


extension UserDefaults {
    
    func isSoundEnabled() -> Bool {
        return bool(forKey: PreferenceType.sound.rawValue)
    }
    
    func isStartupLaunch() -> Bool {
        return bool(forKey: PreferenceType.startup.rawValue)
    }
    
    func saveSound(isEnabled: Bool) {
        set(isEnabled, forKey: PreferenceType.sound.rawValue)
    }
    
    func saveStartupLaunch(isEnabled: Bool) {
        set(isEnabled, forKey: PreferenceType.startup.rawValue)
    }
    
}




enum PreferenceType: String {
    case interval
    case sound
    case startup
}
