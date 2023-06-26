//
//  PlanningCharaView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct PlanningCharaView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 15)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. Determines what information or resources are necessary for accomplishing a task.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("2. Grasps the relationship of individual steps to a whole process.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("3. Allows time to execute all steps involved in a process.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("4. Foresees consequences or effects of action.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("5. Organizes his or her work well.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("6. Takes into account the details necessary to accomplish a goal.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("7. Is good at games of strategy where it is necessary to anticipate several moves ahead.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("8. Recognizes the various alternative methods for accomplishing a goal.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("9. Can pinpoint where areas of difficulty might arise in a procedure or activity.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("10. Arranges the steps of a project in a sensible order or time sequence.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("11. Is good at breaking down an activity into step-by-step procedures.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("12. Establishes priorities when organizing activities.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("13. Shows awareness of limitations relating to time, space, materials, and abilities when working on group or individual projects.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("14. Can provide details that contribute to the development of a plan or procedure.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"]),
            ("15. Sees alternative ways to distribute work or assign people to accomplish a task.", ["Never", "Rarely", "Sometimes", "Often", "Very often", "Every day"])
           
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
                .navigationTitle("Planning Characteristics")
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

struct Question10View: View {
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

struct Result10View: View {
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
    func asImage10() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share10Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share10Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share10Sheet>) {
       
    }
}

struct PlanningCharaView_Previews: PreviewProvider {
    static var previews: some View {
        PlanningCharaView()
    }
}
