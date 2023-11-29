//
//  ContentView.swift
//  AFL3
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct DummyFriend2 {
    var name: String
    var owe : String
    var amount : String
}

struct ContentView:View {
    @State private var isAddViewPresented = false
    @State private var isFriendDetailPresented = false
    @State private var friends: [Friend] = []
    
    @EnvironmentObject var friendsData: FriendsData
    
    var countTotalFriendsYouOwe: Int {
        friendsData.friends.reduce(0) { total, friend in
            let amountOwed = (friend.totalRedPrice - friend.totalGreenPrice) / 2
            return total + (amountOwed < 0 ? 1 : 0)
        }
    }
    
    var totalFriendsOwe: Double {
        friendsData.friends.reduce(0) { total, friend in
            let amountOwed = (friend.totalRedPrice - friend.totalGreenPrice) / 2
            return total + (amountOwed > 0 ? amountOwed : 0)
        }
    }

    var totalFriendsAmountYouOwe: Double {
        friendsData.friends.reduce(0) { total, friend in
            let amountOwed = (friend.totalRedPrice - friend.totalGreenPrice) / 2
            return total + (amountOwed < 0 ? -amountOwed : 0)
        }
    }

    var body: some View {
        
        ZStack() {
            Group {
                Text("Debt Dazzle")
                    .font(Font.custom("Open Sans", size: 32).weight(.semibold))
                    .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
                    .offset(x: -86.50, y: -384)
                    .padding(.top, 20)
                ZStack() {
                    
                    Text("Total Your Owe:")
                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                        .foregroundColor(Color(red: 0.56, green: 0.54, blue: 0.54).opacity(0.90))
                        .offset(x: -59, y: -26.50)
                    
                    Text("IDR \(abs(totalFriendsAmountYouOwe), specifier: "%.2f"),-")
                        .font(Font.custom("Open Sans", size: 36).weight(.semibold))
                        .foregroundColor(.black)
                        .offset(x: -13, y: 12)
                }
                .offset(x: -37, y: -294.50)
                ZStack() {
                    Text("Total Friends You Owe:")
                        .font(Font.custom("Open Sans", size: 13).weight(.semibold))
                        .foregroundColor(Color(red: 0.56, green: 0.54, blue: 0.54).opacity(0.90))
                        .offset(x: 0, y: -16.50)
                    
                    Text("\(countTotalFriendsYouOwe)")
                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
                        .foregroundColor(.black)
                        .offset(x: 0, y: 12)
                }
                .offset(x: 100, y: -217.50)
                ZStack() {
                    
                    Text("Total Your Friend’s Owe: ")
                        .font(Font.custom("Open Sans", size: 13).weight(.semibold))
                        .foregroundColor(Color(red: 0.56, green: 0.54, blue: 0.54).opacity(0.90))
                        .offset(x: 0, y: -16.50)
                    Text("IDR \(abs(totalFriendsOwe), specifier: "%.2f"),-")
                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
                        .foregroundColor(.black)
                        .offset(x: -9.50, y: 12)
                }
                .offset(x: -79.50, y: -217.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 703)
                    .background(Color(red: 0.02, green: 0.07, blue: 0.16))
                    .cornerRadius(60)
                    .offset(x: 0, y: 180.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 120, height: 0)
                    .overlay(Rectangle()
                        .stroke(.white, lineWidth: 1))
                    .offset(x: 0, y: 452)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 364, height: 38)
                        .background(Color(red: 0.51, green: 0.38, blue: 0.85))
                        .cornerRadius(20)
                        .offset(x: 0, y: 0)
                    ZStack() {
                        Text("Search")
                            .font(Font.custom("Open Sans", size: 16))
                            .foregroundColor(.white)
                            .offset(x: 14, y: 0)
                    }
                    .frame(width: 99, height: 28)
                    .offset(x: -119.50, y: 0)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15) // Increase leading padding
                    }
                    
                }
                .frame(width: 364, height: 38)
                .offset(x: 0, y: -79)
                
            }
            
            VStack{
                ScrollView{
                    VStack {
                        ZStack {
                            LazyVStack(alignment: .leading) {

                                ForEach(friendsData.friends.indices, id: \.self) { index in
                                    let friend = friendsData.friends[index]
                                    let amountOwed = (friend.totalRedPrice - friend.totalGreenPrice) / 2
                                    VStack{
                                        HStack{
                                            Image("emoji\(friend.avatar)") // Make sure you have images named like "emoji1", "emoji2", etc.
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                                .onTapGesture {
                                                    friendsData.friends[index].isDetailPresented.toggle()
                                                }
                                                .sheet(isPresented: $friendsData.friends[index].isDetailPresented){
                                                    FriendDetails(friend: friend) // Pass a Friend object
                                                        .environmentObject(friendsData)
                                                }
                                            
                                            Spacer().frame(width : 20)
                                            
                                            Text(friend.name)
                                                .font(Font.custom("Open Sans", size: 20).weight(.semibold))
                                                .foregroundColor(.white)
                                                .padding(.vertical, 8)
                                                .onTapGesture {
                                                    friendsData.friends[index].isDetailPresented.toggle()
                                                }
                                                .sheet(isPresented: $friendsData.friends[index].isDetailPresented){
                                                    FriendDetails(friend: friend) // Pass a Friend object
                                                        .environmentObject(friendsData)
                                                }
                                            
                                            Spacer().frame(width : 20)

                                            Text(friend.totalRedPrice >= friend.totalGreenPrice ? "You Pay \n IDR \(abs(amountOwed), specifier: "%.2f"),-" : "You Owe \n IDR \(abs(amountOwed), specifier: "%.2f"),-")
                                                .font(Font.custom("PT Sans", size: 16))
                                                .foregroundColor(friend.totalRedPrice >= friend.totalGreenPrice ? Color(red: 0.14, green: 0.70, blue: 0.09) : Color(red: 0.91, green: 0.14, blue: 0.14))
//                                                .offset(x: 90, y: 0)
                                                .padding(.horizontal, 5)
                                                .padding(.vertical, 8)
                                        }
                                        .padding()
                                    }
                                    Divider().background(Color.gray)
                                }
                                .frame(width : .infinity, height: .infinity)
                                
                                
                            }
                            
                        }
                        .frame(width: .infinity, height: .infinity)

                    }
                }
                .frame(width:400, height: 580, alignment: .leading)
            }
            .frame(width:300, height: .infinity)
            .padding(.top, 500)
            

            
            Text("+ Add New Friend")
                .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
                .offset(x: 105, y: -127)
                .onTapGesture {
                    isAddViewPresented = true
                }
                .sheet(isPresented: $isAddViewPresented) {
                    AddFriendView(friends: $friends)
                }
            
        }
        .frame(width: 430, height: 1200)
        .background(.white)
        .padding(.top, 100)
    }
    
    
}


#Preview {
    ContentView()
}
