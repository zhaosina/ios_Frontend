//
//  PracticeView.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/17.
//

import SwiftUI

// 集成口语题页面
struct IntegratedSpeakingView: View {
    var body: some View {
        // 类似IndependentSpeakingView的实现，但针对综合口语题
        Text("综合口语题内容")
            .navigationTitle("综合口语题")
    }
}

// 校园场景题页面
struct CampusSpeakingView: View {
    var body: some View {
        // 类似IndependentSpeakingView的实现，但针对校园场景题
        Text("校园场景题内容")
            .navigationTitle("校园场景题")
    }
}


// 仿真练习页面
struct SimulationPracticeView: View {
    var body: some View {
        Text("仿真练习内容")
            .navigationTitle("仿真练习")
    }
}

// 口语评估页面
struct SpeakingEvaluationView: View {
    var body: some View {
        Text("口语评估功能")
            .navigationTitle("口语评估")
    }
}

// 口语技巧页面
struct SpeakingTipsView: View {
    var body: some View {
        Text("口语技巧内容")
            .navigationTitle("口语技巧")
    }
}

// 常用词汇页面
struct VocabularyView: View {
    var body: some View {
        Text("常用词汇列表")
            .navigationTitle("常用词汇")
    }
}

// 范例解析页面
struct SampleAnalysisView: View {
    var body: some View {
        Text("范例解析内容")
            .navigationTitle("范例解析")
    }
}

// 口语模板页面
struct SpeakingTemplatesView: View {
    var body: some View {
        Text("口语模板内容")
            .navigationTitle("口语模板")
    }
}

// 消息详情页面
struct MessageDetailView: View {
    let message: Message
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(message.sender)
                    .font(.title)
                    .bold()
                
                Text(message.time)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text(message.content)
                    .font(.body)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("消息详情")
    }
}

// 测试成绩页面
struct TestScoresView: View {
    var body: some View {
        Text("测试成绩内容")
            .navigationTitle("测试成绩")
    }
}

// 历史记录页面
struct HistoryRecordsView: View {
    var body: some View {
        Text("历史记录内容")
            .navigationTitle("历史记录")
    }
}

// 收藏题目页面
struct BookmarkedQuestionsView: View {
    var body: some View {
        Text("收藏题目内容")
            .navigationTitle("收藏题目")
    }
}
