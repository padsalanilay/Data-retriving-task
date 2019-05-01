//
//  ViewController.swift
//  Task
//
//  Created by Nilay Padsala on 5/1/19.
//  Copyright © 2019 Nilay Padsala. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DataRetriving {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsondelegate = JsonDataRetriving(with: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json")
        jsondelegate.delegate = self
        // Do any additional setup after loading the view.
    }

    func didFinishDataRetriving(json data: [String : Any]) {
        print(data)
    }
}


