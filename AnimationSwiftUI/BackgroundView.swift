//
//  BackgroundView.swift
//  AnimationSwiftUI
//
//  Created by Сергей Иванчихин on 30.04.2022.
//

import SwiftUI

struct BackgroundView: View {
    let grass = LinearGradient(colors: [.green, .mint], startPoint: .leading, endPoint: .trailing)
    var body: some View {
        
        GeometryReader {geomety in
            let width = geomety.size.width
            let height = geomety.size.height
            let size = min(width, height)
            
            ZStack {
                
                Ellipse()
                    .fill(grass)
                    .rotationEffect(.degrees(90))
                    .offset(x: size / 3, y: size / 2.5)
                    .shadow(color: .black, radius: 10)
                    .scaleEffect(x: 1, y: 1)
                
                Ellipse()
                    .fill(grass)
                    .rotationEffect(.degrees(90))
                    .offset(x: -size / 4, y: size / 3)
                    .shadow(color: .black, radius: 10)
                    .scaleEffect(x: 1.3, y: 1)
                
                Ellipse()
                    .fill(grass)
                    .rotationEffect(.degrees(90))
                    .offset(x: 0, y: size / 2)
                    .shadow(color: .black, radius: 10)
                    .scaleEffect(x: 1.3, y: 1)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .frame(width: 400, height: 400)
    }
}
