//
//  SkyView.swift
//  AnimationSwiftUI
//
//  Created by Сергей Иванчихин on 29.04.2022.
//

import SwiftUI

struct SkyView: View {
    
    @State var animation = false
    @State var sun = false
    
    var body: some View {
        GeometryReader { geomety in
            let width = geomety.size.width
            let height = geomety.size.height
            let size = min(width, height)
            
            VStack {
                
                Image(systemName: "sun.max.fill")
                    
                    .foregroundColor(.yellow)
                    .frame(width: size / 4, height: size / 4)
                    .font(.system(size: 80))
                    .rotationEffect(.degrees(animation ? 360 : 0))
                    .offset(x: 0, y: size * 0.1)
                    .onAppear {
                        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                            sun.toggle()
                        }
                    }
                Group {
                        Image(systemName: "cloud.fill")
                        .offset(x: size*0.3)
                        .modifier(CloudOffset(animate: $animation, size: size))
                            .scaleEffect(x: 1.8, y: 1.1)
                        Spacer()
                        Image(systemName: "cloud.fill")
                        .offset(x: size*0.5)
                        .modifier(CloudOffset(animate: $animation, size: size))
                            .scaleEffect(x: 1.4, y: 1)
                Spacer()
                    Image(systemName: "cloud.fill")
                        .offset(x: size*0.1)
                        .modifier(CloudOffset(animate: $animation, size: size))
                        .scaleEffect(x: 1.5, y: 0.8)
                    Spacer()
                    Image(systemName: "cloud.fill")
                        .offset(x: size*0.35)
                        .modifier(CloudOffset(animate: $animation, size: size))
                        .scaleEffect(x: 1.4, y: 1)
                }
                .foregroundColor(.white)
                .font(.system(size: 70))
                
                
            }
            .shadow(color: .black, radius: 10, x: 10, y: 10)
        }
    }
}

struct SkyView_Previews: PreviewProvider {
    static var previews: some View {
        SkyView()
            .frame(width: 350, height: 500)
            .background(.blue)
    }
}

struct CloudOffset: ViewModifier {
    @Binding var animate: Bool
    let size: CGFloat
    func body(content: Content) -> some View {


        
        let duration = rndDouble(a: 4, b: 8)
        content
            .offset(x: animate ? rndInt().start : rndInt().finish)
            .onAppear{
                withAnimation(.linear(duration: duration).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
    }
    
    private func rndDouble(a: Double, b: Double) -> Double {
        Double.random(in: a...b)
    }
    private func rndInt() -> (start: CGFloat, finish: CGFloat) {
        
        let start = CGFloat.random(in: 0...size / 2)
        let finish = CGFloat.random(in: 0...size / 2)
        
        let startX = CGFloat.random(in: -start...finish)
        let finishX = CGFloat.random(in: -start...finish)
        
        return (startX, finishX)
    }
}
