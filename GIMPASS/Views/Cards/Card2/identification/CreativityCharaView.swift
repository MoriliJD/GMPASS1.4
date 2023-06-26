//
//  CreativityCharaView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CreativityCharaView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 9)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Imaginative thinking ability.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. A sense of humour.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. The ability to come up with unusual, unique, or clever responses.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. An adventurous spirit or a willingness to take risks.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. The ability to generate a large number of ideas or solutions to problems or questions.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. A tendency to see humour in situations that may not appear to be humorous to others.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. The ability to adapt, improve, or modify objects or ideas.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Intellectual playfulness, willingness to fantasize and manipulate ideas.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. A non-conforming attitude does not fear being different.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("your_image")
                        .resizable()
                        .scaledToFit()
                
                    
                    ForEach(0..<questions.count) { index in
                        QuestionView(questionText: questions[index].0, answerOptions: questions[index].1, selectedIndex: $selectedAnswers[index])
                    }
                    
                    Button("Submit") {
                        calculateResults()
                        showResults = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding()
                .background(Color.white)
                .navigationTitle("Creativity Characteristics")
                .fullScreenCover(isPresented: $showResults) {
                    ResultView(resultRange: resultRange, restart: restartScreening)
                }
            }
        }
    }

    func calculateResults() {
        let totalScore = selectedAnswers.reduce(0, { x, y in x + (y + 1) })
        let evenScore = totalScore / questions.count
        resultRange = (evenScore <= 3) ? 1 : 2
    }

    func restartScreening() {
        selectedAnswers = Array(repeating: 0, count: questions.count)
        showResults = false
    }
}

struct Question2View: View {
    let questionText: String
    let answerOptions: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(questionText)
                .font(.headline)
            
            Picker("Frequency", selection: $selectedIndex) {
                ForEach(0..<answerOptions.count) { index in
                    Text(answerOptions[index]).tag(index)
                }
            }
            .pickerStyle(.navigationLink)
        }
        .padding(.bottom)
    }
}

struct Result2View: View {
    let resultRange: Int
    let restart: () -> Void
    @State private var showShareSheet = false

    var body: some View {
        VStack {
            if resultRange == 1 {
                // Content for result range 1 to 3
                Text("Explanation for range 1 to 3")
            } else {
                // Content for result range above 4
                Text("Explanation for range above 4")
            }
            
            Button("Restart Screening") {
                restart()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button("Save Screenshot") {
                showShareSheet = true
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            .sheet(isPresented: $showShareSheet) {
                shareSheet
            }
        }
        .padding()
        .background(Color.white)
    }
    
    var shareSheet: some View {
        let image = UIApplication.shared.windows[0].rootViewController?.view.asImage()
        
        return ShareSheet(activityItems: [image ?? UIImage()])
    }
}

extension UIView {
    func asImage2() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share2Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share2Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share2Sheet>) {
       
    }
}

struct CreativityCharaView_Previews: PreviewProvider {
    static var previews: some View {
        CreativityCharaView()
    }
}
