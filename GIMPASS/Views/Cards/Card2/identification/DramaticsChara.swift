//
//  DramaticsChara.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct DramaticsChara: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 10)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Volunteers to participate in classroom plays or skits.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Easily tells a story or gives an account of some experience.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Effectively uses gestures and facial expressions to communicate feelings.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Is adept at role-playing, improvising, and acting out situations “ on the spot.”", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Can readily identify himself or herself with moods and motivations of characters.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. Handles body with ease and poise for his or her particular age.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Creates original plays or makes up plays from stories.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Commands and holds the attention of a group when speaking.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. Is able to evoke emotional responses from listeners – can get people to laugh, frown, feel tense, etc.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("10. Can imitate others – is able to mimic the way people speak, walk, and gesture.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
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
                .navigationTitle("Dramatics Characteristics")
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

struct Question7View: View {
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

struct Result7View: View {
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
    func asImage7() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share7Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share7Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share7Sheet>) {
       
    }
}

struct DramaticsChara_Previews: PreviewProvider {
    static var previews: some View {
        DramaticsChara()
    }
}
