//
//  ContentView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            CardHomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("HOME")
                    }
                }
            UserProfileView(name: "Mori", age: 30, id: "jdoe123", profilePhoto: Image("profile-photo"), language: "English", motto: "Live life to the fullest", email: "U3596683@connect.hku.hk", phoneNumber: "12341234", address: "AAA", bio: "I'm a software engineer who loves to travel and try new foods.")
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("ME")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
