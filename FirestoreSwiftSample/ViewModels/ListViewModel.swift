//
//  ListViewModel.swift
//  FirestoreSwiftSample
//
//  Created by 伊藤凌也 on 2019/10/27.
//  Copyright © 2019 ry-itto. All rights reserved.
//
import Combine

final class ListViewModel: ObservableObject {

    private var cancellables: [AnyCancellable] = []

    // Input
    enum Input {
        case onAppear
    }
    let onAppearSubject = PassthroughSubject<Void, Never>()

    // Output
    @Published private(set) var messages: [MessageDocument] = []

    private let firestoreSubject = PassthroughSubject<[MessageDocument], Error>()

    private let firestoreManager: FirestoreManager

    init(firestoreManager: FirestoreManager = FirestoreManager()) {
        self.firestoreManager = firestoreManager

        onAppearSubject
            .setFailureType(to: Error.self)
            .flatMap { firestoreManager.publisher }
            .share()
            .subscribe(firestoreSubject)
            .store(in: &cancellables)

        firestoreSubject
            .replaceError(with: [])
            .assign(to: \.messages, on: self)
            .store(in: &cancellables)
    }
}
