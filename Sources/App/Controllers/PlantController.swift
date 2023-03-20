//
//  File.swift
//  
//
//  Created by Einas Alturki on 27/08/1444 AH.
////
//
import Foundation
import Fluent
import Vapor

final class PlantController{
    
    func boot(routes: RoutesBuilder) throws {
        let plants = routes.grouped("plants")
        plants.get(use: index)
        plants.post(use: create)
        plants.group(":plantID") { plant in
            plant.delete(use: delete)
        }
    }
   
    func index(req: Request) async throws -> [Plants] {
        try await Plants.query(on: req.db).all()
    }
    
    func create(req:Request) throws -> EventLoopFuture<Plants> {
        let plant = try req.content.decode(Plants.self)
        return plant.create(on: req.db).map { plant }
    }
    
    func all(req:Request) throws -> EventLoopFuture<[Plants]> {
        Plants.query(on: req.db).all()
    }
    
    func update(req:Request) throws -> EventLoopFuture<HTTPStatus> {
        
                let plant = try req.content.decode(Plants.self)
        
                return Plants.find(plant.id, on: req.db)
                    .unwrap(or: Abort(.notFound))
                    .flatMap {
                        $0.name = plant.name
                        $0.category = plant.category
                        $0.description = plant.description
                        return $0.update(on: req.db).transform(to: .ok)
                    }

    }
    
    func delete (req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Plants.find(req.parameters.get ("plantID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform (to: .ok)
    }
    
}
