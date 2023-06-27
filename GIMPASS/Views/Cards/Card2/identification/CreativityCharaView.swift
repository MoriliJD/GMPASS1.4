//
//  CreativityCharaView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CreativityCharaView: View {
    @State private var selectedAnswers = Array(repeating: 0, count: 9)
    @State private var showResults = false
    @State private var resultRange: Int = 0
    let questions = [
            ("1. 展示出富有想象力的思维能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("2. 展示出幽默感；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("3. 展示出提出不寻常的、独特的或机敏的反应的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("4. 展示出冒险精神或者敢于冒险的意愿；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("5. 展示出针对问题或疑问提出大量想法或解决方案的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("6. 展示出发现别人没有发现的幽默的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("7. 展现出对目标或思想的适应，修正，修改的能力；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("8. 展示出对知识的乐趣，热爱幻想以及热衷于思考；", ["从未", "极少", "有时", "时常", "频繁", "一直"]),
            ("9. 展示出不墨守成规的态度并不害怕与众不同；", ["从未", "极少", "有时", "时常", "频繁", "一直"])
        ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Leave space for pictures
                    Image("TCreative")
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
                .navigationTitle("创造力特质")
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

struct Question2View: View {
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

struct Result2View: View {
    let resultRange: Int
    let restart: () -> Void
    @State private var showShareSheet = false

    var body: some View {
        VStack {
            if resultRange == 1 {
                // Content for result range 1 to 3
                Text("感谢您使用 Gimpass 来评估您孩子的创造力能力。 根据结果，我们没有在测试发现超常的创造力能力。")
                Spacer()
                Text("请您注意，每个孩子都有独特的优势和才能，Gimpass 只是帮助识别潜在天赋特征的工具，并不能替代专业的鉴定。 如果您想更详细地分析您孩子的能力，您可以寻求专业的鉴定服务。 我们还希望您继续支持和培养孩子的兴趣和能力，无论孩子是否是在这个方面有资优特征。")
                Spacer()
                Text("如果您有任何问题或疑虑，请随时与我们联系。 我们会回答您对结果的任何疑问，并提供有关如何支持您孩子持续成长和发展的指导。我们在这里希望能为您和您孩子的教育之旅提供支持。感谢您使用 Gimpass，我们期待着 进一步帮助您。")
            } else {
                // Content for result range above 4
                Text("感谢您使用 Gimpass 来评估您孩子的创造力。 根据结果，我们发现了创造力方面的资优特质。 请您注意，天赋并不能保证成功，但它表明孩子有在才能和兴趣领域取得高成就的潜力。 为了支持您孩子的成长，我们建议您考虑提供给学生发展创意的平台和机会，为具有创造的的学生提供更包容的环境和对应的挑战和课程。 ")
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
    func asImage2() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

struct Share2Sheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Share2Sheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<Share2Sheet>) {
       
    }
}

struct CreativityCharaView_Previews: PreviewProvider {
    static var previews: some View {
        CreativityCharaView()
    }
}
