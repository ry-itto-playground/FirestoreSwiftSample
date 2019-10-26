//
//  FirestoreManager.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/25.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import Combine
import Foundation
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

    func fetchDocuments(completion: @escaping (Result<[MessageDocument], Error>) -> Void) {
        db.collection(Collections.messages.rawValue).getDocuments { querySnapshot, error in
            let documents = querySnapshot!.documents.compactMap { MessageDocument($0.data()) }
            completion(.success(documents))
        }
    }
}

enum Collections: String {
    case messages
}

struct MessageDocument: Identifiable, Decodable {
    var id: UUID

    let message: String
    let userID: String

    init(message: String, userID: String) {
        self.id = UUID()
        self.message = message
        self.userID = userID
    }

    init?(_ dictionary: [String:Any]) {
        guard let message = dictionary["message"] as? String,
            let userID = dictionary["userID"] as? String else { return nil }
        self.id = UUID()
        self.message = message
        self.userID = userID
    }

    func dictionary() -> [String:Any] {
        return [
            "message": message,
            "userID": userID
        ]
    }
}

extension FirestoreManager {
    var publisher: FirestorePublisher {
        return FirestorePublisher(firestoreManager: self)
    }
}

struct FirestorePublisher: Publisher {
    typealias Output = [MessageDocument]
    typealias Failure =  Error

    let firestoreManager: FirestoreManager

    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
        firestoreManager.fetchDocuments { result in
            switch result {
            case .success(let messages):
                _ = subscriber.receive(messages)
                subscriber.receive(completion: .finished)
            case .failure(let error):
                subscriber.receive(completion: .failure(error))
            }
        }
    }
}
