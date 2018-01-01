//
//  ChatroomRouter.swift
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

@objc protocol ChatroomRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ChatroomDataPassing
{
    var dataStore: ChatroomDataStore? { get }
}

class ChatroomRouter: NSObject, ChatroomRoutingLogic, ChatroomDataPassing
{
    weak var viewController: ChatroomViewController?
    var dataStore: ChatroomDataStore?
}
