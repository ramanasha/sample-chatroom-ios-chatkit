//
//  ListMessagesRouter.swift
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

@objc protocol ListMessagesRoutingLogic {
    func routeToChatroom(segue: UIStoryboardSegue?)
}

protocol ListMessagesDataPassing {
    var dataStore: ListMessagesDataStore? { get }
}

class ListMessagesRouter: NSObject, ListMessagesRoutingLogic, ListMessagesDataPassing {

    // MARK: Properties
    
    var dataStore: ListMessagesDataStore?
    weak var viewController: ListMessagesViewController?

    // MARK: Routing

    func routeToChatroom(segue: UIStoryboardSegue?) {
        if let segue = segue {
            let destinationVC = segue.destination as! ChatroomViewController
            var destinationDS = destinationVC.router!.dataStore!

            passDataToChatroom(source: dataStore!, destination: &destinationDS)
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "ChatroomViewController") as! ChatroomViewController
            var destinationDS = destinationVC.router!.dataStore!

            passDataToChatroom(source: dataStore!, destination: &destinationDS)
            navigateToChatroom(source: viewController!, destination: destinationVC)
        }
    }

    // MARK: Navigation
    
    func navigateToChatroom(source: ListMessagesViewController, destination: ChatroomViewController) {
        source.show(destination, sender: nil)
    }
  
    // MARK: Passing data

    func passDataToChatroom(source: ListMessagesDataStore, destination: inout ChatroomDataStore) {
        let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row
        destination.room_id = source.messages?[selectedRow!].room_id
    }
}
