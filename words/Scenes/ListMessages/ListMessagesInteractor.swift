//
//  ListMessagesInteractor.swift
//  words
//
//  Created by Neo Ighodaro on 09/12/2017.
//  Copyright (c) 2017 CreativityKills Co.. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListMessagesBusinessLogic {
    func fetchMessages(request: ListMessages.FetchMessages.Request)
}

protocol ListMessagesDataStore {
    var messages: [Message]? { get }
}

class ListMessagesInteractor: ListMessagesBusinessLogic, ListMessagesDataStore {

    // MARK: Properties
    
    var messages: [Message]?
    var presenter: ListMessagesPresentationLogic?
    var worker = MessagesWorker(messagesStore: MessageAPI())

    // MARK: Fetch Messages

    func fetchMessages(request: ListMessages.FetchMessages.Request) {
        worker.fetchMessages { messages in
            self.messages = messages
            let response = ListMessages.FetchMessages.Response(messages: messages)
            self.presenter?.presentFetchedMessages(response: response)
        }
    }
}
