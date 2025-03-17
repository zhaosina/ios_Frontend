//
//  HomeView.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/17.
//

import SwiftUI

struct HomeView: View {
    @State private var animate = false  // 控制动画状态

    var body: some View {
        VStack(spacing: 10) {
            Text("TOEFL")
                .font(.system(size: 64, weight: .bold))
                .opacity(animate ? 1.0 : 0.5)
                .offset(y: animate ? 0 : -20)
                .animation(Animation.easeOut(duration: 1.5).delay(0.2), value: animate)
            
            Text("speaking")
                .font(.system(size: 32, weight: .medium))
                .opacity(animate ? 1.0 : 0.5)
                .offset(y: animate ? 0 : 20)
                .animation(Animation.easeOut(duration: 1.5).delay(0.4), value: animate)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .onAppear {
            animate = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
