//
//  ContentView.swift
//  AFL3
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct Friend {
    var name: String
    var owe: String
    var amount: String
}

struct ContentView:View {
    @State private var isAddViewPresented = false
    @State private var isFriendDetailPresented = false
    
    var body: some View {
        
        let friends = [
            Friend(name: "Friend 1", owe: "You Owe:", amount: "25000"),
            Friend(name: "Friend 2", owe: "You Pay:", amount: "20000"),
            Friend(name: "Friend 3", owe: "You Owe:", amount: "20000"),
            Friend(name: "Friend 4", owe: "You Pay:", amount: "25000"),
            Friend(name: "Friend 5", owe: "You Owe:", amount: "25000"),
            Friend(name: "Friend 6", owe: "You Owe:", amount: "25000"),
            Friend(name: "Friend 7", owe: "You Owe:", amount: "25000"),
            Friend(name: "Friend 8", owe: "You Owe:", amount: "25000"),
            Friend(name: "Friend 9", owe: "You Owe:", amount: "25000"),
            Friend(name: "Friend 10", owe: "You Owe:", amount: "25000"),
        ]
        
        let totalYouOwe = friends.reduce(0) { total, friend in
            total + (friend.owe == "You Owe:" ? Int(friend.amount) ?? 0 : 0)
        }

        let totalFriendsOwe = friends.reduce(0) { total, friend in
            total + (friend.owe == "You Pay:" ? Int(friend.amount) ?? 0 : 0)
        }
        
        let totalFriendsYouOwe = friends.filter { $0.owe == "You Owe:" }.count
        
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
                    
                    Text("IDR \(totalYouOwe)")
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

                    Text("\(totalFriendsYouOwe)")
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
                    
                    Text("IDR \(totalFriendsOwe)")
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
                
                
                VStack{
                    ScrollView{
                        VStack {
                            ForEach(friends, id: \.name) { friend in
                                ZStack {
                                    
                                    Text(friend.name)
                                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                                        .foregroundColor(.white)
                                        .offset(x: -50, y: 0.50)
                                    
                                    VStack {
                                        Text(friend.owe)
                                            .font(Font.custom("PT Sans", size: 10))
                                            .foregroundColor(friend.owe == "You Owe:" ? Color(red: 0.91, green: 0.14, blue: 0.14) : Color(red: 0.14, green: 0.70, blue: 0.09))
                                        Text("IDR \(friend.amount)")
                                            .font(Font.custom("PT Sans", size: 10))
                                            .foregroundColor(friend.owe == "You Owe:" ? Color(red: 0.91, green: 0.14, blue: 0.14) : Color(red: 0.14, green: 0.70, blue: 0.09))
                                    }
                                    .offset(x: 80, y: 0.50)
                                }
                                .frame(width: 355, height: 58)
        //                        .padding(.bottom)
                            }
                        }
                    }
                    .frame(width:400, height: 580, alignment: .center)
                }
                .offset(x: 20, y: 250)
                .frame(width:500, height: 580, alignment: .center)
                
            }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 32.03, height: 31)
                .background(
                    AsyncImage(url: URL(string: "https://via.placeholder.com/32x31"))
                )
                .offset(x: -148.98, y: 14.50)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 30, height: 31.20)
                .background(
                    AsyncImage(url: URL(string: "https://via.placeholder.com/30x31"))
                )
                .offset(x: -149, y: 90.60)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 35, height: 35)
                .background(
                    AsyncImage(url: URL(string: "https://via.placeholder.com/35x35"))
                )
                .offset(x: -150.50, y: 167.50)
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 40, height: 60.74)
                .background(
                    AsyncImage(url: URL(string: "https://via.placeholder.com/40x61"))
                )
                .offset(x: -148, y: 247.37)
                    
                    
            Text("+ Add New Friend")
                .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
                .offset(x: 105, y: -127)
                .onTapGesture {
                    isAddViewPresented = true
                }
                .sheet(isPresented: $isAddViewPresented) {
                    friendDetails() // Ganti dengan nama Viewnya dsini
                }
                
                
            }
            .frame(width: 430, height: 932)
            .background(.white)
            .padding(.top, 100)
        }
        
}


#Preview {
    ContentView()
}
