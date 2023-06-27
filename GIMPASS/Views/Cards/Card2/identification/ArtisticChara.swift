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
            ("1. 展示出参加艺术活动的热情，并且渴望以视觉方式表达想法；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("2. 展示出将大量元素融入到艺术品中以及艺术作品中丰富的注意和内容；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("3. 展示出反传统的、反常规的，对艺术提出独特的解决方案和想法的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("4. 展示出长时间专注于艺术项目的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("5. 展示出愿意尝试不同的媒介，使用各种材料和技术进行实验的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("6. 展示出倾向于选择艺术进行自由活动或课程；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("7. 展示出对环境特别的敏感； 是一位敏锐的观察者——会看到不寻常的事物，以及可能被其他人忽视的事物；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("8. 展示出在艺术品中产生平衡和秩序的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("9. 展示出对自己的工作持批评的态度；设定高质量标准并且经常对创作进行修改以使其完善；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("10. 展示出对其他学生的艺术作品的兴趣——花时间研究和讨论他们的艺术作品；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("11. 展示出能详细阐述其他人的想法的能力——能将他人的作品和想法作为“起点”，而不是复制它们；", ["从未", "极少", "有时", "时常", "频繁", "一直"])
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("Tart")
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
                .navigationTitle("艺术特质")
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
            
            Picker("频率", selection: $selectedIndex) {
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
                Text("感谢您使用 Gimpass 来评估您孩子的艺术特质。 根据结果，我们没有在测试发现超常的艺术特质。")
                Spacer()
                Text("请您注意，每个孩子都有独特的优势和才能，Gimpass 只是帮助识别潜在天赋特征的工具，并不能替代专业的鉴定。 如果您想更详细地分析您孩子的能力，您可以寻求专业的鉴定服务。 我们还希望您继续支持和培养孩子的兴趣和能力，无论孩子是否是在这个方面有资优特征。")
                Spacer()
                Text("如果您有任何问题或疑虑，请随时与我们联系。 我们会回答您对结果的任何疑问，并提供有关如何支持您孩子持续成长和发展的指导。我们在这里希望能为您和您孩子的教育之旅提供支持。感谢您使用 Gimpass，我们期待着进一步帮助您。")
            } else {
                // Content for result range above 4
                Text("感谢您使用 Gimpass 来评估您孩子的艺术特质。 根据结果，我们发现了艺术方面的资优特质。 请您注意，天赋并不能保证成功，但它表明孩子有在才能和兴趣领域取得高成就的潜力。 为了支持您孩子的成长，我们建议您考虑提供给学生发展创意的平台和机会，为具有创造的的学生提供更包容的环境和对应的挑战和课程。 ")
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
