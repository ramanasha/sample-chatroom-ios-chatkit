//
//  ChatroomInteractor.swift
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

protocol ChatroomBusinessLogic
{
    func doSomething(request: Chatroom.Something.Request)
}

protocol ChatroomDataStore
{
    var room_id: String? { get set }
}

class ChatroomInteractor: ChatroomBusinessLogic, ChatroomDataStore
{
    var room_id: String?
    
    var presenter: ChatroomPresentationLogic?
    var worker: ChatroomWorker?
  
    // MARK: Do something
  
    func doSomething(request: Chatroom.Something.Request)
    {
        worker = ChatroomWorker()
        worker?.doSomeWork()
    
        let response = Chatroom.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
