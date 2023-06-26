//
//  AsynchronyView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct AsynchronyView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("IMG1")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .padding(.horizontal)
                    .ignoresSafeArea()
                VStack {
                    Text("Asynchrony1")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.996, green: 0.326, blue: 0.316))
                    Divider()
                }
                VStack(alignment: .leading) {
                    Text("Asynchrony2")
                    Spacer()
                    Text("Asynchrony14")
                        .font(.headline)
                        .fontWeight(.heavy)
                    Text("Asynchrony3")
                     Text("Asynchrony4")
                    Text("Asynchrony5")
                    Text("Asynchrony6")
                    Text("Asynchrony7")
                }
                .padding(.horizontal)
                .frame(width: 400)
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Asynchrony8")
                        .font(.headline)
                        .fontWeight(.heavy)
                    Text("Asynchrony9")
                    Text("Asynchrony10")
                    Text("Asynchrony11")
                    Text("Asynchrony12")
                    Text("Asynchrony13")
                    Text("Asynchrony14")
                }
                .padding(.horizontal)
                .frame(width: 400)
            }
        }
    }
}

struct AsynchronyView_Previews: PreviewProvider {
    static var previews: some View {
        AsynchronyView()
    }
}
