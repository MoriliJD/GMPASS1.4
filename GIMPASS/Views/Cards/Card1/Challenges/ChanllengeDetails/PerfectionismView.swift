//
//  PerfectionismView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct PerfectionismView: View {
    var body: some View {
        ScrollView{
            Image("IMG1")
                .resizable()
                .frame(width: 400, height: 400)
                .padding(.horizontal)
                .ignoresSafeArea()
            VStack{
                Divider()
                Text("Perfectionism1")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                Divider()
                VStack (alignment: .leading) {
                    Text("Perfectionism2")
                    
                    Text("Perfectionism3")
                    
                    Text("Perfectionism4")
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack (alignment: .leading){
                    Spacer()
                    Text("Perfectionism5")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("Perfectionism6")
                    Text("Perfectionism7")
                    Text("Perfectionism8")
                    Text("Perfectionism9")
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading){
                    Spacer()
                    Text("Perfectionism10")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("Perfectionism11")
                    Text("Perfectionism12")
                    Text("Perfectionism13")
                    Text("Perfectionism14")
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading){
                    Spacer()
                    Text("Perfectionism15")
                        .font(.subheadline)
                        .fontWeight(.black)
                    Text("Perfectionism16")
                    Text("Perfectionism17")
                    Text("Perfectionism18")
                }
                .padding(.horizontal)
                .frame(width: 400)
            }
        }
    }
}

struct PerfectionismView_Previews: PreviewProvider {
    static var previews: some View {
        PerfectionismView()
    }
}
