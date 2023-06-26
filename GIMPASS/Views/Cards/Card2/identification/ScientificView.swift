//
//  ScientificView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct ScientificView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 9)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Show curiosity towards new things or unfamiliar environments.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Engage in activities that involve investigating or experimenting with objects, ideas or situations.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Try to find logical explanations for unrealistic or supernatural things they observe or hear.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Use reasoning to solve problems or make decisions.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Ask questions to better understand a topic or situation.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. Well accept mistakes made by himself/ herself.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Can face challenges to assumptions or statements made by himself/ herself.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Prefer to learn from hands-on experiences or experiments rather than just being told something.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. Use evidence from their own observations or experiences to support their ideas or opinions.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
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
                .navigationTitle("Scientific Characteristics (Scientific Spirit)")
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

struct Question11View: View {
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

struct Result11View: View {
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
    func asImage11() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share11Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share11Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share11Sheet>) {
       
    }
}

struct ScientificView_Previews: PreviewProvider {
    static var previews: some View {
        ScientificView()
    }
}

