//
//  NewtworkService.swift
//  SWapi
//
//  Created by user on 30.10.2020.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    let baseUrl = "https://swapi.dev/api"
    let peopleUrl = "/people"
    
    let session = URLSession(configuration: .default)
    
    func getPeople(onSucces: @escaping (People) -> Void, onError: @escaping (String) -> Void){
        let url = URL(string: "\(baseUrl)\(peopleUrl)")!
        let task = session.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let responce = responce as? HTTPURLResponse else{
                    onError("Invalid data or responce")
                    return
                }
                do {
                    if responce.statusCode == 200{
                        let people = try JSONDecoder().decode(People.self, from: data)
                        onSucces(people)
                    }
                    else {
                        onError("responce: \(responce.statusCode)")
                    }
                } catch {
                    onError("JSON decoding error")
                }
            }
        }
        task.resume()
    }
    
    func getPlanet(withUrl url: String, onSucces: @escaping (Planet) -> Void, onError: @escaping (String) -> Void){
        guard let url = URL(string: url) else {
            onError("Invalid url")
            return
        }
        let task = session.dataTask(with: url) { (data, responce, error) in
            DispatchQueue.main.async {
                if let error = error {
                    onError(error.localizedDescription)
                    return
                }
                
                guard let data = data, let responce = responce as? HTTPURLResponse else{
                    onError("Invalid data or responce")
                    return
                }
                do{
                    if responce.statusCode == 200{
                        let planet = try JSONDecoder().decode(Planet.self, from: data)
                        onSucces(planet)
                    } else {
                        onError("responce: \(responce.statusCode)")
                    }
                } catch {
                    onError("JSON decoding error")
                }
            }
        }
        task.resume()
        
    }
}
