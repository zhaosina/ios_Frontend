//
//  HomeView.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/17.
//
import SwiftUI
struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // 顶部标题栏
                    Text("TOEFL Speaking")
                        .font(.system(size: 24, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    
                    // 主要功能模块
                    featuredModules
                    
                    // 练习模块
                    practiceModules
                    
                    // 学习资源
                    resourceModules
                }
                .padding(.vertical)
            }
            .navigationBarHidden(true)
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
    
    // 特色模块
    private var featuredModules: some View {
        VStack(spacing: 15) {
            Text("功能模块")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    moduleCard(title: "TPO口语助手",
                              icon: "waveform.path",
                              color: Color(hex: "4A90E2"),
                              destination: AnyView(TPOAssistantView()))
                    
                    moduleCard(title: "仿真练习",
                              icon: "person.wave.2",
                              color: Color(hex: "F5A623"),
                              destination: AnyView(SimulationPracticeView()))
                    
                    moduleCard(title: "口语评估",
                              icon: "chart.bar",
                              color: Color(hex: "7ED321"),
                              destination: AnyView(SpeakingEvaluationView()))
                }
                .padding(.horizontal)
            }
        }
    }
    
    // 练习模块 - 增加导航功能
    private var practiceModules: some View {
        VStack(spacing: 15) {
            Text("口语练习")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            VStack(spacing: 12) {
                NavigationLink(destination: IndependentSpeakingView()) {
                    practiceItem(title: "独立口语题", count: "42题", icon: "person.fill")
                }
                
                NavigationLink(destination: IntegratedSpeakingView()) {
                    practiceItem(title: "综合口语题", count: "38题", icon: "doc.text.fill")
                }
                
                NavigationLink(destination: CampusSpeakingView()) {
                    practiceItem(title: "校园场景题", count: "24题", icon: "building.columns.fill")
                }
            }
            .padding(.horizontal)
        }
    }
    
    // 学习资源 - 增加导航功能
    private var resourceModules: some View {
        VStack(spacing: 15) {
            Text("学习资源")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                NavigationLink(destination: SpeakingTipsView()) {
                    resourceCard(title: "口语技巧", icon: "lightbulb.fill", color: Color(hex: "BD10E0"))
                }
                
                NavigationLink(destination: VocabularyView()) {
                    resourceCard(title: "常用词汇", icon: "text.book.closed.fill", color: Color(hex: "50E3C2"))
                }
                
                NavigationLink(destination: SampleAnalysisView()) {
                    resourceCard(title: "范例解析", icon: "doc.text.magnifyingglass", color: Color(hex: "F5A623"))
                }
                
                NavigationLink(destination: SpeakingTemplatesView()) {
                    resourceCard(title: "口语模板", icon: "doc.plaintext.fill", color: Color(hex: "4A90E2"))
                }
            }
            .padding(.horizontal)
        }
    }
    
    // 功能模块卡片
    private func moduleCard(title: String, icon: String, color: Color, destination: AnyView) -> some View {
        NavigationLink(destination: destination) {
            VStack(spacing: 15) {
                Image(systemName: icon)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(color)
                    .cornerRadius(15)
                
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
            }
            .frame(width: 120, height: 130)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
        }
    }
    
    // 练习项目 - 修改为可点击的样式
    private func practiceItem(title: String, count: String, icon: String) -> some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(Color(hex: "4A90E2"))
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                Text(count)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
    
    // 资源卡片 - 修改为可点击的样式
    private func resourceCard(title: String, icon: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }
}
