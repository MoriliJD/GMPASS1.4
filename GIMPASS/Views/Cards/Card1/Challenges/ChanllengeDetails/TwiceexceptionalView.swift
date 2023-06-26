//
//  TwiceexceptionalView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct TwiceexceptionalView: View {
    var body: some View {
        ScrollView {
            Image("IMG1")
                .resizable()
                .frame(width: 400, height: 400)
                .padding(.horizontal)
            .ignoresSafeArea()
            VStack{
                Divider()
                Text("TWicee1")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                Divider()
                VStack(alignment: .leading) {
                    Text("TWicee9")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("TWicee10")
                    Spacer()
                    Text("TWicee11")
                }
                .padding(.horizontal)
                    .frame(width: 400)
                Spacer()
                VStack(alignment: .leading){
                    Text("TWicee2")
                        .font(.subheadline)
                        .fontWeight(.black)
                  Spacer()
                    Text("TWicee3")
                        .font(.subheadline)
                        .fontWeight(.thin)
                    Text("TWicee4")
                    Text("TWicee5")
                        .font(.subheadline)
                        .fontWeight(.thin)
                    Text("TWicee6")
                    Text("TWicee7")
                        .font(.subheadline)
                        .fontWeight(.thin)
                    Text("TWicee8")
                }
                .padding(.horizontal)
                    .frame(width: 400)
            }
        }
        .ignoresSafeArea()
    }
}

struct TwiceexceptionalView_Previews: PreviewProvider {
    static var previews: some View {
        TwiceexceptionalView()
    }
}
