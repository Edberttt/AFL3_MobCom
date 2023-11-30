//
//  FirstPage.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 30/11/23.
//

import SwiftUI

struct FirstPage: View {
    @State private var friends: [Friend] = []
    @EnvironmentObject var friendsData: FriendsData
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo-light(nobackground)-2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 200)
                    .padding(.bottom, 100)
                    .padding(.top, 180)
                
                Spacer()
                
                NavigationLink(destination: AddFriendView(friends: $friends).environmentObject(friendsData)) {
                    Text("GET STARTED")
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .font(.title3)
                }
                .background(Color("8263D8"))
                .cornerRadius(30)
                .foregroundColor(.white)
                .padding(.horizontal)
                
                Text("Hello")
                    .foregroundColor(.white)
                Text("Hello")
                    .foregroundColor(.white)
                Text("Hello")
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    FirstPage()
}
