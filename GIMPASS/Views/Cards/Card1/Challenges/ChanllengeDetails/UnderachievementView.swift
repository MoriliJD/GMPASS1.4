//
//  UnderachievementView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct UnderachievementView: View {
    var body: some View {
        
        ScrollView {
            Image("IMG1")
                .resizable()
                .frame(width: 400, height: 400)
                .padding(.horizontal)
                .ignoresSafeArea()
            VStack{
                
                Divider()
                Text("UnderachiText1")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                Divider()
                VStack(alignment: .leading) {
                    Text("UnderachiText2")
                    Spacer()
                    Text("UnderachiText3")
                        .font(.headline)
                        .fontWeight(.heavy)
                    Text("UnderachiText4")
                    Spacer()
                    Text("UnderachiText5")
                    Spacer()
                    Text("UnderachiText6")
                        .font(.headline)
                        .fontWeight(.heavy)
                    Text("UnderachiText7")
                    
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading){
                    Spacer()
                    Text("UnderachiText8")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText9")
                    Spacer()
                    Text("UnderachiText10")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText11")
                    Spacer()
                    Text("UnderachiText12")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText13")
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading){
                    Spacer()
                    Text("UnderachiText14")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText15")
                    Spacer()
                    Text("UnderachiText16")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText17")
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading) {
                    Divider()
                    Text("UnderachiText18")
                        .font(.headline)
                        .fontWeight(.heavy)
                    Text("UnderachiText19")
                    Spacer()
                    Text("UnderachiText20")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText21")
                    Spacer()
                    Text("UnderachiText22")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText23")
                    Text("UnderachiText24")
                  
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading) {
                    Spacer()
                    Text("UnderachiText25")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText26")
                    Text("UnderachiText27")
                    Spacer()
                    Text("UnderachiText28")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText29")
                    Text("UnderachiText30")
                    
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack (alignment: .leading){
                    Divider()
                    Text("UnderachiText31")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("UnderachiText32")
                }
                .padding(.horizontal)
                .frame(width: 400)
                
                VStack(alignment: .leading){
                    Spacer()
                    Text("UnderachiText33")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Spacer()
                    Text("UnderachiText34")

                    Text("UnderachiText35")

                    Text("UnderachiText36")
                    VStack (alignment: .leading){
                        
                        Text("UnderachiText37")

                        Text("UnderachiText38")

                        Text("UnderachiText39")
                        
                        Text("UnderachiText40")

                        Text("UnderachiText41")
                    }
                }
                .padding(.horizontal)
                .frame(width: 400)
            }
            
        }
        .ignoresSafeArea()
    }
}

struct UnderachievementView_Previews: PreviewProvider {
    static var previews: some View {
        UnderachievementView()
    }
}
