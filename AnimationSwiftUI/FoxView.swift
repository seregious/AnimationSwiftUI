//
//  FoxView.swift
//  AnimationSwiftUI
//
//  Created by Сергей Иванчихин on 29.04.2022.
//

import SwiftUI

struct FoxView: View {
    var body: some View {
        GeometryReader { geomety in
            let width = geomety.size.width
            let height = geomety.size.height
            let size = min(width, height)
            let cell = size / 5
            
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
            .fill(.orange)
            
            //head
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
            .stroke()
            
            //Ears
            Path { path in
                path.move(to: CGPoint(x: cell * 2, y: cell * 2.2))
                path.addCurve(
                    to: CGPoint(x: cell*1.4, y: cell*0.6),
                    control1: CGPoint(x: cell*1.2, y: cell),
                    control2: CGPoint(x: cell*1.2, y: cell)
                )
                path.addLine(to: CGPoint(x: cell*2, y: cell*1))
                path.addLine(to: CGPoint(x: cell*2.6, y: cell*0.6))
                path.addCurve(
                    to: CGPoint(x: cell * 2, y: cell * 2.2),
                    control1: CGPoint(x: cell*2.8, y: cell),
                    control2: CGPoint(x: cell*2.8, y: cell)
                )
            }
            .stroke()
            
            //body
            Path {path in
                
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
