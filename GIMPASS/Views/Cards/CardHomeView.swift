//
//  CardHomeView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CardHomeView: View {
    @State var isDetailViewShowing1 = false
    @State var isDetailViewShowing2 = false
    @State var isDetailViewShowing3 = false
    @State var isDetailViewShowing4 = false
    @State var isDetailViewShowing5 = false
    @State var tabSelectionIndex = 0
    var body: some View {
        VStack {
            
            //MARK: Title
            Text("CHomeVT1")
                .bold()
                .font(.largeTitle)
                .padding(/*@START_MENU_TOKEN@*/[.top, .trailing], 60.0/*@END_MENU_TOKEN@*/)
            //MARK: Cards
            GeometryReader {geo in
                TabView(selection: $tabSelectionIndex) {
                    // MARK: button1
                    Button(action:{self.isDetailViewShowing1 = true} , label:{ ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        ZStack {
                            Image("CPIMG3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            VStack{
                                Text("")
                                Text("CHomeVT5")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .fontWeight(.ultraLight)
                                    .padding(5)
                                    .bold()
                                Text("")
                            }
                            .background(Color.white)
                            .opacity(0.7)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                                
                        }
                    }})
                    .tag(0)
                    .sheet(isPresented: $isDetailViewShowing1) {
                        // Show the Recipe Detail View
                       ListView()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: geo.size.width - 30, height: geo.size.height - 20, alignment: .center)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)

                    // MARK: button2
                    Button(action:{self.isDetailViewShowing2 = true} , label:{ ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        ZStack{
                            Image("CPIMG1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        
                            VStack{
                                Text("")
                            
                                Text("CHomeVT6")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .fontWeight(.ultraLight)
                                    .padding(5)
                                    .bold()
                       
                                Text("")
                            }
                            .background(Color.white)
                            .opacity(0.7)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                                
                            
                        }
                    }})
                    .tag(1)
                    .sheet(isPresented: $isDetailViewShowing2) {
                  
                       CardView_2View()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: geo.size.width - 30, height: geo.size.height - 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                    
                    // MARK: button3
                    Button(action:{self.isDetailViewShowing3 = true} , label:{ ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        ZStack{
                            Image("IMG3")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            VStack{
                                Text("")
                                Text("CHomeVT7")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .fontWeight(.ultraLight)
                                    .padding(5)
                                    .bold()
                                Text("")
                            }
                            .background(Color.white)
                            .opacity(0.7)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        }
                    }})
                    .tag(2)
                    .sheet(isPresented: $isDetailViewShowing3) {
                        // Show the Recipe Detail View
                       CardView3()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: geo.size.width - 30, height: geo.size.height - 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                    
                    // MARK: button4
                    
                    Button(action:{self.isDetailViewShowing4 = true} , label:{ ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        ZStack {
                            Image("CPIMG2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            VStack{
                                Text("")
                                Text("CHomeVT8")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .fontWeight(.ultraLight)
                                    .padding(5)
                                 
                                    .bold()
                                Text("")
                            }
                            .background(Color.white)
                            .opacity(0.7)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        }
                    }})
                    .tag(3)
                    .sheet(isPresented: $isDetailViewShowing4) {
                        // Show the Recipe Detail View
                       CardView4()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: geo.size.width - 30, height: geo.size.height - 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                    
                    // MARK: button5
                    Button(action:{self.isDetailViewShowing5 = true} , label:{ ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        ZStack{
                            Image("CPIMG0")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            
                            VStack{
                                Text("")
                                Text("CHomeVT9")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .fontWeight(.ultraLight)
                                    .padding(5)
                                    .bold()
                                Text("")
                            }
                            .background(Color.white)
                            .opacity(0.7)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                        }
                    }})
                    .tag(4)
                    .sheet(isPresented: $isDetailViewShowing5) {
                        // Show the Recipe Detail View
                       CardView5()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: geo.size.width - 30, height: geo.size.height - 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 5, x: -5, y: 5)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            // MARK: Descriptions
            VStack (alignment: .leading, spacing: 10) {
                
                Text("CHomeVT2")
                    .font(.headline)
                Text("CHomeVT3")
                    .font(.headline)
                Text("CHomeVT4")
                    .font(.headline)
                
            }
            .padding([.leading, .bottom])
        }
    }
}

struct CardHomeView_Previews: PreviewProvider {
    static var previews: some View {
       CardHomeView()
    }
}
