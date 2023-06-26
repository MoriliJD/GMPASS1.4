//
//  GagneView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct GagneView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Card2View1")
                    .font(.largeTitle)
                    .bold()
                VStack{
                    Image("DIMG1")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                }
                Spacer()
                Divider()
                VStack(alignment: .leading){
                    Text("Card2View2")
                        .bold()
                    VStack(alignment: .leading) {
                        Text("Card2View3")
                        Text("Card2View4")
                            .bold()
                        Text("Card2View5")
                    }
                    VStack (alignment: .leading){
                        Text("Card2View6")
                            .bold()
                        Text("Card2View7")
                    }
                    VStack (alignment: .leading){
                        Text("Card2View8")
                            .bold()
                        Text("Card2View9")
                        Text("Card2View10")
                            .bold()
                        Text("Card2View11")}
                    VStack (alignment: .leading){
                        Text("Card2View12")
                            .bold()
                        Text("Card2View13")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct GagneView_Previews: PreviewProvider {
    static var previews: some View {
        GagneView()
    }
}
