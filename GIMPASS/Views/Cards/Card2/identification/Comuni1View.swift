//
//  Comuni1View.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct Comuni1View: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 11)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Speaks and writes directly and to the point.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Modifies and adjusts expression of ideas for maximum reception.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Is able to revise and edit in a way which is concise, yet retains essential ideas.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Explains things precisely and clearly.”", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Uses descriptive words to add color, emotion, and beauty.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. Expresses thoughts and needs clearly and concisely.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Can find various ways of expressing ideas so others will understand.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Can describe things in a few very appropriate words.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. Is able to express fine shades of meaning by using a large stock of synonyms.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("10. Is able to express ideas in a variety of alternate ways.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("11.  Knows and can use many words closely related in meaning.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
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
                .navigationTitle("Communication (precision) Characteristics")
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

struct Question8View: View {
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

struct Result8View: View {
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
    func asImage8() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share8Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share8Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share8Sheet>) {
       
    }
}

struct Comuni1View_Previews: PreviewProvider {
    static var previews: some View {
        Comuni1View()
    }
}
