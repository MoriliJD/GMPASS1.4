//
//  NoticeView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct NoticeView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Letter to Users
                Text("致教育者们")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .padding(.top, 20)
                
                Text("亲爱的家长，老师，教育者们,")
                    .padding(.bottom, 10)
                Text("我们想告知您，虽然我们的应用程序提供的资优特质鉴定有助于总体了解学生的优势和劣势，但它并不是识别资优的非常精确的工具。 资优是一个复杂且多方面的概念，任何单一的筛选工具都无法完全捕捉到这一点。 因此，为了帮助教育者初步识别学生的资优潜质以及了解资优教育，Gimpass提供的评级量表仅适用于资优识别的最初阶段，请注意，为了保护您的孩子和学生，请不要将不准确的鉴定信息告知学生。")
                    .padding(.bottom, 5)
                Text("请注意，有很多因素会影响我们筛选工具获得的结果的准确性，包括测试条件、教育者的专业水平、个人理解和其他个人因素。若您想深入了解Gimpass中的资优鉴定，我们建议您咨询专门从事资优教育的专业人士，以便更准确、更全面地评估孩子的能力。")
                    .padding(.bottom, 5)
                Text("我们希望这些信息可以帮助您更好地了解我们的鉴定工具的局限性和潜在的不准确性。 我们仍然致力于为您提供最好的资源来识别和帮助资优学生。")
                    .padding(.bottom, 5)
                
                
                // Instructions
                VStack{
                    Text("使用说明")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .padding(.top, 20)
                    Spacer()
                    Text("欢迎使用我们的筛选工具！ 该工具旨在帮助您获得教师对学生在各个领域的特征的估计，包括学习、动机、创造力、领导力、艺术、音乐、戏剧、沟通、规划和科学素养。 这些特征源自有关有天赋和创造力的个体的研究文献。")
                        .padding(.bottom, 5)
                    Text("值得注意的是，该人群可能存在显着的个体差异，因此，概况可能会有所不同。 要使用该工具，请分别考虑量表中的每个项目，并反思您在学生中观察到的每个特征是否存在。")
                        .padding(.bottom, 5)
                    Text("由于该工具的十一个维度代表相对不同的特质，因此从不同量表获得的分数不应相加得出总分。 教育者应该了解学生至少六个月，以确保准确性。")
                        .padding(.bottom, 5)
                    Text("要使用该鉴定工具，请阅读每个量表中的每个项目，并选择与您观察到该行为的频率相对应的选项。 每个项目都应以开头短语“学生展示”或“学生...？”来阅读。 完成所有项目后，单击“提交”即可获取结果。 完成后您可以保留屏幕截图。")
                        .padding(.bottom, 5)
                    Text("感谢您使用我们的筛选工具，我们希望它能为您提供有关学生特征的有用信息。")
                }
                
            
            }
            .padding(.horizontal)
        }
    }
}

struct NoticeView_Previews: PreviewProvider {
    static var previews: some View {
        NoticeView()
    }
}
