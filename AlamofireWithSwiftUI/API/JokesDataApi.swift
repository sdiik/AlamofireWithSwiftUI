//
//  JokesDataApi.swift
//  AlamofireWithSwiftUI
//
//  Created by ahmad shiddiq on 19/01/21.
//  Copyright © 2021 ahmad shiddiq. All rights reserved.
//

import SwiftUI
import Alamofire

class JokesDataApi: ObservableObject {
    @Published var jokes = [JokesData]()
    init() {
        getJokes()
    }
    func  getJokes(count: Int = 5) {
        let urlJokes = "http://api.icndb.com/jokes/random/\(count)"
        AF.request(urlJokes, method: .get, parameters: nil).responseJSON { response in switch response.result {
        case .success(_):
            if let json = response.value {
                if (json as? NSDictionary) != nil {
                    if let dictionaryArray = json as? Dictionary<String, AnyObject?> {
                        let jsonArray = dictionaryArray["value"]
                        if let jsonArray = jsonArray as? Array<Dictionary<String, AnyObject?>> {
                            for i in 0..<jsonArray.count {
                                let json = jsonArray[i]
                                if let id = json["id"] as? Int, let jokeString = json["joke"] as? String {
                                    self.jokes.append(JokesData(id: id, joke: jokeString))
                                }
                            }
                        }
                    }
                }
            }
        case .failure(let error):
            print("error -> : \(error.localizedDescription)")
            }
        }
    }
}
