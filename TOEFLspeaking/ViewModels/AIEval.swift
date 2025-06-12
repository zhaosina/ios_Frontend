//
//  AIEval.swift
//  TOEFLspeaking
//
//  Created by admin on 2025/3/17.
//
import Foundation

class AIEvaluationAPI {
    static let shared = AIEvaluationAPI()
    private let baseURL = "http://<YOUR_LOCAL_IP>:8000/ai-evaluation/api" // 替换为您的本地IP
    
    enum APIError: Error {
        case invalidURL
        case requestFailed(String)
        case invalidResponse
        case decodingError
    }
    
    func evaluateSpeaking(
        audioBase64: String,
        questionText: String,
        sampleAnswer: String,
        completion: @escaping (Result<[String: Any], Error>) -> Void
    ) {
        guard let url = URL(string: "\(baseURL)/evaluate/") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "audio_data": audioBase64,
            "question_text": questionText,
            "sample_answer": sampleAnswer
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    completion(.success(json))
                } else {
                    completion(.failure(APIError.decodingError))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
