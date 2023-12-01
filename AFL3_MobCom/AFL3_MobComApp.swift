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

//class FriendsData: ObservableObject {
////    @Published var friends: [Friend] = []
//    
//    @Published var friends: [Friend]
//
//        // Other code...
//
//        func removeFriend(at index: Int) {
//            friends.remove(at: index)
//        }
//}

class FriendsData: ObservableObject {
    @Published var friends: [Friend]

    init() {
        friends = [] // Add your initial data here
    }

    func removeFriend(at index: Int) {
        friends.remove(at: index)
    }
}

@main
struct AFL3App: App {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = false
    @StateObject private var friendsData = FriendsData()
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                ContentView()
                    .environmentObject(friendsData)
                
            } else {
                FirstPage()
                    .environmentObject(friendsData)
                    .onDisappear {
                        // Set isFirstLaunch to false when FirstPage is dismissed
                        isFirstLaunch = true
                    }
                
            }
        }
    }
}
