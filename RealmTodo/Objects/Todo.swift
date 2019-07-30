//
//  todo.swift
//  RealmTodo
//
//  Created by 比嘉幹樹 on 2019/07/30.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import RealmSwift

class Todo: Object{
//    ID登録
    @objc dynamic var id: Int = 0
  
//    タイトル
    @objc dynamic var title: String = ""

//    登録日時
   @objc dynamic var date: Date = Date()
    
}
