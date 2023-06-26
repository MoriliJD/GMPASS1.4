//
//  CardView4.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct CardView4: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()
                    NavigationLink {
                        OrganizationalResorView()
                    } label: {
                        Image("IMG1")
                            .resizable()
                            .frame(width: 200,height: 200)
                            .clipShape(Circle())
                    }
                    
                    
                    Spacer()
                    Image("IMG1")
                        .resizable()
                        .frame(width: 250,height: 250)
                        .clipShape(Circle())
                    Spacer()
                    Image("IMG1")
                        .resizable()
                        .frame(width: 220,height: 220)
                        .clipShape(Circle())
                    
                }
                .padding(.all)
            }
        }
    }
}

struct CardView4_Previews: PreviewProvider {
    static var previews: some View {
        CardView4()
    }
}
