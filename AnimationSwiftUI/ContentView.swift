//
//  ContentView.swift
//  AnimationSwiftUI
//
//  Created by Сергей Иванчихин on 29.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    let grass = LinearGradient(colors: [.green, .mint], startPoint: .leading, endPoint: .trailing)
    
    let sky = LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            
            sky
            
            VStack {
                SkyView()
                    .frame(width: 300, height: 300)
                Spacer()
                Ellipse()
                    .fill(grass)
                    .rotationEffect(.degrees(90))
                    //.offset(x: 0, y: UIScreen.main.bounds.height / 2)
                    .shadow(color: .black, radius: 10, x: 10, y: 10)
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
