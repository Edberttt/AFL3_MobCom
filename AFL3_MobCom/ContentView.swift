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

    var body: some View {
        

//        let totalYouOwe = Dummyfriendss.reduce(0) { total, friend in
//            total + (friend.owe == "You Owe:" ? Int(friend.amount) ?? 0 : 0)
//        }
//        
//        let totalFriendsOwe = Dummyfriendss.reduce(0) { total, friend in
//            total + (friend.owe == "You Pay:" ? Int(friend.amount) ?? 0 : 0)
//        }
//        
//        let totalFriendsYouOwe = Dummyfriendss.filter { $0.owe == "You Owe:" }.count
        
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
                    
//                    Text("IDR \(totalYouOwe)")
//                        .font(Font.custom("Open Sans", size: 36).weight(.semibold))
//                        .foregroundColor(.black)
//                        .offset(x: -13, y: 12)
                    
                    Text("IDR 0")
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
                    
//                    Text("\(totalFriendsYouOwe)")
//                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
//                        .foregroundColor(.black)
//                        .offset(x: 0, y: 12)
                    Text("0")
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
                    
//                    Text("IDR \(totalFriendsOwe)")
//                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
//                        .foregroundColor(.black)
//                        .offset(x: -9.50, y: 12)
                    Text("IDR 0")
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

//            ScrollView{
//                LazyVStack(alignment: .leading) {
//                    ForEach(friends, id: \.name) { friend in
//                        VStack{
//                            HStack{
//                                Image("emoji\(friend.avatar)")
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 80, height: 80)
//                                    .clipShape(Circle())
//                                
//                                    .onTapGesture{
//                                        isFriendDetailPresented = true
//                                    }
//                                    .sheet(isPresented: $isFriendDetailPresented) {
//                                        FriendDetails()
//                                    }
//                                
//                                Text(friend.name)
//                                    .font(Font.custom("Open Sans", size: 20).weight(.semibold))
//                                    .foregroundColor(.white)
//                                    .padding(.vertical, 8)
//                                
//                                
//                                    .onTapGesture{
//                                        isFriendDetailPresented = true
//                                    }
//                                    .sheet(isPresented: $isFriendDetailPresented) {
//                                        FriendDetails()
//                                    }
//                                
//                            }
//                            
//                        }
//                        Divider().background(Color.gray)
//                    }
//                }
//            } .padding(.top, 600)
            
            VStack{
                ScrollView{
                    VStack {
                        ZStack {
                            LazyVStack(alignment: .leading) {
//                                ForEach(friends, id: \.name) { friend in
                                ForEach(friends.indices, id: \.self) { index in
                                    let friend = friends[index]
                                    VStack{
                                        HStack{
                                            Image("emoji\(friend.avatar)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 80, height: 80)
                                                .clipShape(Circle())
                                            
                                                .onTapGesture {
                                                    friends[index].isDetailPresented.toggle()
                                                }
                                                .sheet(isPresented: $friends[index].isDetailPresented){
                                                    FriendDetails(name: friend.name, avatar: "emoji\(friend.avatar)")
                                                }
                                            
                                            
                                            Text(friend.name)
                                                .font(Font.custom("Open Sans", size: 20).weight(.semibold))
                                                .foregroundColor(.white)
                                                .padding(.vertical, 8)
                                            
                                                .onTapGesture {
                                                    friends[index].isDetailPresented.toggle()
                                                }
                                                .sheet(isPresented: $friends[index].isDetailPresented){
                                                    FriendDetails(name: friend.name, avatar: "emoji\(friend.avatar)")
                                                }
                                            
//                                                .onTapGesture{
//                                                    isFriendDetailPresented = true
//                                                }
//                                                .sheet(isPresented: $isFriendDetailPresented) {
////                                                    FriendDetails()
//                                                    FriendDetails(name: friend.name, avatar: "emoji\(friend.avatar)")
//                                                }
                                            
                                        }
                                        .padding()
                                        
                                    }
                                    Divider().background(Color.gray)
                                }
                                .frame(width : .infinity, height:.infinity)
                                
                                
                            }
                            
//                            ForEach(Dummyfriendss, id: \.name) {friend in
//                                VStack {
//                                    Text(friend.owe)
//                                        .font(Font.custom("PT Sans", size: 10))
//                                        .foregroundColor(friend.owe == "You Owe:" ? Color(red: 0.91, green: 0.14, blue: 0.14) : Color(red: 0.14, green: 0.70, blue: 0.09))
//                                    Text("IDR \(friend.amount)")
//                                        .font(Font.custom("PT Sans", size: 10))
//                                        .foregroundColor(friend.owe == "You Owe:" ? Color(red: 0.91, green: 0.14, blue: 0.14) : Color(red: 0.14, green: 0.70, blue: 0.09))
//                                }
//                                .offset(x: 80, y: 0.50)
//                            }
                        }
                        .frame(width: .infinity, height: .infinity)
                        //                        .padding(.bottom)
                        //                            }
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
