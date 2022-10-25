//
//  AquaPromptumApp.swift
//  AquaPromptum
//
//  Created by gtxtreme on 23/10/22.
//

import SwiftUI

@main
struct AquaPromptumApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        Settings{
            EmptyView().frame(width: .zero)
        }
    }
}

