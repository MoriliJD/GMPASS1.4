//
//  ThreeRingsView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct ThreeRingsView: View {
    var body: some View {
        ScrollView {
            VStack{
                Text("Card1View1")
                    .font(.largeTitle)
                    .bold()
                
                VStack{
                    Image("DIMG0")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                    Text("image 1")
                }
                Divider()
                HStack{
                    Text("Card1View2")
                        .multilineTextAlignment(.leading)
                    Text("Card1View3")
                }
                Spacer()
                VStack(alignment:.leading) {
                    Text("Card1View4")
                    Text("Card1View5")
                    Text("Card1View6")
                }
                .padding(.leading)
            }
        }
    }
}

struct _RingsView_Previews: PreviewProvider {
    static var previews: some View {
        ThreeRingsView()
    }
}

