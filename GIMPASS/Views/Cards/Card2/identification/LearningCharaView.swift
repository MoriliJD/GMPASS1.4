//
//  LearningCharaView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//


import SwiftUI

struct LearningCharaView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 11)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. 展示出超过年龄和阶段的词汇；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("2. 展示出对事件、人物和事物进行概括的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("3. 展示出拥有对一定主题的大量相关信息；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("4. 展示出能够掌握事物背后的逻辑和原理的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("5. 展示出洞察因果的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("6. 展示出通过分析推理而理解复杂的内容的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("7. 展示出对多个主题的大量的且广泛的知识储存；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("8. 展示出处理和理解抽象概念的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("9. 展示出优秀的记忆力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("10. 展示出敏锐而富有洞察力的观察力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("11. 展示出在学习上的举一反三的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"])
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("Tlearning")
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
                .navigationTitle("学习特质")
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

struct QuestionView: View {
    let questionText: String
    let answerOptions: [String]
    @Binding var selectedIndex: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(questionText)
                .font(.headline)
            
            Picker("频率：", selection: $selectedIndex) {
                ForEach(0..<answerOptions.count) { index in
                    Text(answerOptions[index]).tag(index)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.bottom)
    }
}

struct ResultView: View {
    let resultRange: Int
    let restart: () -> Void
    @State private var showShareSheet = false

    var body: some View {
        VStack {
            if resultRange == 1 {
                // Content for result range 1 to 3
                Text("感谢您使用 Gimpass 来评估您孩子的学习能力。 根据结果，我们没有在测试发现超常的学习能力。")
                Spacer()
                Text("请您注意，每个孩子都有独特的优势和才能，Gimpass 只是帮助识别潜在天赋特征的工具，并不能替代专业的鉴定。 如果您想更详细地分析您孩子的能力，您可以寻求专业的鉴定服务。 我们还希望您继续支持和培养孩子的兴趣和能力，无论孩子是否是在这个方面有资优特征。")
                Spacer()
                Text("如果您有任何问题或疑虑，请随时与我们联系。 我们会回答您对结果的任何疑问，并提供有关如何支持您孩子持续成长和发展的指导。我们在这里希望能为您和您孩子的教育之旅提供支持。感谢您使用 Gimpass，我们期待着 进一步帮助您。")
            } else {
                // Content for result range above 4
                Text("感谢您使用 Gimpass 来评估您孩子的学习能力。 根据结果，我们发现了学习能力方面的资优特质。 请您注意，天赋并不能保证成功，但它表明孩子有在才能和兴趣领域取得高成就的潜力。 为了支持您孩子的成长，我们建议您考虑提供给学生学习上的挑战和激发他们的兴趣和能力的丰富机会。 这些可能包括有：高级课程、独立学习或课外项目。")
                     Spacer()
                 Text("我们的团队可以回答您对结果及其对您孩子的教育意味着什么的任何疑问。 请记住，Gimpass 仅是一个帮助识别潜在天赋特征的工具，并不能替代专业识别。 如果您有兴趣对您孩子的能力进行更详细的分析，我们建议您寻求专业的鉴定服务。")
                    Spacer()
                 Text ("如果您有任何问题或疑虑，请随时与我们联系。 我们随时为您和您孩子的教育之旅提供支持。")
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
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ShareSheet>) {
       
    }
}

struct LearningCharaView_Previews: PreviewProvider {
    static var previews: some View {
        LearningCharaView()
    }
}
