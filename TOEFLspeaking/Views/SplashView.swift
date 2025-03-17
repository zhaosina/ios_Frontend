//
//  SplashView.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/17.
//

import SwiftUI

struct SplashView: View {
    @State private var opacity: Double = 0.3 // 初始透明度
    @State private var scale: CGFloat = 0.8 // 初始缩放比例
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // 背景色
            
            VStack {
                Text("TOEFL")
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(opacity)
                    .scaleEffect(scale)
                
                Text("Speaking")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .opacity(opacity)
                    .scaleEffect(scale)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5)) {
                opacity = 1.0 // 透明度过渡到完全可见
                scale = 1.0   // 逐渐放大到正常大小
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
