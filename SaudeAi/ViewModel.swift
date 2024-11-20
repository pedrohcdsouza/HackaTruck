//
//  ViewModel.swift
//  SaudeAi
//
//  Created by Turma01-11 on 11/11/24.
//

import Foundation

class ViewModel : ObservableObject{
    
    @Published var chars : [objeto] = []
    
    func fetch(){
        
        let task = URLSession.shared.dataTask(with: URL(string: "http://192.168.128.26:1880/getSaude")!){ data, _, error in
        
            do {
                self.chars = try JSONDecoder().decode([objeto].self, from: data!)
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

