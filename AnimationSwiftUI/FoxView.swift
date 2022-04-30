//
//  FoxView.swift
//  AnimationSwiftUI
//
//  Created by Сергей Иванчихин on 29.04.2022.
//

import SwiftUI

struct FoxView: View {
    
    @State var animateTail = false
    @State var animateHead = false
    @State var animateEars = false
    let foxColor1 = Color("fox1")
    let foxColor2 = Color("fox2")
    let foxColor3 = Color("fox3")
    let foxLeg = Color("foxLeg")
    var body: some View {
        
        GeometryReader { geomety in
            let width = geomety.size.width
            let height = geomety.size.height
            let size = min(width, height)
            let cell = size / 5
            
            Group {
                //legs
                Path {path in
                    path.move(to: CGPoint(x: cell*1.65, y: cell*3))
                    path.addLine(to: CGPoint(x: cell*1.75, y: cell*4.1))
                    path.addLine(to: CGPoint(x: cell*2.3, y: cell*4.1))
                    path.addLine(to: CGPoint(x: cell*2.3, y: cell*3.3))
                }
                .strokeAndFill(foxLeg)
                
                //chest
                Path {path in
                    path.move(to: CGPoint(x: cell*1.6, y: cell*2))
                    path.addCurve(
                        to: CGPoint(x: cell*2.6, y: cell*3.5),
                        control1: CGPoint(x: cell*1.5, y: cell*3.0),
                        control2: CGPoint(x: cell*1.5, y: cell*3.3)
                    )
                    path.addLine(to: CGPoint(x: cell*2.4, y: cell*2))
                }
                .strokeAndFill(.white)
                .scaleEffect(x: animateHead ? 0.95 : 1, y: animateHead ? 1 : 0.95)
                
                //head
                Group {
                    Path { path in
                        path.move(to: CGPoint(x: cell * 2, y: cell * 2.2))
                        path.addLine(to: CGPoint(x: cell*1.2, y: cell*1.8))
                        path.addCurve(
                            to: CGPoint(x: cell*2.8, y: cell*1.8),
                            control1: CGPoint(x: cell*2, y: cell*0.5),
                            control2: CGPoint(x: cell*2.2, y: cell)
                        )
                        path.addLine(to: CGPoint(x: cell * 2, y: cell * 2.2))
                        
                    }
                    .strokeAndFill(.white)
                
                
                //Ears
                    Group {
                        Path { path in
                        path.move(to: CGPoint(x: cell * 2, y: cell * 2.2))
                        path.addCurve(
                            to: CGPoint(x: cell*1.4, y: cell*0.6),
                            control1: CGPoint(x: cell*1.2, y: cell),
                            control2: CGPoint(x: cell*1.2, y: cell)
                        )
                        path.addCurve(
                            to: CGPoint(x: cell*2.6, y: cell*0.6),
                            control1: CGPoint(x: cell*1.4, y: cell*0.5),
                            control2: CGPoint(x: cell*1.9, y: cell*1.5)
                        )
                        path.addCurve(
                            to: CGPoint(x: cell * 2, y: cell * 2.2),
                            control1: CGPoint(x: cell*2.8, y: cell),
                            control2: CGPoint(x: cell*2.8, y: cell)
                        )
                    }
                        .strokeAndFill(.white)
                    
                
                
                //ears tip
                Path {path in
                    path.move(to: CGPoint(x: cell*1.4, y: cell*0.6))
                    path.addCurve(
                        to: CGPoint(x: cell*2.6, y: cell*0.6),
                        control1: CGPoint(x: cell*1.4, y: cell*0.5),
                        control2: CGPoint(x: cell*1.9, y: cell*1.5)
                    )
                    path.addCurve(
                        to: CGPoint(x: cell*1.4, y: cell*0.6),
                        control1: CGPoint(x: cell*2, y: cell*1.6),
                        control2: CGPoint(x: cell*1.35, y: cell*0.6)
                    )
                }
                .strokeAndFill(foxColor1)
                    }
                    .scaleEffect(x: 1, y: animateEars ? 1 : 0.98)
                
                //face
                Path { path in
                    path.move(to: CGPoint(x: cell * 2, y: cell * 2.2))
                    path.addLine(to: CGPoint(x: cell*1.5, y: cell*1.4))
                    path.addCurve(
                        to: CGPoint(x: cell*2.5, y: cell*1.4),
                        control1: CGPoint(x: cell*2, y: cell*0.5),
                        control2: CGPoint(x: cell*2.6, y: cell*1.5)
                    )
                    path.addLine(to: CGPoint(x: cell * 2, y: cell * 2.2))
                }
                .strokeAndFill(Color("fox1"))
                }
                .rotationEffect(.degrees(animateHead ? 0 : 1), anchor: .bottom)
                
                
                //back 1
                Path {path in
                    path.move(to: CGPoint(x: cell*2.3, y: cell*2.1))
                    path.addCurve(
                        to: CGPoint(x: cell*3.1, y: cell*2.9),
                        control1: CGPoint(x: cell*2.8, y: cell*2.2),
                        control2: CGPoint(x: cell*3, y: cell*2.5)
                    )
                    path.addLine(to: CGPoint(x: cell*2.1, y: cell*4))
                    path.addLine(to: CGPoint(x: cell*2.3, y: cell*2.1))
                }
                .strokeAndFill(Color("fox1"))
                
                
                //back 2
                Path { path in
                    path.move(to: CGPoint(x: cell*3.13, y: cell*2.8))
                    path.addCurve(
                        to: CGPoint(x: cell*3, y: cell*4.2),
                        control1: CGPoint(x: cell*3.4, y: cell*4.2),
                        control2: CGPoint(x: cell*2.9, y: cell*4.2)
                    )
                    path.addLine(to: CGPoint(x: cell*1.5, y: cell*4.1))
                    path.addCurve(
                        to: CGPoint(x: cell*3.13, y: cell*2.8),
                        control1: CGPoint(x: cell*2.9, y: cell*3.4),
                        control2: CGPoint(x: cell*2.5, y: cell*3.4)
                    )
                }
                .strokeAndFill(Color("fox2"))
                
                //tail
                Path {path in
                    path.move(to: CGPoint(x: cell*3.2, y: cell*4))
                    path.addCurve(
                        to: CGPoint(x: cell*1.5, y: cell*4.9),
                        control1: CGPoint(x: cell*2.6, y: cell*5),
                        control2: CGPoint(x: cell*1.9, y: cell*5)
                    )
                    path.addLine(to: CGPoint(x: cell*1.4, y: cell*4))
                    path.addCurve(
                        to: CGPoint(x: cell*3.2, y: cell*4),
                        control1: CGPoint(x: cell*2, y: cell*4.2),
                        control2: CGPoint(x: cell*3, y: cell*4.2)
                    )
                }
                .strokeAndFill(Color("fox3"))
                .rotationEffect(.degrees(animateTail ? 0 : 2), anchor: .trailing)
                
                //tail's tip
                Path {path in
                    path.move(to: CGPoint(x: cell*1.5, y: cell*4.9))
                    path.addCurve(
                        to: CGPoint(x: cell*0.5, y: cell*3.2),
                        control1: CGPoint(x: cell*0, y: cell*4),
                        control2: CGPoint(x: cell*0.4, y: cell*3.5)
                    )
                    path.addCurve(
                        to: CGPoint(x: cell*1.5, y: cell*4.9),
                        control1: CGPoint(x: cell*1.5, y: cell*3.9),
                        control2: CGPoint(x: cell*1.5, y: cell*4)
                    )
                }
                .strokeAndFill(.white)
                .rotationEffect(.degrees(animateTail ? 0 : 2), anchor: .trailing)
                
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    animateTail.toggle()
                }
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                    animateHead.toggle()
                }
                withAnimation(.easeIn(duration: 1.5) .repeatForever(autoreverses: true)) {
                    animateEars.toggle()
                }
            }
        }
    }
}

struct FoxView_Previews: PreviewProvider {
    static var previews: some View {
        FoxView()
            .frame(width: 300, height: 300)
    }
}

extension Shape {
    func strokeAndFill(_ color: Color) -> some View {
        self
            .stroke()
            .background{
                self
                    .fill(color)
                    .shadow(color: .black.opacity(0.8), radius: 10)

            }
    }
}
