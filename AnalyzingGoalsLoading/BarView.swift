//
//  BarView.swift
//  AnalyzingGoalsLoading
//
//  Created by HEssam on 4/1/24.
//

import SwiftUI

struct BarsView: View {
    
    @State private var bar1HeightPercent: CGFloat = 0.4
    @State private var bar2HeightPercent: CGFloat = 1.0
    @State private var bar3HeightPercent: CGFloat = 0.2
    private let maxHeight: CGFloat = 50
    
    private var animationDuration: TimeInterval = 0.42
    private var animation: Animation {
        .easeOut(duration: animationDuration)
        .repeatForever(autoreverses: true)
    }
    
    var body: some View {
        ZStack {
            HStack(alignment: .bottom, spacing: 6) {
                Bar(height: maxHeight * bar1HeightPercent)
                    .stroke(.white, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .bevel))
                    .fill(.white)
                    .frame(width: 12, height: maxHeight)
                    .offset(CGSize(width: 0, height: -2))
                
                Bar(height: maxHeight * bar2HeightPercent)
                    .stroke(.white, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .bevel))
                    .fill(.white)
                    .frame(width: 12, height: maxHeight)
                    .offset(CGSize(width: 0, height: -2))
                
                Bar(height: maxHeight * bar3HeightPercent)
                    .stroke(.white, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .bevel))
                    .fill(.white)
                    .frame(width: 12, height: maxHeight)
                    .offset(CGSize(width: 0, height: -2))
            }
        }
        .onAppear {
            withAnimation(animation) {
                bar2HeightPercent = 0.3
                bar3HeightPercent = 0.7
            }
            
            withAnimation(animation.delay(animationDuration / 2)) {
                bar1HeightPercent = 0.1
            }
        }
    }
}

struct Bar: Shape {
    var height: CGFloat

    var animatableData: CGFloat {
        get { height }
        set { height = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.height - height))
        path.addLine(to: .init(x: rect.minX, y: rect.height - height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    BarsView()
}
