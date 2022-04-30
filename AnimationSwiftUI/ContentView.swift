//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Сергей Иванчихин on 29.04.2022.
//

import SwiftUI

struct ContentView: View {
    

    
    let sky = LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            
            sky
            
            VStack {
                SkyView()
                    .frame(width: 400, height: 400)
                Spacer()
                
                
                ZStack {
                    
                    BackgroundView()
                    
                    FoxView()
                        .frame(width: 500, height: 500)
                        .offset(x: 50, y: -50)
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
