import Fluent
import Vapor

func routes(_ app: Application) throws {
//    app.get { req async throws in
//        try await req.view.render("index", ["title": "Hello Vapor!"])
//    }

//    app.post("Plants") { req -> EventLoopFuture<Plants> in
//    let plant = try req.content.decode(Plants.self)
//    return plant.create(on: req.db).map{ plant }
//    }
//
//    app.get("Plants") { req in
//    Plants.query(on: req.db).all()
//    }
    
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }

    
//    try app.register(collection: PlantsController())
    
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
