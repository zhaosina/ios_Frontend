import SwiftUI

// TOEFL Speaking Question Data Model
struct SpeakingQuestion: Identifiable, Decodable {
    var id: Int
    var title: String
    var description: String
    var category: String
    var prepTime: Int
    var speakingTime: Int
    var sampleAnswer: String
}

// Independent Speaking Questions View
struct IndependentSpeakingView: View {
    @State private var questions: [SpeakingQuestion] = []
    @State private var isLoading = true

    var body: some View {
        ScrollView {
            if isLoading {
                ProgressView("Loading...")
                    .padding()
            } else {
                LazyVStack(spacing: 15) {
                    ForEach(questions) { question in
                        NavigationLink(destination: QuestionDetailView(question: question)) {
                            QuestionCard(question: question)
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Independent Speaking Questions")
        .onAppear { loadQuestions() }
    }

    private func loadQuestions() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            questions = [
                SpeakingQuestion(
                    id: 1,
                    title: "Describe an Influential Person",
                    description: "Describe a person who has had a significant influence on your life. Explain who this person is and how he or she has influenced you.",
                    category: "Independent Speaking",
                    prepTime: 15,
                    speakingTime: 45,
                    sampleAnswer: "One of the most influential people in my life is my high school English teacher, Ms. Wang. She not only taught me language skills but also encouraged me to think critically and broaden my horizons. She motivated me to participate in English speech contests, which greatly improved my confidence and communication abilities."
                ),
                SpeakingQuestion(
                    id: 2,
                    title: "Discuss Your Ideal Vacation",
                    description: "Describe what your ideal vacation would be like. Include where you would go, what you would do, and who you would spend it with.",
                    category: "Independent Speaking",
                    prepTime: 15,
                    speakingTime: 45,
                    sampleAnswer: "My ideal vacation would be on a beautiful island with sandy beaches, such as Phuket in Thailand. I would choose to spend this time with my family. We could enjoy the sunshine, try water activities like snorkeling, and have seafood at beachside restaurants."
                )
            ]
            isLoading = false
        }
    }
}

// Question Card Component
struct QuestionCard: View {
    let question: SpeakingQuestion

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question.title)
                .font(.headline)
                .foregroundColor(.primary)
            Text(question.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
            HStack {
                Label("\(question.prepTime)s prep", systemImage: "clock")
                    .font(.caption)
                    .foregroundColor(.blue)
                Spacer()
                Label("\(question.speakingTime)s answer", systemImage: "mic.fill")
                    .font(.caption)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

// Question Detail View
struct QuestionDetailView: View {
    let question: SpeakingQuestion
    @State private var showingSampleAnswer = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Question Info
                VStack(alignment: .leading, spacing: 10) {
                    Text(question.title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(question.category)
                        .font(.subheadline)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(5)
                    Divider()
                    Text(question.description)
                        .font(.body)
                }
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)

                // Timing Info
                HStack {
                    VStack {
                        Text("\(question.prepTime)")
                            .font(.title2).bold()
                        Text("Prep Time (seconds)")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(10)

                    VStack {
                        Text("\(question.speakingTime)")
                            .font(.title2).bold()
                        Text("Answer Time (seconds)")
                            .font(.caption)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(10)
                }

                // Practice Button
                Button(action: { /* Start practice */ }) {
                    Text("Start Practice")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                // Sample Answer
                Button(action: { showingSampleAnswer.toggle() }) {
                    HStack {
                        Text("View Sample Answer")
                            .font(.headline)
                        Spacer()
                        Image(systemName: showingSampleAnswer ? "chevron.up" : "chevron.down")
                    }
                    .foregroundColor(.primary)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                }

                if showingSampleAnswer {
                    Text(question.sampleAnswer)
                        .padding()
                        .background(Color(UIColor.tertiarySystemBackground))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Question Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
