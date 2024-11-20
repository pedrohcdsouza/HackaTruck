//
//  Model.swift
//  SaudeAi
//
//  Created by Turma01-11 on 11/11/24.
//

import Foundation

struct structRe: Decodable, Hashable {
    let nome: String?
    let ind: String?
    let tarja: String?
}

struct structVa: Decodable, Hashable {
    let nome: String?
    let data: String?
    let des: String?
}

struct objeto: Decodable, Hashable{
    let regiao: Int?
    let vacina: [structVa]?
    let remedio: [structRe]?
    
}
