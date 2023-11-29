//
//  AFL3_MobComApp.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 24/11/23.
//

import SwiftUI

//@main
//struct AFL3_MobComApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

class FriendsData: ObservableObject {
    @Published var friends: [Friend] = []
}

@main
struct AFL3App: App {
    @StateObject private var friendsData = FriendsData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(friendsData)
        }
    }
}
