//
//  Post.swift
//  WanCircles
//
//  Created by Yongwan on 02/10/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import Foundation
class Post{
    var idx: String!
    var boardName: String!
    var title: String!
    var writer: String!
    var content: String!
    init(boardName: String, title: String, writer: String, content: String) {
        self.boardName = boardName
        self.title = title
        self.writer = writer
        self.content = content
    }
}
