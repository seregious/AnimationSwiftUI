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
            
            
            VStack {
                
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.yellow)
                    .frame(width: width / 4, height: height / 4)
                    .font(.system(size: 80))
                    .rotationEffect(.degrees(animation ? 360 : 0))
                    .onAppear {
                        withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                            sun.toggle()
                        }
                    }
                Spacer()
                
                Group {
                    HStack{
                        Image(systemName: "cloud.fill")
                            .modifier(CloudOffset(animate: $animation))
                        Spacer()
                        Image(systemName: "cloud.fill")
                            .modifier(CloudOffset(animate: $animation))
                    }
                Spacer()
                HStack{
                    Image(systemName: "cloud.fill")
                        .modifier(CloudOffset(animate: $animation))
                    Spacer()
                    Image(systemName: "cloud.fill")
                        .modifier(CloudOffset(animate: $animation))
                }
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
            .frame(width: 350, height: 350)
            .background(.blue)
    }
}

struct CloudOffset: ViewModifier {
    @Binding var animate: Bool
    func body(content: Content) -> some View {
        let start = Int.random(in: 25...35)
        let finish = Int.random(in: 25...35)
        
        let startX = CGFloat(Int.random(in: -start...finish))
        let finishX = CGFloat(Int.random(in: -start...finish))

        
        let duration = Double.random(in: 5...8)
        let delay = Double.random(in: 0...1.2)
        
        content
            .offset(x: animate ? startX : finishX)
            .onAppear{
                withAnimation(.easeInOut(duration: duration).delay(delay).repeatForever(autoreverses: true)) {
                    animate.toggle()
                }
            }
    }
}
