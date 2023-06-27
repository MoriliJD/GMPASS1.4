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
            ("1. 对新事物或不熟悉的环境表现出好奇心；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("2. 愿意参与包含对物体、想法或情况进行调查或实验的活动；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("3. 尝试去用科学和逻辑去解释听到或看到的不切实际或者超自然现象；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("4. 使用推理来解决问题或做出决定；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("5. 展示出提出问题以更好地理解主题或情况的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("6. 能够很好的接受自己的理论或者想法出先错误；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("7. 能够很好的面对自己的理论和假设被他人质疑；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("8. 更喜欢从实践经验或实验中学习，而不是仅仅靠被告知或者书本上的一些东西；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("9. 使用他们自己的观察或经验中的证据来支持他们的想法或意见；", ["从未", "极少", "有时", "时常", "频繁", "一直"])
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("Tscientific")
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
                .navigationTitle("科学特质（科学精神）")
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
            
            Button("重新测试") {
                restart()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button("保存结果") {
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

