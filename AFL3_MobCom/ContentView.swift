//
//  ContentView.swift
//  AFL3
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct ContentView:View {
    @State private var isAddViewPresented = false
    
    
    var body: some View {
        
        
        ZStack() {
            Group {
                Text("Debt Dazzle")
                    .font(Font.custom("Open Sans", size: 32).weight(.semibold))
                    .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
                    .offset(x: -86.50, y: -384)
                ZStack() {
                    Text("Total Your Owe:")
                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                        .foregroundColor(Color(red: 0.56, green: 0.54, blue: 0.54).opacity(0.90))
                        .offset(x: -59, y: -26.50)
                    Text("IDR 75.000,00")
                        .font(Font.custom("Open Sans", size: 36).weight(.semibold))
                        .foregroundColor(.black)
                        .offset(x: 0, y: 12)
                }
                .offset(x: -37, y: -294.50)
                ZStack() {
                    Text("Total Friends You Owe:")
                        .font(Font.custom("Open Sans", size: 13).weight(.semibold))
                        .foregroundColor(Color(red: 0.56, green: 0.54, blue: 0.54).opacity(0.90))
                        .offset(x: 0, y: -16.50)
                    Text("2")
                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
                        .foregroundColor(.black)
                        .offset(x: -66, y: 12)
                }
                .offset(x: 100, y: -217.50)
                ZStack() {
                    Text("Total Your Friend’s Owe")
                        .font(Font.custom("Open Sans", size: 13).weight(.semibold))
                        .foregroundColor(Color(red: 0.56, green: 0.54, blue: 0.54).opacity(0.90))
                        .offset(x: 0, y: -16.50)
                    Text("IDR 40.000,00")
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
                        ZStack() {
                            
                        }
                        .frame(width: 24, height: 24)
                        .offset(x: -37.50, y: 0)
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
                ZStack() {
                    Ellipse()
                        .foregroundColor(.clear)
                        .frame(width: 45, height: 45)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.90))
                        .offset(x: -149, y: -6.50)
                    Text("Friend 1")
                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                        .foregroundColor(.white)
                        .offset(x: -80, y: -7)
                    Text("You Owe:       IDR 25.000,00")
                        .font(Font.custom("PT Sans", size: 10))
                        .foregroundColor(Color(red: 0.91, green: 0.14, blue: 0.14))
                        .offset(x: 99, y: -8.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 0)
                        .overlay(Rectangle()
                            .stroke(.white, lineWidth: 0.50))
                        .offset(x: -2.50, y: 29)
                    ZStack() {
                        
                    }
                    .frame(width: 24, height: 24)
                    .offset(x: 165.50, y: -7)
                }
                .frame(width: 355, height: 58)
                .offset(x: 0.50, y: 21)
                ZStack() {
                    Ellipse()
                        .foregroundColor(.clear)
                        .frame(width: 45, height: 45)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.90))
                        .offset(x: -149, y: -6.50)
                    Text("Friend 2")
                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                        .foregroundColor(.white)
                        .offset(x: -80, y: -7)
                    Text("You Pay:       IDR 20.000,00")
                        .font(Font.custom("PT Sans", size: 10))
                        .foregroundColor(Color(red: 0.14, green: 0.70, blue: 0.09))
                        .offset(x: 99, y: -8.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 0)
                        .overlay(Rectangle()
                            .stroke(.white, lineWidth: 0.50))
                        .offset(x: -2.50, y: 29)
                    ZStack() {
                        
                    }
                    .frame(width: 24, height: 24)
                    .offset(x: 165.50, y: -7)
                }
                .frame(width: 355, height: 58)
                .offset(x: 0.50, y: 98)
                ZStack() {
                    Ellipse()
                        .foregroundColor(.clear)
                        .frame(width: 45, height: 45)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.90))
                        .offset(x: -149, y: -6.50)
                    Text("Friend 3")
                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                        .foregroundColor(.white)
                        .offset(x: -80, y: -7)
                    Text("You Owe:       IDR 50.000,00")
                        .font(Font.custom("PT Sans", size: 10))
                        .foregroundColor(Color(red: 0.91, green: 0.14, blue: 0.14))
                        .offset(x: 99, y: -8.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 0)
                        .overlay(Rectangle()
                            .stroke(.white, lineWidth: 0.50))
                        .offset(x: -2.50, y: 29)
                    ZStack() {
                        
                    }
                    .frame(width: 24, height: 24)
                    .offset(x: 165.50, y: -7)
                }
                .frame(width: 355, height: 58)
                .offset(x: 0.50, y: 175)
            }
            Group {
                ZStack() {
                    Ellipse()
                        .foregroundColor(.clear)
                        .frame(width: 45, height: 45)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.90))
                        .offset(x: -149, y: -6.50)
                    Text("Friend 4")
                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                        .foregroundColor(.white)
                        .offset(x: -80, y: -7)
                    Text("You Pay:       IDR 20.000,00")
                        .font(Font.custom("PT Sans", size: 10))
                        .foregroundColor(Color(red: 0.14, green: 0.70, blue: 0.09))
                        .offset(x: 99, y: -8.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 0)
                        .overlay(Rectangle()
                            .stroke(.white, lineWidth: 0.50))
                        .offset(x: -2.50, y: 29)
                    ZStack() {
                        
                    }
                    .frame(width: 24, height: 24)
                    .offset(x: 165.50, y: -7)
                }
                .frame(width: 355, height: 58)
                .offset(x: 0.50, y: 252)
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
                        AddView() // Ganti dengan nama Viewnya dsini
                    }
            }
//            .navigationBarTitle("Friends")
                
                //                        NavigationLink(destination: AddView()) {
                //                                    Text("+ Add New Friend")
                //                                        .font(Font.custom("Open Sans", size: 15).weight(.semibold))
                //                                        .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
                //                                        .offset(x: 105, y: -127)
                //                                }
                //
                //                    }
                
                
            
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
}



#Preview {
    ContentView()
}
