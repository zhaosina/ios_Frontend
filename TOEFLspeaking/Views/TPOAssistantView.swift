import SwiftUI
import AVFoundation

struct TPOAssistantView: View {
    @State private var evaluationResult: String = ""
    @State private var isLoading = false
    @State private var showError = false
    @State private var errorMessage = ""
    
    let questionText = "Describe your favorite season and explain why you like it."
    let sampleAnswer = "My favorite season is spring because the weather is mild and flowers bloom everywhere."

    var body: some View {
        VStack(spacing: 20) {
            // 题目展示
            VStack(alignment: .leading) {
                Text("题目内容")
                    .font(.headline)
                Text(questionText)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            // 评估结果展示
            if isLoading {
                ProgressView("评估中...")
                    .padding()
            } else if !evaluationResult.isEmpty {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("评估结果")
                            .font(.headline)
                        Text(evaluationResult)
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(8)
                    }
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("TPO口语助手")
        .alert("发生错误", isPresented: $showError) {
            Button("确定") { }
        } message: {
            Text(errorMessage)
        }
        .onAppear(perform: simulateEvaluation)
    }

    // 模拟评估结果
    private func simulateEvaluation() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLoading = false
            
            // 模拟Qwen-Omni返回数据
            let simulatedResponse: [String: Any] = [
                "success": true,
                "evaluation": [
                    "overall_score": 27.5,
                    "pronunciation_score": 9.0,
                    "fluency_score": 8.5,
                    "content_score": 10.0,
                    "detailed_feedback": [
                        "strengths": [
                            "发音清晰准确，元音饱满",
                            "语调自然，重音位置正确",
                            "内容完整覆盖题目要求"
                        ],
                        "weaknesses": [
                            "语速稍快影响清晰度",
                            "连接词使用频率较低"
                        ],
                        "suggestions": [
                            "适当放慢语速，保持每分钟120词左右",
                            "增加过渡词使用如'furthermore'、'moreover'"
                        ],
                        "grammar_errors": [
                            "时态一致性需要加强（3处）"
                        ],
                        "vocabulary_suggestions": [
                            "可替换使用'pleasant weather'代替'good weather'",
                            "建议使用'flourish'替代'grow well'"
                        ]
                    ]
                ]
            ]
            
            if let evaluation = simulatedResponse["evaluation"] as? [String: Any] {
                formatEvaluationResult(evaluation)
            }
        }
    }

    // 保持原有格式化逻辑
    private func formatEvaluationResult(_ evaluation: [String: Any]) {
        guard let overall = evaluation["overall_score"] as? Double,
              let details = evaluation["detailed_feedback"] as? [String: Any] else {
            return
        }
        
        var result = """
        🎯 综合得分：\(String(format: "%.1f", overall))/30
        """
        
        if let strengths = details["strengths"] as? [String], !strengths.isEmpty {
            result += "\n\n✅ 优点：\n" + strengths.joined(separator: "\n• ")
        }
        
        if let weaknesses = details["weaknesses"] as? [String], !weaknesses.isEmpty {
            result += "\n\n❌ 待改进：\n" + weaknesses.joined(separator: "\n• ")
        }
        
        if let suggestions = details["suggestions"] as? [String], !suggestions.isEmpty {
            result += "\n\n💡 建议：\n" + suggestions.joined(separator: "\n• ")
        }
        
        if let grammarErrors = details["grammar_errors"] as? [String], !grammarErrors.isEmpty {
            result += "\n\n⚠️ 语法问题：\n" + grammarErrors.joined(separator: "\n• ")
        }
        
        if let vocabSuggestions = details["vocabulary_suggestions"] as? [String], !vocabSuggestions.isEmpty {
            result += "\n\n📚 词汇建议：\n" + vocabSuggestions.joined(separator: "\n• ")
        }
        
        evaluationResult = result
    }

    private func showError(message: String) {
        errorMessage = message
        showError = true
    }
}
