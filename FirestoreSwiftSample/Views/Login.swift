//
//  Login.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/27.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var password: String = ""
    private let firebaseAuthManager = FirebaseAuthManager()

    var body: some View {
        Form {
            HStack {
                Text("E-mail")
                TextField(.init("email"), text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Password")
                SecureField(.init(""), text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: {
                self.firebaseAuthManager.signIn(withEmail: self.email, password: self.password) { (user) in
                    if let user = user {
                        print(user)
                    }
                }
            }) {
                Text("Login")
            }
            Button(action: {
                self.firebaseAuthManager.createUser(withEmail: self.email, password: self.password) { (user) in
                    if let user = user {
                        print(user)
                    }
                }
            }) {
                Text("Create Account")
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
