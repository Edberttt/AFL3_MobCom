//
//  friendDetails.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 25/11/23.
//
import Foundation
struct Activity: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
    let isPaying: Bool
}

import SwiftUI

struct FriendDetails: View {
//    @State private var activities: [Activity] = []
    @State private var totalRedPrice: Double = 0
    @State private var totalGreenPrice: Double = 0
    @State private var showAddActivityPopup = false
    @EnvironmentObject var friendsData: FriendsData
    
    var friend: Friend
    init(friend: Friend) {
            self.friend = friend
        }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Friend’s Details")
                    .font(
                        Font.custom("Open Sans", size: 32)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.51, green: 0.39, blue: 0.85))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
//                HStack{
//                    Image(systemName: "person.circle")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading, 20)
//                    
//                    Text("Test")
//                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
//                        .frame(width: 50, height: 50)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .offset(x: -100, y: 0)
//                }

                HStack{
                    Image("emoji\(friend.avatar)")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                    
                    Text(friend.name)
                        .font(Font.custom("Open Sans", size: 20).weight(.semibold))
                        .frame(width: 50, height: 50)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: -100, y: 0)
                }
                
                VStack(alignment: .leading) {
                    Text("You \(calculateAmountOwed() >= 0 ? "Pay" : "Owe"):")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                        .padding(.leading, 20)

                    Text("IDR \(abs(calculateAmountOwed()), specifier: "%.2f")")
                        .font(.system(size: 40))
                        .foregroundColor(.black)
                        .padding(.top, 2) // Adjust top padding if needed
                        .padding(.leading, 20)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

                
                Text("Details")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 35)
                
                // Display the details of each activity
                ForEach(friend.activities, id: \.id) { activity in
                    HStack {
                        Text(activity.name)
                            .foregroundColor(.black)
                            .padding(.leading,35)
                        
                        Spacer()  // Add a spacer to push the next Text to the right
                        
                        Text("IDR \(abs(activity.price), specifier: "%.2f")")
                            .foregroundColor(activity.isPaying ? .green : .red)
                            .padding(.trailing, 35)
                    }
                }

                
                Spacer()
                Button(action: {
                    showAddActivityPopup.toggle()
                }) {
                    Text("Add New Activity")
                        .foregroundColor(.white)
                        .padding(.horizontal, 70)
                        .padding(.vertical, 18)
                        .background(Color(hex: "8263D8"))
                        .cornerRadius(28)
                        .font(Font.custom("Open Sans", size: 20).weight(.bold))
                }
                .padding()
            }
            .blur(radius: showAddActivityPopup ? 3 : 0)
            
            if showAddActivityPopup {
                AddActivityView(
                    isPresented: $showAddActivityPopup,
                    addActivity: { newActivity in
                        addActivity(activity: newActivity)
                    }
                )
                .transition(.scale)
            }
        }
    }
    
    func calculateAmountOwed() -> Double {
        let amountOwed = (friend.totalRedPrice - friend.totalGreenPrice)/2
        return amountOwed
    }

    func addActivity(activity: Activity) {
        if let index = friendsData.friends.firstIndex(where: { $0.id == friend.id }) {
            // Update totalRedPrice and totalGreenPrice based on the new activity
            if activity.isPaying {
                // Friend pays for you (Red Price)
                friendsData.friends[index].totalRedPrice += abs(activity.price)
            } else {
                // You pay for friend (Green Price)
                friendsData.friends[index].totalGreenPrice += abs(activity.price)
            }

            friendsData.friends[index].activities.append(activity)
        }
    }
    
    
    
}
struct RadioButtonView: View {
    var isSelected: Bool

    var body: some View {
        ZStack {
            Circle()
                .fill(isSelected ? Color.purple : Color.white)
                .frame(width: 20, height: 20)

            if isSelected {
                Circle()
                    .stroke(Color.purple, lineWidth: 2)
                    .frame(width: 25, height: 25)
            }
        }
    }
}

struct AddActivityView: View {
    @State private var activityName = ""
    @State private var activityPrice = ""
    @State private var isPaying: Bool = true
    @Binding var isPresented: Bool
    var addActivity: (Activity) -> Void
    
    
    var body: some View {
        VStack(alignment: .center) {
            
            ZStack(alignment: .top) {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color(hex: "8263D8"))
                    .shadow(radius: 5)
                    .frame(width: 380, height: 418)
                Button(action: {
                    // Add new activity to friend details
                    if let price = Double(activityPrice), !activityName.isEmpty {
                        let activity = Activity(name: activityName, price: isPaying ? -price : price, isPaying: isPaying)
                        addActivity(activity)
                    }
                    isPresented = false
                }) {
                    Text("Add")
                        .font(Font.custom("Open Sans", size: 22).weight(.semibold))
                        .foregroundColor(.white)
                        .padding()
                        .cornerRadius(10)
                }
                .frame(width: 200, height: 50) // Adjust the width and height of the button as needed
                .position(x: 380 / 2, y: 418 - 30)
                
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color(hex: "051329"))
                    .shadow(radius: 5)
                    .frame(width: 380, height: 350)
                
                VStack {
                    Text("Add New Activity")
                        .font(Font.custom("Open Sans", size: 28).weight(.bold))
                        .foregroundColor(Color(hex: "8263D8"))
                        .padding(.bottom, 25)
                        .padding(.top, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Your Activity")
                            .font(Font.custom("Open Sans", size: 18).weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                            .padding(.bottom, -15)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                                .shadow(radius: 2)
                                .frame(height: 38)
                                .padding(.leading, 5)
                            
                            TextField("Activity Name", text: $activityName)
                                .padding(.vertical, 10)
                                .padding(.leading, 18)
                        }
                        .padding()
                        
                        Text("How Much You Owe or Pay")
                            .font(Font.custom("Open Sans", size: 18).weight(.semibold))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                            .padding(.bottom, -15)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                                .shadow(radius: 2)
                                .frame(height: 38)
                                .padding(.leading, 5)
                            
                            TextField("Activity Price", text: $activityPrice)
                                .padding(.vertical, 10)
                                .padding(.leading, 18)
                        }
                        .padding()
                        
                        HStack (alignment: .center) {
                            Button(action: {
                                isPaying = true
                            }) {
                                RadioButtonView(isSelected: isPaying)
                                Text("I Pay")
                                    .foregroundColor(.white)
                            }
                            .padding(.leading, 30)
                            .padding(.horizontal,30)
                            
                            Button(action: {
                                isPaying = false
                            }) {
                                RadioButtonView(isSelected: !isPaying)
                                Text("I Owe")
                                    .foregroundColor(.white)
                            }
                            
                        }
                        .accentColor(Color.purple)
                        .padding()
                    }
                    
                    Spacer()
                }
                
                .padding()
            }
            Spacer()
        } .padding(.top, 180)
    }
}

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}



//struct friendDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendDetails()
//    }
//    
//}
//struct friendDetails_Previews: PreviewProvider {
//    static var previews: some View {
//        FriendDetails(name: "Test Name", avatar: "Test Avatar", activities: [])
//    }
//}

struct friendDetails_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetails(friend: Friend(name: "Test Name",frequency: "Test F", avatar: 0, activities: [], totalRedPrice: 0, totalGreenPrice: 0))
    }
}

