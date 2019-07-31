//
//  ViewController.swift
//  RealmTodo
//
//  Created by 比嘉幹樹 on 2019/07/30.
//  Copyright © 2019 比嘉幹樹. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [Todo] = []
    
    fileprivate func roloadTableView() {
        //  realmに接続する
        let realm = try! Realm()
        
        //  TODoの一覧を取得
        todos = realm.objects(Todo.self).reversed()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
//    画面が表示されるたびに実行
    override func viewWillAppear(_ animated: Bool) {
        roloadTableView()
    }

    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        cell.textLabel?.text = todo.title
        
//        セルに矢印をつける
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }

//セルがクリックされた時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        クリックされたTODOをしゅと取得する
        let todo = todos[indexPath.row]
        
        performSegue(withIdentifier: "toNext", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toNext" {
//            次の画面のConto次の画面のCotroler次の画面のCotを取得
            let inputVC = segue.destination as! InputViewController
            
//            次の画面に選択されたTodoを設定
           inputVC.todo = sender as? Todo
        }
    }
}
