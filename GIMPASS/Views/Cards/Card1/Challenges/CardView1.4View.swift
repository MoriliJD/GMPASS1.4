//
//  CardView1.4View.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CardView1_4View: View {
    @State var isDetailViewShowing1 = false
    @State var isDetailViewShowing2 = false
    @State var isDetailViewShowing3 = false
    @State var isDetailViewShowing4 = false
    @State var isDetailViewShowing5 = false
    @State var tabSelectionIndex = 0
    var body: some View {
        ScrollView {
            Text("CardV1_4Text1")
                .font(.title)
                .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                .fontWeight(.bold)
                
            VStack{
                // MARK: card1
            Button(action:{self.isDetailViewShowing1 = true} , label:{  ZStack{
                
                Rectangle()
                    .frame(width: 350,height: 350)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                
                VStack{
                    Image("IMG1")
                        .resizable()
                        .frame(width: 320,height: 260)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                    Text("CardV1_4Text2")
                        .font(.title)
                        .fontWeight(.light)
                        .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                        .bold()
                }
                
            }})
            .tag(0)
            .sheet(isPresented: $isDetailViewShowing1) {
                // Show the Recipe Detail View
                UnderachievementView()
            }
            .buttonStyle(PlainButtonStyle())
            .cornerRadius(15)
            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                
            // MARK: card2
                Button(action:{self.isDetailViewShowing2 = true} , label:{   ZStack{
                    
                    Rectangle()
                        .frame(width: 350,height: 350)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                   
                    VStack{
                        Image("IMG1")
                            .resizable()
                            .frame(width: 320,height: 260)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        Text("CardV1_4Text3")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                            .bold()
                    }
                    
                }})
                .tag(1)
                .sheet(isPresented: $isDetailViewShowing2) {
                    // Show the Recipe Detail View
                    TwiceexceptionalView()
                }
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
          // MARK: card3
                Button(action:{self.isDetailViewShowing3 = true} , label:{   ZStack{
                    
                    Rectangle()
                        .frame(width: 350,height: 350)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                   
                    VStack{
                        Image("IMG1")
                            .resizable()
                            .frame(width: 320,height: 260)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        Text("CardV1_4Text4")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                            .bold()
                    }
                    
                }})
                .tag(2)
                .sheet(isPresented: $isDetailViewShowing3) {
                    // Show the Recipe Detail View
                    PerfectionismView()
                }
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                
                //MARK: card4
                Button(action:{self.isDetailViewShowing4 = true} , label:{   ZStack{
                    
                    Rectangle()
                        .frame(width: 350,height: 350)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                   
                    VStack{
                        Image("IMG1")
                            .resizable()
                            .frame(width: 320,height: 260)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        Text("CardV1_4Text5")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                            .bold()
                    }
                    
                }})
                .tag(3)
                .sheet(isPresented: $isDetailViewShowing4) {
                    // Show the Recipe Detail View
                    AsynchronyView()
                }
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                
                // MARK: card5
                
                // MARK: card6
                
                Button(action:{self.isDetailViewShowing5 = true} , label:{   ZStack{
                    
                    Rectangle()
                        .frame(width: 350,height: 350)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.horizontal)
                   
                    VStack{
                        Image("IMG1")
                            .resizable()
                            .frame(width: 320,height: 260)
                            .shadow(radius: 5)
                            .padding(.horizontal)
                        Text("CardV1_4Text6")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                            .bold()
                    }
                    
                }})
                .tag(4)
                .sheet(isPresented: $isDetailViewShowing5) {
                    // Show the Recipe Detail View
                    SocialIsolationView()
                }
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(15)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                
        }
        }
        }
}

struct CardView1_4View_Previews: PreviewProvider {
    static var previews: some View {
        CardView1_4View()
    }
}
