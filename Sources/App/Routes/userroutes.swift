//
//  userroutes.swift
//
//
//  Created by Edgar Guitian Rey on 5/2/24.
//

import Vapor

private var users = [
    User(id: 1, name: "Edgar Guitian", age: 33, email: "edguitian@gmail.com"),
    User(id: 2, name: "Ejemplo", age: 18, email: "ejemplo@gmail.com")
]

func userroutes(_ app: Application) throws {
    app.group("user") { user in
        user.get { request -> [User] in
            return users
        }
        
        user.get(":id") { req -> User in
            guard let id = req.parameters.get("id", as: Int.self) else {
                throw Abort(.badRequest)
            }
            guard let user = users.first(where: { user in
                user.id == id
            }) else {
                throw Abort(.notFound)
            }
            return user
        }
        
        user.post { req in
            let user = try req.content.decode(User.self)
            users.append(user)
            return HTTPStatus.ok
        }
        
        user.delete(":id") { req in
            guard let id = req.parameters.get("id", as: Int.self) else {
                throw Abort(.badRequest)
            }
            users.removeAll { user in
                user.id == id
            }
            return HTTPStatus.ok
        }
    }
}
