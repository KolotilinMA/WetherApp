//
//  addGroupTableViewController.swift
//  WetherApp
//
//  Created by Михаил on 02/02/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit

protocol addGroupDelegate: class {
    func addGroup(group:myGroup)
}



class addGroupTableViewController: UITableViewController {

//  Объект, который умеет добавлять группы
    weak var delegate: addGroupDelegate?
    
//  Массив групп
    var groups: [myGroup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//  Заполняем массив групп данными
        let nameGroup = ["Школа", "Университет", "Первая работа", "Группа интересов", "Лучшие друзья"]
        for name in nameGroup {
            let group = myGroup()
            group.name = name
            
            self.groups.append(group)
        }
    }

    // MARK: - Table view data source

//  Количество ячеек в таблице = количеству групп в массиве
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }

//  Возвращаем ячейку для нужной группы
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addGroupTableViewCell", for: indexPath) as! addGroupTableViewCell
        tableView.deselectRow(at: indexPath, animated: true)
        let group = self.groups[indexPath.row]
        cell.setGroup(mygroup: group)
        
        return cell
    }

//  Выбор ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//      Убираем выделение с ячейки
        tableView.deselectRow(at: indexPath, animated: true)

//      Получаем группу
        let group = self.groups[indexPath.row]

//      Добавляем группу
        self.addGroup(group: group)
    }
}

extension addGroupTableViewController {
    
//  Так как на текущем экране мы не знаем как добавить группу, просто поручаем это делегату
    func addGroup(group: myGroup) {
        self.delegate?.addGroup(group: group)
    }
}
