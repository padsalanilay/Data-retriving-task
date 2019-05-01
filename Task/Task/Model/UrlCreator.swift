//
//  UrlCreator.swift
//  Task
//
//  Created by Nilay Padsala on 5/1/19.
//  Copyright © 2019 Nilay Padsala. All rights reserved.
//

import UIKit

class UrlCreator: NSObject {
    public var mediaType = ["apple-music","itunes-music","ios-apps","audiobooks","books","tv-shows","movies","itunes-u","podcasts","music-videos"]
    public var category = ["apple-music":["coming-soon","hot-tracks","new-releases","top-albums","top-songs"],
                           "itunes-music":["hot-tracks","new-music","recent-releases","top-albums","top-songs"],
                           "ios-apps":["new-apps-we-love", "new-games-we-love","top-free","top-free-ipad","top-grossing","top-grossing-ipad","top-ipad"],
                           "audiobooks":["top-audiobooks"],
                           "books":["top-free", "top-ipad"],
                           "tv-shows":["top-tv-episodes","top-tv-seasons"],
                           "movies":["top-movies"],
                           "itunes-u":["top-itunes-u-courses"],
                           "podcasts":["top-podcasts"],
                           "music-videos":["top-music-videos"]]
    
    var baseUrl = "https://rss.itunes.apple.com/api/v1/"
}
