//
//  CardView1.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CardView1: View {
    var body: some View {
        
            ScrollView {
                VStack {
                    Text("Card1HomeView1")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                    //MARK: Theory 1
                    NavigationLink {
                        ThreeRingsView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .aspectRatio(CGSize(width: 350, height: 200), contentMode:.fill)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .padding(.horizontal)
                            ZStack{
                                Image("IMG1")
                                    .resizable()
                                    .aspectRatio(CGSize(width: 350, height: 200), contentMode:.fit)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .padding(.horizontal)
                                Text("Card1HomeView2")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .bold()
                            }
                            
                        }
                    }
                    //MARK: Theory 2
                    NavigationLink {
                        GagneView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .aspectRatio(CGSize(width: 350, height: 200), contentMode: .fit)
                                .padding(.horizontal)
                            ZStack{
                                Image("IMG3")
                                    .resizable()
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .aspectRatio(CGSize(width: 350, height: 200), contentMode:.fit)
                                    .padding(.horizontal)
                                Text("Card1HomeView3")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .bold()
                                
                            }
                            
                        }
                    }
                    
                    
                    //MARK: Theory 3
                    NavigationLink {
                        MIView()
                    } label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .aspectRatio(CGSize(width: 350, height: 200), contentMode: .fit)
                                .padding(.horizontal)
                            ZStack{
                                Image("IMG2")
                                    .resizable()
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .aspectRatio(CGSize(width: 350, height: 200), contentMode:.fill)
                                    .padding(.horizontal)
                                Text("Card1HomeView4")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            
                        }
                    }
                }
            }
        
    }
}
struct CardView1_Previews: PreviewProvider {
    static var previews: some View {
        CardView1()
    }
}
