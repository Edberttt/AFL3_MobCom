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

struct AddFriendView: View {
    @State private var selectedFrequency = "Daily"
    private let frequencyOptions = ["Daily", "Weekly", "Monthly"]
    @State private var textFieldWidth: CGFloat = 0
    @State private var selectedEmoji: Int?
    @State private var showAlert = false
    @State private var textFieldText: String = ""
    @State private var showEmptyFieldsAlert = false
    
    var isAllInputSelected : Bool {
        return !selectedFrequency.isEmpty && !textFieldText.isEmpty && selectedEmoji != nil
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("051329")
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                HStack(spacing: 20) {
                    Image(systemName: "arrowshape.turn.up.backward.circle")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("Add New Friend")
                        .foregroundColor(Color("8263D8"))
                        .font(.title)
                }
                .padding(.horizontal, 20)
                .padding(.top)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Friend Name :")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.bottom)
                    
                    TextField("Enter friend's name", text: $textFieldText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .cornerRadius(12)
                        .padding(.bottom)
                        
                    
                    Text("Transaction Frequency :")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.bottom)

                    
                    Picker(selection: $selectedFrequency, label: Text("Transaction Frequency :")) {
                        ForEach(frequencyOptions, id: \.self) { option in
                            Text(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
                    .padding(.bottom,20)
        
                    Text("Choose Your Friend's Avatar : ")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
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
                                    
//                                if isSelected {
//                                    Image(systemName: "checkmark.circle.fill")
//                                        .foregroundColor(.green)
//                                        .offset(x: 30, y: -30)
//                                }
                            }
                        }
                    }
                    .padding(.bottom, 60)
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        Text("Add Friend")
                            .frame(maxWidth: .infinity)
                            .frame(height: 35)
                            .font(.title3)
                    }
                    .background(Color("8263D8"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("New Friend Has Been Added!"),
                            message: nil,
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .alert(isPresented: $showAlert) {
                        if isAllInputSelected {
                            return Alert(
                                title: Text("New Friend Has Been Added!"),
                                message: nil,
                                dismissButton: .default(Text("OK"))
                            )
                        } else {
                            return Alert(
                                title: Text("Please Fill in All Fields"),
                                message: nil,
                                dismissButton: .default(Text("OK"))
                            )
                        }
                    }

                }
                .padding(.horizontal)
            }
        }
        
    }
    struct AddFriendView_Previews: PreviewProvider {
        static var previews: some View {
            AddFriendView()
        }
    }
}

//#Preview {
//    AddFriendView()
//}

