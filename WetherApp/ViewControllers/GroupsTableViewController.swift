//
//  GroupsTableViewController.swift
//  WetherApp
//
//  Created by Михаил on 03/02/2019.
//  Copyright © 2019 Михаил. All rights reserved.
//

import UIKit


class GroupsTableViewController: UITableViewController {

    var groups: [myGroup] = []
    
     // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //      Получаем от таблицы ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell
        
        //      Получаем город
        let group = self.groups[indexPath.row]
        
        //      Устанавливаем город в ячейку
        cell.setGroup(group: group)
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        //      Обрабатываем действие удаления
        if editingStyle == .delete {
            
            //          Удаляем позицию из массива
            self.groups.remove(at: indexPath.row)
            
            //          Удаляем ячейку из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
//      Проверка перехода (на экран добавления группы)
        if segue.identifier == "addGroup", let dest = segue.destination as? addGroupTableViewController {
//          Оповещаем экран добавления группы что мы умеем добавлять группы (устанавливаем себя делегатом)
            dest.delegate = self
        }
    }
}

extension GroupsTableViewController: addGroupDelegate {
    
//  Добавление города в таблицу
    func addGroup(group: myGroup) {
        print("addGroup\(String(describing: group.name))")
        
//      Проверка на повтор города
        var contains = false
        for groupInVC in self.groups {
            if group.name == groupInVC.name {
                contains = true
                break
            }
        }
        
//      Если города нет - добавляем в массив и перезагружаем таблицу
        if false == contains {
            self.groups.append(group)
            self.tableView.reloadData()
        }
    }
}
