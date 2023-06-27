//
//  Comuni2View.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct Comuni2View: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 4)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. 能够富有表现力地使用声音来传达或增强意思；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("2. 能够通过手势、面部表情和“肢体语言”以非语言方式传达信息；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("3. 是一个能够讲出有趣故事的人；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("4. 能够使用丰富多彩且富有想象力的修辞手法，例如双关语和类比；", ["从未", "极少", "有时", "时常", "频繁", "一直"])
           
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("Tcommuni2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                
                    
                    ForEach(0..<questions.count) { index in
                        QuestionView(questionText: questions[index].0, answerOptions: questions[index].1, selectedIndex: $selectedAnswers[index])
                    }
                    
                    Button("提交") {
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
                .navigationTitle("表达能力特质")
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

struct Question9View: View {
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

struct Result9View: View {
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
    func asImage9() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share9Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share9Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share9Sheet>) {
       
    }
}

struct Comuni2View_Previews: PreviewProvider {
    static var previews: some View {
        Comuni2View()
    }
}
