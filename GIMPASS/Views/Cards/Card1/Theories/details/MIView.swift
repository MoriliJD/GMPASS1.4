//
//  MIView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct MIView: View {
 var inte =  ["Visual-spatial","Linguistic-verbal","Logical-mathematical","Body-kinesthetic","Musical","Interpersonal","Intrapersonal","Naturalistic"]
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                Text("Card3View1")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    .bold()
                    .padding(.horizontal)
                    
                VStack{
                    Image("DIMG2")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                    Text("Image 2")

                }
                Divider()
                VStack (alignment: .leading) {
                    Text("Card3View2")
                    VStack(alignment: .leading){
                        Text("Card3View3")
                        Text("Card3View4")
                    }
                    VStack(alignment: .leading) {
                        Text("Card3View5")
                        Text("Card3View6")
                       
                        }
                }.padding(.horizontal)
                List (inte, id: \.self) { r in
                    Text(r)
                }
                .frame(width: 400,height: 330)
                }
            }
        }
    }
struct MIView_Previews: PreviewProvider {
    static var previews: some View {
        MIView()
    }
}
