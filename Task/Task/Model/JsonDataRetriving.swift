//
//  JsonDataRetriving.swift
//  Task
//
//  Created by Nilay Padsala on 5/1/19.
//  Copyright © 2019 Nilay Padsala. All rights reserved.
//

import UIKit

protocol DataRetriving: NSObject {
    func didFinishDataRetriving(json data: [String: Any])
}

class JsonDataRetriving: NSObject {
    
    weak var delegate: DataRetriving?
    
    init(with Url: String) {
        super.init()
        self.gatData(From: Url)
    }
    
    func gatData(From url: String){
        let url = URL(string: url)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                print(error!)
            }
            else{
                if let content = data{
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: content, options: .mutableContainers) as! [String: Any]
                        self.delegate?.didFinishDataRetriving(json: jsonData)
                    }
                    catch{
                        print("Problem in retriving data from \(url!)")
                    }
                }
            }
        }
        task.resume()
    }
}
