//
//  CardView2.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CardView_2View: View {
   
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    ZStack{
                        Image("GLX0")
                            .resizable()
                            .frame(width: 400,height: 250)
                            .aspectRatio(contentMode:.fill)
                            .ignoresSafeArea()
                            .cornerRadius(10)
                        Text("资优鉴定")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        
                    }
                    Text("this is content before you use this screening tool")
                }
                
                VStack{
                    HStack{
                        NavigationLink {
                            NoticeView()
                        } label: {
                            ZStack{
                                
                                Image("GLX1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 150,height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Text("说明")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    
                            }
                        }
                        NavigationLink {
                            LearningCharaView()
                        } label: {
                            ZStack {
                                Image("GLX2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 220,height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Text("学习特质")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack{
                        NavigationLink {
                            CreativityCharaView()
                    } label: {
                        ZStack{
                            Image("GLX4")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 190,height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Text("创造力特质")
                                .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    NavigationLink {
                        MotivationCharaView()
                    } label: {
                        ZStack{
                            Image("GLX5")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180,height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Text("内驱特质")
                                .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                        
                    }
                    .padding(.horizontal)
                    HStack{
                        NavigationLink {
                            LeaderShipCharaView()
                        } label: {
                            ZStack{
                                Image("GLX3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 170,height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Text("领导力特质")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                        }
                        NavigationLink {
                            ArtisticChara()
                        } label: {
                            ZStack{
                                Image("GLX11")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200,height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Text("艺术特质")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack{
                        NavigationLink {
                            MusicalCharaView()
                    } label: {
                        ZStack{
                            Image("GLX7")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 210,height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Text("音乐特质")
                                .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    NavigationLink {
                        DramaticsChara()
                    } label: {
                        ZStack{
                            Image("GLX6")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 160,height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Text("戏剧特质")
                                .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                        
                    }
                    .padding(.horizontal)
                    HStack{
                        NavigationLink {
                            PlanningCharaView()
                        } label: {
                            ZStack{
                                Image("GLX8")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 170,height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Text("计划特质")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .foregroundColor(.white)
                            }
                        }
                        NavigationLink {
                            Comuni1View()
                        } label: {
                            ZStack{
                                Image("GLX9")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200,height: 200)
                                    .cornerRadius(10)
                                    .shadow(radius: 10)
                                Text("精确沟通特质")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                    .fontWeight(.heavy)
                                    .font(.title3)
                                    .foregroundColor(.white)

                            }
                        }
                    }
                    .padding(.horizontal)
                    HStack{
                        NavigationLink {
                            Comuni2View()
                    } label: {
                        ZStack{
                            Image("GLX10")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 380,height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Text("表达能力特质")
                                .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                   
                        
                    }
                    .padding(.horizontal)
                    HStack{
                        NavigationLink {
                            ScientificView()
                    } label: {
                        ZStack{
                            Image("GLX12")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 380,height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                            Text("科学特质（科学精神）")
                                .fontWeight(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
                                .fontWeight(.heavy)
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                   
                        
                    }
                }
                
            }
        }
    }
    
    struct CardView_2_Previews: PreviewProvider {
        static var previews: some View {
            CardView_2View()
        }
    }
}
