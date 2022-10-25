//
//  ContentViewModel.swift
//  AquaPromptum
//
//  Created by gtxtreme on 24/10/22.
//

import Foundation
import SwiftUI


class ContentViewModel : ObservableObject {
    
    @Published var sliderTime = 0.0
    private let preferences = UserDefaults.standard
    private let reminder = Reminder()
    
    func onSliderChanged(sliderValue: Double){
        print("Slider Valued updated to \(sliderValue)")
        preferences.saveSelectedInterval(Int(sliderValue))
        startTimer()
    }
    
    func startTimer(){
        reminder.reset()
    }
}
