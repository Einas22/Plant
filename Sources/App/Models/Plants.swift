//
//  Plants.swift
//  
//
//  Created by Aljwhra Alnasser on 15/03/2023.
//

import Foundation
import Fluent
import Vapor

final class Plants: Content,Model{
    
    
    static let schema = "plants"
    
    @ID(key: .id)
    var id:UUID?
    
    @Field(key:"name")
    var name: String
    
    
    @Field(key:"category")
    var category: String
    
    @Field(key:"description")
    var description: String
    
    
//    @Field(key:.imageURL)
//    var imageURL: String
    
    
    
    init() {
        
    }
    
    init(id: UUID? = nil, name: String, category: String, description: String) //, image: Date)
    {
        self.id = id
        self.name = name
        self.category = category
        self.description = description
        //self.imageURL = imageURL
    }
    
    
}

//extension FieldKey{
//    static let imageURL: FieldKey = "image_url"
//}
