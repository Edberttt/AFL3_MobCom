//
//  ContentView.swift
//  AFL3
//
//  Created by MacBook Pro on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Debt Dazzle")
              .font(
                Font.custom("Open Sans", size: 32)
                  .weight(.semibold)
              )
              .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
            
            HStack{
                Spacer()
                Text("+ Add New Friend")
                  .font(
                    Font.custom("Open Sans", size: 15)
                      .weight(.semibold)
                  )
                  .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
            }
                        
            Image("Rectangle 2")
            .frame(width: 377, height: 41)
            .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.9))
            
            Image("material-symbols-light:search")
            .frame(width: 24, height: 24)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
