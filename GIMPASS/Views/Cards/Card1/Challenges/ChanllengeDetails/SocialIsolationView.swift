//
//  SocialIsolationView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct SocialIsolationView: View {
    var body: some View {
        ScrollView {
            Image("IMG1")
                .resizable()
                .frame(width: 400, height: 400)
                .padding(.horizontal)
                .ignoresSafeArea()
            VStack{
                Text("SocialIsolation1")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                Divider()
               
                
            }
            VStack(alignment: .leading){
                Text("SocialIsolation2")
                Text("SocialIsolation3")
                Text("SocialIsolation4")
                Text("SocialIsolation5")
            }
            .padding(.horizontal)
            .frame(width: 400)
            VStack(alignment: .leading){
                Spacer()
                Text("SocialIsolation6")
                    .font(.subheadline)
                    .fontWeight(.black)
               Text("SocialIsolation7")
                Text("SocialIsolation8")
                Text("SocialIsolation9")
                Text("SocialIsolation10")
                Text("SocialIsolation11")
                Text("SocialIsolation12")
               
            }.padding(.horizontal)
                .frame(width: 400)

        }
    }
}

struct SocialIsolationView_Previews: PreviewProvider {
    static var previews: some View {
        SocialIsolationView()
    }
}
