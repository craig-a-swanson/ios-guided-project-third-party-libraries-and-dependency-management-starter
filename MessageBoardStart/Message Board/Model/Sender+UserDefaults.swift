//
//  Sender+UserDefaults.swift
//  Message Board
//
//  Created by Craig Swanson on 2/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import MessageKit

extension Sender {
    
    // convert a sender to a dictionary to be saved to User Defaults
    var dictionaryRepresentation: [String: String] {
        return ["id" : senderId,
                "displayName": displayName]
    }
    
    // convert a dictionary back to a Sender object to be used by the rest of the app
    init?(dictionary: [String:String]) {
        guard let id = dictionary["id"],
            let displayName = dictionary["displayName"] else { return nil }
        self.init(senderId: id, displayName: displayName)
    }
}
