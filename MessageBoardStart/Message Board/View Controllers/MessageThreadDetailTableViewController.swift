//
//  MessageThreadDetailTableViewController.swift
//  Message Board
//
//  Created by Spencer Curtis on 8/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import MessageKit

class MessageThreadDetailTableViewController: MessagesViewController {

    // MARK: - Properties
    
    var messageThread: MessageThread?
    var messageThreadController: MessageThreadController?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = messageThread?.title
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMessage" {
            guard let destinationVC = segue.destination as? MessageDetailViewController else { return }
            
            destinationVC.messageThreadController = messageThreadController
            destinationVC.messageThread = messageThread
        }
    }    
}

extension MessageThreadDetailTableViewController: MessagesDataSource {
    func currentSender() -> SenderType {
        return Sender(senderId: "1", displayName: "Craig")
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageThread!.messages[indexPath.section]
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageThread?.messages.count ?? 0
    }


}

extension MessageThreadDetailTableViewController: MessagesLayoutDelegate {
    
}

extension MessageThreadDetailTableViewController: MessagesDisplayDelegate {
    
}
