//
//  AppDelegate.swift
//  AquaPromptum
//
//  Created by gtxtreme on 23/10/22.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    
    private var statusItem: NSStatusItem!
    private var popover: NSPopover!
    
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        requestNotificationPermissions()
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        if let statusButton = statusItem.button {
            statusButton.image = NSImage(named:NSImage.Name("StatusBarImage"))
            statusButton.action = #selector(togglePopover)
        }
        
        self.popover = NSPopover()
        self.popover.behavior = .transient
        self.popover.contentSize = NSSize(width: 450, height: 450)
        self.popover.contentViewController = NSHostingController(
            rootView:ContentView())
        self.popover.setValue(true, forKey: "shouldHideAnchor")
    }
    
    @objc func togglePopover() {
        
        if let button = statusItem.button {
            if popover.isShown {
                self.popover.performClose(nil)
            } else {
                popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
            }
        }
        
    }
    
    func requestNotificationPermissions(){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}
