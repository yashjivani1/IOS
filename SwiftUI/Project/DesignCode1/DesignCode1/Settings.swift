//
//  Settings.swift
//  DesignCode1
//
//  Created by haco on 10/12/20.
//  Copyright © 2020 haco. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView{
            Form{
                Toggle(isOn: .constant(true)){
                    Text("Receive notifications")
                }
                Stepper(value: $number, in: 1...10){
                    Text("\(number) Notifications per week")
                }
                Picker(selection: $selection, label: Text("Favorite Course")){
                    Text("Swiftui").tag(1)
                    Text("React").tag(2)
                }
                
                DatePicker(selection: $date){
                    Text("Date")
                }
                Section(header: Text("Email")){
                    TextField("Your email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Button(action: {self.submit.toggle()}){
                    Text("Submit")
                }
            .alert(isPresented: $submit, content: {
                Alert(title: Text("Thanks!"), message: Text("Email \(email)"))
            })
            
               
            }
        .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
