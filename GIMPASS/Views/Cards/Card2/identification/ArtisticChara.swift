//
//  ArtisticChara.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct ArtisticChara: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 11)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Like to participate in art activities; is eager to visually express ideas.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Incorporates a large number of elements into artwork; varies the subject and content of the artwork.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Arrives at unique, unconventional solutions to artistic problems as opposed to traditional, conventional ones.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Concentrates for long periods of time on art projects.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Willingly tries out different media; experiments with a variety of materials and techniques.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. Tends to select art media for free activity or classroom projects.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Is particularly sensitive to the environment; is a keen observer – sees the unusual, what may be overlooked by others.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Produces balance and order in the artwork.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. Is critical of his or her own work; sets high standards of quality; often reworks creation in order to refine it.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("10. Shows an interest in other students’ work – spends time studying and discussing their work.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("11. Elaborates on ideas from other people – uses them as a “jumping-off point” as opposed to copying them.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
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
                .navigationTitle("Artistic Characteristics")
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

struct Question5View: View {
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

struct Result5View: View {
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
    func asImage5() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share5Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share5Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share5Sheet>) {
       
    }
}

struct ArtisticChara_Previews: PreviewProvider {
    static var previews: some View {
        ArtisticChara()
    }
}
