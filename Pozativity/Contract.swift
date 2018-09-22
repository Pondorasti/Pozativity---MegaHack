//
//  Contract.swift
//  Pozativity
//
//  Created by Alexandru Turcanu on 22/09/2018.
//  Copyright © 2018 Alexandru Turcanu. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Contract {
    let deadline: String
    let contractor: String
    let pdfURL: String
    let uid: String
    let title: String
    
    public var dictValue: [String: Any] {
        return ["deadline": deadline,
                "contractor": contractor,
                "pdfURL": pdfURL,
                "uid": uid,
                "title": title]
    }
    
    init(uid: String, deadline: String, contractor: String, pdfURL: String, title: String) {
        self.uid = uid
        self.deadline = deadline
        self.contractor = contractor
        self.pdfURL = pdfURL
        self.title = title
    }
    
    init?(snapshot: DataSnapshot) {
        guard let data = snapshot.value as? [String: Any],
            let deadline = data["deadline"] as? String,
            let contractor = data["contractor"] as? String,
            let pdfURL = data["pdfURL"] as? String,
            let uid = data["uid"] as? String,
            let title = data["title"] as? String else {
                return nil
        }
        
        self.uid = uid
        self.deadline = deadline
        self.contractor = contractor
        self.pdfURL = pdfURL
        self.title = title
    }
}
