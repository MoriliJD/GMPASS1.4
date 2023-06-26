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
                Text("To Educators")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .padding(.top, 20)
                
                Text("Dear educators,")
                    .padding(.bottom, 10)
                Text("We would like to inform you that while the rating scale for behavioral characteristics for superior students, provided by our app, can be helpful in getting a general idea of a student's strengths and weaknesses, it is not a very precise tool to identify giftedness. Giftedness is a complex and multifaceted concept that cannot be fully captured by any single screening tool. Therefore, the rating scale provided by our app is only intended for the very initial stage of identification of giftedness.")
                    .padding(.bottom, 5)
                Text("We encourage our users to consult with professionals who specialize in gifted education for a more accurate and comprehensive evaluation of their child's abilities. Please keep in mind that there are many factors that can affect the accuracy of the results obtained from our screening tool, including the test conditions, the professionalism of the educators, personal understanding, and other individual factors.")
                    .padding(.bottom, 5)
                Text("We hope that this information provides a better understanding of the limitations and potential inaccuracies of our screening tool. We remain committed to providing our users with the best possible resources for identifying and supporting gifted students.")
                    .padding(.bottom, 5)
                
                
                // Instructions
                VStack{
                    Text("Instructions")
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .padding(.top, 20)
                    
                    Text("Welcome to our screening tool! This tool is designed to help you obtain teacher estimates of a student's characteristics in various areas, including Learning, Motivation, Creativity, Leadership, Art, Music, Drama, Communication, and Planning. These characteristics are derived from the research literature on gifted and creative individuals.")
                        .padding(.bottom, 5)
                    Text("It's essential to note that there can be significant individual differences within this population, and therefore, the profiles are likely to vary. To use the tool, please consider each item in the scales separately and reflect on the presence or absence of each characteristic you have observed in the student.")
                        .padding(.bottom, 5)
                    Text("Since the ten dimensions of the instrument represent relatively different sets of behaviors, the scores obtained from the separate scales should not be summed to yield a total score. Educators should know the student for at least six months to ensure accuracy.")
                        .padding(.bottom, 5)
                    Text("To use the tool, please read each item in each scale and choose the option that corresponds to the frequency to which you have observed the behavior. Each item should be read with the beginning phrase, 'The student demonstrates' or 'The student...?'. Once you have completed all the items, click submit to get a result. You can keep the screenshot after you finish.")
                        .padding(.bottom, 5)
                    Text("Thank you for using our screening tool, and we hope that it provides helpful insights into the characteristics of your students.")
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
