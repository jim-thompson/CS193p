//
//  PieView.swift
//  Memorize
//
//  Created by Jim Thompson on 6/6/21.
//

import SwiftUI

struct PieView: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var direction: Bool = false
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let start = CGPoint(
            x: center.x + (radius * CGFloat(cos(startAngle.radians))),
            y: center.y + (radius * CGFloat(sin(startAngle.radians)))
        )
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: direction)
        p.addLine(to: center)
        
        return p
    }
}
