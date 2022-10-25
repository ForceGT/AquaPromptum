//
//  ContentView.swift
//  AquaPromptum
//
//  Created by gtxtreme on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel : ContentViewModel = ContentViewModel()
    
    
    @AppStorage(PreferenceType.sound.rawValue) var playSoundToggle: Bool = false
    @AppStorage(PreferenceType.startup.rawValue) var startupToggle : Bool = true
    
    
    var body: some View {
        VStack(alignment: .center) {
            Image("water")
                .resizable()
                .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
                    .blendMode(.hardLight)
                    
            Text("AquaPromptum")
                .font(.system(size: CGFloat(24)))
            
            HStack(alignment: .center){
                VStack{
                    Text("Notify me every:")
                        .font(.callout)
                    Text("\(UserDefaults.standard.intervalAsString())")
                }.padding()
                
                Slider(value: $viewModel.sliderTime, in: 0...4, step: 1)
                    .onReceive(viewModel.$sliderTime,
                               perform: {value in
                        viewModel.onSliderChanged(sliderValue: value)
                    })
                
            }
            Spacer().frame(height: 20)
            Toggle("Play Sound", isOn: $playSoundToggle)
                .toggleStyle(SwitchToggleStyle())
            Divider()
            Toggle("Launch on Startup", isOn: $startupToggle)
                .toggleStyle(SwitchToggleStyle())
            Spacer().frame(height: 50)
            Text("Made with ❤️ in India")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
