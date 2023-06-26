//
//  CardView1.2.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//


import SwiftUI


struct CardView1_2: View {
    
   
    var body: some View {
       
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    // Page Title
                    Text("CharacView1")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 30)
                        .padding(.horizontal)
                    Divider()
                    // Introduction
                    VStack(alignment: .leading, spacing: 10) {
                        Text("CharacView2")
                            .font(.title)
                            .bold()
                        Image("giftedness1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Text("CharacView3")
                        Text("CharacView4")
                        
                            .font(.body)
                       
                        
                    }
                    Divider()
                    // Traits of Giftedness
                    VStack(alignment: .leading, spacing: 10) {
                        Text("CharacView5")
                            .font(.title)
                            .bold()
                        Image("giftedness2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Text("CharacView6")
                            .font(.body)
                        NavigationLink {
                            TaitsDetailView()
                        } label: {
                            Text("CharacView7")
                        }
                    }
                }
                // Areas of Giftedness
               
                
                // Dual Nature of Strengths
               
                
                // Asynchronous Development
               
                Divider()
                // Dabrowski's Overexcitabilities
                VStack(alignment: .leading, spacing: 10) {
                    Text("CharacView8")
                        .font(.title)
                        .bold()
                    Image("giftedness6")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Text("CharacView9")
                    Text("CharacView10")
                    Text("CharacView11")
                    NavigationLink {
                        OEsView()
                    } label: {
                        Text("CharacView12")
                    }
                        .font(.body)
                    
                }
                Divider()
                // Tips
                VStack(alignment: .leading, spacing: 10) {
                    Text("CharacView13")
                        .font(.title)
                        .bold()
                    Image("giftedness7")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    Text("CharacView14")
                    Text("CharacView15")
                    Text("CharacView16")
                    Text("CharacView17")
                    Text("CharacView18")
                    Text("CharacView19")
                    Text("CharacView20")
                    Text("CharacView21")
                        .font(.body)
                }
                
            }
            .padding()
        }
    }


struct CardView1_2_Previews: PreviewProvider {
    static var previews: some View {
        CardView1_2()
    }
}


