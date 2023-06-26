//
//  ProfileView.swift
//  GIMPASS
//
//  Created by MORI on 26/6/2023.
//

import SwiftUI

struct UserProfileView: View {
    // User properties
    let name: String
    let age: Int
    let id: String
    let profilePhoto: Image
    let language: String
    let motto: String
    let email: String
    let phoneNumber: String
    let address: String
    let bio: String
    
    // Settings properties
    @State private var notificationsEnabled = true
    @State private var darkModeEnabled = false
    
    var body: some View {
        ScrollView {
            VStack {
                // Profile photo and name
                profilePhoto
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                
                Text(name)
                    .font(.title)
                    .fontWeight(.bold)
                
                // User info
                VStack (alignment: .leading){
                    HStack{
                        Text("Age:")
                            .font(.headline)
                        Text("\(age)")
                    }
             
                    HStack{
                        Text("ID:")
                            .font(.headline)
                        Text(id)
                    }
                 
                    HStack{
                        Text("Language:")
                            .font(.headline)
                        Text(language)
                    }
                   
                    HStack{
                        Text("Motto:")
                            .font(.headline)
                        Text(motto)
                    }
                
                    HStack{
                        Text("Email:")
                            .font(.headline)
                        Text(email)
                    }
                    
                    HStack{
                        Text("Phone:")
                            .font(.headline)
                        Text(phoneNumber)
                    }
                  
                    HStack{
                        Text("Address:")
                            .font(.headline)
                        Text(address)
                    }
                    
                    HStack{
                        Text("Bio:")
                            .font(.headline)
                        Text(bio)
                    }
                  
                    
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Settings
                Divider()
                
                Toggle(isOn: $notificationsEnabled) {
                    Text("Notifications")
                        .font(.headline)
                }
                
                Toggle(isOn: $darkModeEnabled) {
                    Text("Dark Mode")
                        .font(.headline)
                }
                
                Spacer()
            }
            .padding()
            
        }
        .padding(/*@START_MENU_TOKEN@*/.top/*@END_MENU_TOKEN@*/)
        .navigationBarTitle("Profile")
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(name: "John Doe", age: 30, id: "jdoe123", profilePhoto: Image("profile-photo"), language: "English", motto: "Live life to the fullest", email: "johndoe@example.com", phoneNumber: "555-555-5555", address: "123 Main St, Anytown USA", bio: "I'm a software engineer who loves to travel and try new foods.")
    }
}

