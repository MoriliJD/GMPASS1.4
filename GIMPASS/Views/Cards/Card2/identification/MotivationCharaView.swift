//
//  MotivationCharaView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct  MotivationCharaView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 11)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. The ability to concentrate intently on a topic for a long period of time", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Behaviour that requires little direction from teachers.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Sustained interest in certain topics or problems.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Tenacity for finding out information on topics of interest.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Persistent work on tasks even when setbacks occur.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. A preference for situations in which he or she can take personal responsibility for the outcomes of his or her efforts.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Follow-through behaviour when interested in a topic or problem.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Intense involvement in certain topics or problems.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. A commitment to long-term projects when interested in a topic.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("10. Persistence when pursuing goals.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("11. Little need for external motivation to follow through in work that is initially exciting.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
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
                .navigationTitle("Motivation Characteristics")
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

struct Question3View: View {
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

struct Result3View: View {
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
    func asImage3() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share3Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share3Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share3Sheet>) {
       
    }
}

struct  MotivationCharaView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationCharaView()
    }
}
