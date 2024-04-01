//
//  ContentView.swift
//  AnalyzingGoalsLoading
//
//  Created by HEssam on 4/1/24.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    
    @State private var scaleInnerCircle: CGFloat = 0.7
    @State private var scaleOuterCircle: CGFloat = 0.58
    @State private var scaleMorphCircle: CGFloat = 0.58
    @State private var showExplostion = false
    
    private var animationDuration: TimeInterval = 2.0
    private var animation: Animation {
        .easeInOut(duration: animationDuration)
    }
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()

            if showExplostion {
                ExplosionView()
            }
            
            MorphingCircle(260,
                           morphingRange: 10,
                           color: .clear,
                           points: 11,
                           duration: 2.0,
                           strokeColor: Color(.morphStroke),
                           strokeStyle: .init(lineWidth: 1.0, lineCap: .round, lineJoin: .bevel))
            .scaleEffect(.init(width: scaleMorphCircle, height: scaleMorphCircle))
            
            CircleProgressView()
                .scaleEffect(.init(width: scaleOuterCircle, height: scaleOuterCircle))
            
            BarContainerView()
                .scaleEffect(.init(width: scaleInnerCircle, height: scaleInnerCircle))
            
        }
        .onAppear {
            withAnimation(animation.repeatForever(autoreverses: true)) {
                scaleInnerCircle = 1.0
                scaleOuterCircle = 1.0
            }
            
            withAnimation(.easeInOut(duration: 1.7)) {
                scaleMorphCircle = 1.4
            } completion: {
                                
                withAnimation(animation.repeatForever(autoreverses: true)) {
                    scaleMorphCircle = 0.8
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.0) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    scaleInnerCircle = 0.0
                    scaleOuterCircle = 0.0
                    scaleMorphCircle = 0.0
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.4) {
                withAnimation {
                    showExplostion.toggle()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
