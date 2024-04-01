//
//  BarContainerView.swift
//  AnalyzingGoalsLoading
//
//  Created by HEssam on 4/1/24.
//

import SwiftUI

struct BarContainerView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [
                        Color(.gradient1),
                        Color(.gradient2)
                    ], startPoint: .top, endPoint: .bottomTrailing)
                )
                .frame(width: 150)
            
            BarsView()
        }
    }
}

#Preview {
    BarContainerView()
}
