//
//  DataManagerExchangeRequest.swift
//  YapeCuisineRecipes
//
//  Created by Rone Shender Loza Aliaga on 12/11/22.
//

import Foundation

protocol DataManagerExchangeRequest {
    
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: [String : String] { get }
    var headers: [String : String] { get }
    var jsonBody: [String : String] { get }
    var method: String { get }
}

struct NetworkDataManagerExchangeRequest: DataManagerExchangeRequest {
    
    let scheme: String
    let host: String
    let path: String
    let method: String
    let query: [String : String]
    let headers: [String : String]
    let jsonBody: [String : String]
    
    internal init(scheme: String = "https",
                  host: String,
                  path: String,
                  method: String = "GET",
                  query: [String : String] = [:],
                  headers: [String : String] = [:],
                  jsonBody: [String : String] = [:]) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.method = method
        self.query = query
        self.headers = headers
        self.jsonBody = jsonBody
    }
}

struct NetworkDataManagerConstant {
    
    static let appIdKey: String = "app_id"
    static let appKey: String =  "app_key"
    static let appIdValue: String = "900da95e"
    static let appKeyValue: String = "40698503668e0bb3897581f4766d77f9"
    static let host: String = "api.edamam.com"
    static let search: String = "/search"
    static let q: String = "q"
    static let contentType = ["Content-Type" : "application/json"]
}
