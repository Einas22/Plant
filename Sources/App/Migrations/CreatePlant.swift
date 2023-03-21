//
//  CreatePlant.swift
//
//
//  Created by Einas Alturki on 27/08/1444 AH.
////

import Fluent
import FluentPostgresDriver

struct CreatePlant: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("plants")
            .id()
            .field("name", .string, .required)
            .field("category", .string, .required)
            .field("description", .string)
            .field("image", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("plants").delete()
    }
}
