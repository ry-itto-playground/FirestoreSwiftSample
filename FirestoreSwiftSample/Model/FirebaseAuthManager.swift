//
//  FirebaseAuthManager.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/28.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import Firebase

struct FirebaseAuthManager {

    var currentUser: User? {
        return Auth.auth().currentUser
    }
    
    func createUser(withEmail email: String, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
                completion(nil)
            }

            if let user = result?.user {
                completion(user)
            } else {
                completion(nil)
            }
        }
    }

    func signIn(withEmail email: String, password: String, completion: @escaping (User?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
                completion(nil)
            }

            if let user = result?.user {
                completion(user)
            } else {
                completion(nil)
            }
        }
    }
}
