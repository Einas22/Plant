//
//  routes.swift
//
//
//  Created by Einas Alturki on 27/08/1444 AH.
////


import Fluent
import Vapor

func routes(_ app: Application) throws {

    let plantController = PlantController()
    
    // loclhost:8080/Plants  POST
    app.post("Plants", use: plantController.create)
    
    
    // loclhost:8080/Plants  GET
    app.get("Plants", use: plantController.all)
    
    app.get("Plants","Indoor", use: plantController.indexIndoor (req:))
    
    app.get("Plants","Outdoor", use: plantController.indexOutdoor(req:))
    
    
    
    // loclhost:8080/books/:id PUT
    app.put("Plants", use: plantController.update)
    
    
    // loclhost:8080/books/:id DELETE
    app.delete("Plants", ":plantID", use: plantController.delete)
    
}
