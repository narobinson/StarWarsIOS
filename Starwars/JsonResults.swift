//
//  JsonResults.swift
//  Starwars
//
//  Created by Admin on 7/21/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

typealias Items = [Item]

struct Item:Decodable{
    let id:Int?
    let description: String?
    let title:String?
    let timestamp:String?
    let image:String?
    let date:String
    var dateString:String {
        let dateFormatter = DateFormatter()
        //2015-10-10T04:00:00.000Z
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
        let tempDate = (dateFormatter.date(from: date))!
        //formats date to something readable
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: tempDate)
    }
    
    let phone:String?
    let locationline1:String?
    let locationline2:String?
}
