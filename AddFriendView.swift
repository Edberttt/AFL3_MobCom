//
//  AddFriendView.swift
//  AFL3_MobCom
//
//  Created by MacBook Pro on 25/11/23.
//

import SwiftUI

extension Color {
    init(_ hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct Friend: Identifiable {
    var id = UUID()
    var name: String
    var frequency: String
    var avatar: Int
    var amount = 0
    var owe = "you Pay"
    var isDetailPresented = false
    var activities: [Activity]
    var totalRedPrice: Double
    var totalGreenPrice: Double
}


struct AddFriendView: View {
    @State private var selectedFrequency = "Daily"
    private let frequencyOptions = ["Daily", "Weekly", "Monthly"]
    @State private var textFieldWidth: CGFloat = 0
    @State private var selectedEmoji: Int?
    @State private var showAlert = false
    @State private var textFieldText: String = ""
    @State private var navigateToContentView = false
    @State private var selesai = false
//    @State private var showEmptyFieldsAlert = false
    
    @State private var isButtonBack = false
//    @Environment(\.presentationMode) var presentationMode
//    @State private var friends: [addFriend] = []
//    @Binding var friends: [addFriend]
//    @State private var shouldDismissView = false
    @Binding var friends: [Friend]
//    @Binding var shouldDismissView: Bool
    @EnvironmentObject var friendsData: FriendsData
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = false
    
    @State private var alertType: AlertType = .none

    enum AlertType {
        case none
        case success
        case failure
    }
    
//    let addFriends = [name, frequency, avatar]
    
    var isAllInputSelected : Bool {
        return !selectedFrequency.isEmpty && !textFieldText.isEmpty && selectedEmoji != nil
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                Color("051329")
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 35) {
                    HStack(spacing: 20) {
                        if isFirstLaunch {
                            Text("Add New Friend")
                                .foregroundColor(Color("8263D8"))
                                .font(.title)
                        } else {
                            Text("Your Friend's Data")
                                .foregroundColor(Color("8263D8"))
                                .font(.title)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Friend Name :")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.bottom, 0)
                            .padding(.horizontal)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                                .shadow(radius: 2)
                                .frame(width: 350, height: 35)
                                .padding(.leading, 20)
                            
                            TextField("Enter friend's name", text: $textFieldText)
                                .padding(.vertical, 10)
                                .padding(.leading, 35)
                        }.padding(.bottom,15)
                        //                    TextField("Enter friend's name", text: $textFieldText)
                        //                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        //                        .cornerRadius(15)
                        //                        .padding(.bottom)
                        //                        .padding(.horizontal,10)
                        //                        .padding(.leading,15)
                        
                        Text("Transaction Frequency :")
                            .foregroundColor(.white)
                            .font(.headline)
                            .padding(.bottom,0)
                            .padding(.horizontal)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.white)
                                .shadow(radius: 2)
                                .frame(width: 350, height: 35)
                                .padding(.leading, 20)
                            
                            Picker(selection: $selectedFrequency, label: Text("Transaction Frequency :")) {
                                ForEach(frequencyOptions, id: \.self) { option in
                                    Text(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding(.leading,35)
                        }.padding(.bottom,20)
                        
                        
                        
                        Text("Choose Your Friend's Avatar : ")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .padding(.horizontal)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 8) {
                            ForEach(1...9, id: \.self) { index in let isSelected = selectedEmoji == index
                                ZStack {
                                    Image("emoji\(index)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                        .padding(5)
                                        .onTapGesture {
                                            if isSelected {
                                                selectedEmoji = nil
                                            } else {
                                                selectedEmoji = index
                                            }
                                        }
                                    if isSelected {
                                        Circle()
                                            .stroke(Color("8263D8"), lineWidth: 7)
                                            .frame(width: 90, height: 90)
                                    }
                                    
                                }
                            }
                        }
                        .padding(.bottom, 60)
                        .padding(.horizontal)
                        
                        Button(action: {
                            if isAllInputSelected {
                                //                            let newFriend = Friend(name: textFieldText, frequency: selectedFrequency, avatar: selectedEmoji!)
                                let newFriend = Friend(name: textFieldText, frequency: selectedFrequency, avatar: selectedEmoji!, activities: [], totalRedPrice:0, totalGreenPrice:0)
                                //                            friends.append(newFriend)
                                friendsData.friends.append(newFriend)
                                alertType = .success
                                showAlert = true
                                //                            shouldDismissView = true
                            } else {
                                alertType = .failure
                                showAlert = true
                            }
                        }) {
                            Text("Add Friend")
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .font(.title3)
                        }
                        .background(Color("8263D8"))
                        .cornerRadius(28)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .alert(isPresented: $showAlert) {
                            switch alertType {
                            case .success:
                                return Alert(
                                    title: Text("New Friend Has Been Added!"),
                                    message: nil,
                                    dismissButton: .default(Text("OK")) {
                                        if isFirstLaunch {
                                            presentationMode.wrappedValue.dismiss()
                                        } else {
                                            navigateToContentView = true
                                            isFirstLaunch = true
                                        }
                                        
                                        
                                    }
                                )
                            case .failure:
                                return Alert(
                                    title: Text("Please Fill in All Fields"),
                                    message: nil,
                                    dismissButton: .default(Text("OK"))
                                )
                            default:
                                return Alert(title: Text(""))
                            }
                        }

                            NavigationLink(
                                destination: ContentView(),
                                isActive: $navigateToContentView
                                
                            ) {
                                EmptyView()
                            }
                            .hidden()
                            
                            
                            .onAppear {
                                // Reset the state to prevent continuous navigation
                                
                                navigateToContentView = false
//                                ContentView()
                            }

                        }
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
//    struct AddFriendView_Previews: PreviewProvider {
//        static var previews: some View {
//            AddFriendView()
//        }
//    }
    struct AddFriendView_Previews: PreviewProvider {
        @State static var friends: [Friend] = []
        @State static var shouldDismissView = false
        
        static var previews: some View {
            AddFriendView(friends: $friends)
        }
    }
}
//
//#Preview {
//    AddFriendView()
//}
//
//
