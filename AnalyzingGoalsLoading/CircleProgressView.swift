//
//  CircleProgressView.swift
//  AnalyzingGoalsLoading
//
//  Created by HEssam on 4/1/24.
//

import SwiftUI

struct CircleProgressView: View {
        
    @State private var degree: Angle = .degrees(260)
    
    private var animationDuration: TimeInterval = 1.5
    private var animation: Animation {
        .easeInOut(duration: animationDuration)
        .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.clear)
                .stroke(Color(.stroke), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .bevel))
                .frame(width: 250)
            
            Circle()
                .trim(from: 0.0, to: 0.1)
                .fill(.clear)
                .stroke(Color(.fillStroke), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .bevel))
                .frame(width: 250)
                .rotationEffect(degree)
        }
        .onAppear {
            withAnimation(animation) {
                degree = .degrees(620)
            }
        }
    }
}

#Preview {
    CircleProgressView()
}
