//
//  FirestoreManager.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import Firebase
import FirebaseFirestoreSwift

struct FirestoreManager {
    let db: Firestore = Firestore.firestore()

    func addMessage(document: MessageDocument) -> Result<String, Error> {
        var res: Result<String, Error> = .success("")
        let ref = db.collection(Collections.messages.rawValue).addDocument(data: document.dictionary()) { err in
            if let err = err {
                res = .failure(err)
            }
        }
        res = .success(ref.documentID)
        return res
    }
}

enum Collections: String {
    case messages
}

struct MessageDocument {
    let message: String
    let userID: String

    func dictionary() -> [String:Any] {
        return [
            "message": message,
            "userID": userID
        ]
    }
}
