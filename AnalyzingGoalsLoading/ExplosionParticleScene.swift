//
//  ExplosionParticleScene.swift
//  AnalyzingGoalsLoading
//
//  Created by HEssam on 4/1/24.
//

import SwiftUI
import SpriteKit

final class ExplosionParticleScene: SKScene {
    private let snowEmitterNode = SKEmitterNode(fileNamed: "explosion.sks")
    
    override func didMove(to view: SKView) {
        guard let snowEmitterNode = snowEmitterNode else { return }
        addChild(snowEmitterNode)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
}

struct ExplosionView: View {
    
    private var scene: SKScene {
        let scene = ExplosionParticleScene()
        scene.scaleMode = .resizeFill
        scene.backgroundColor = .clear
        return scene
    }
    
    var body: some View {
        ZStack {
            SpriteView(scene: scene, options: [.allowsTransparency])
                .frame(width: 400, height: 400)
        }
    }
}

#Preview {
    ExplosionView()
}
