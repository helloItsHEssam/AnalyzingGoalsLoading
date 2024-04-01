//
//  MorphingCircle.swift
//  AnalyzingGoalsLoading
//
//  This file was created by Alex Dremov. For more information, you can check out the tutorial link.
//  https://alexdremov.me/swiftui-advanced-animation/

import SwiftUI

struct MorphingCircle: View & Identifiable & Hashable {

    let id = UUID()
    
    private let duration: Double
    private let points: Int
    private let size: CGFloat
    private let outerSize: CGFloat
    private let color: Color
    private let morphingRange: CGFloat
    private let strokeColor: Color
    private let strokeStyle: StrokeStyle
        
    @State private var morph: AnimatableVector = AnimatableVector.zero
    @State private var timer: Timer?
    @State private var angle: Angle = .degrees(0)
    
    init(_ size:CGFloat = 300, morphingRange: CGFloat = 30, color: Color = .red, points: Int = 4,  duration: Double = 5.0, strokeColor: Color, strokeStyle: StrokeStyle) {
        self.points = points
        self.color = color
        self.morphingRange = morphingRange
        self.duration = duration
        self.size = morphingRange * 2 < size ? size - morphingRange * 2 : 5
        self.outerSize = size
        self.strokeColor = strokeColor
        self.strokeStyle = strokeStyle
        morph = AnimatableVector(values: [])
    }

    var body: some View {
        MorphingCircleShape(morph)
            .fill(color)
            .stroke(strokeColor, style: strokeStyle)
            .frame(width: size, height: size, alignment: .center)
            .animation(Animation.easeInOut(duration: Double(duration + 1.0)), value: morph)
            .onAppear {
                update()
                timer = Timer.scheduledTimer(withTimeInterval: duration * 2, repeats: true) { timer in
                    update()
                }
                
                withAnimation(.linear(duration: 5.0).repeatForever(autoreverses: false)) {
                    angle = .degrees(360)
                }
                
            }.onDisappear {
                timer?.invalidate()
            }
            .frame(width: outerSize, height: outerSize, alignment: .center)
            .rotationEffect(angle)
    }
    
    private func morphCreator() -> AnimatableVector {
        let range = Float(-morphingRange)...Float(morphingRange)
        var morphing = Array.init(repeating: Float.zero, count: points)
        for i in 0..<morphing.count where Int.random(in: 0...1) == 0 {
            morphing[i] = Float.random(in: range)
        }
        return AnimatableVector(values: morphing)
    }
    
    private func update() {
        morph = morphCreator()
    }
    
    static func == (lhs: MorphingCircle, rhs: MorphingCircle) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

