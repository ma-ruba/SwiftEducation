//
//  ViewController.swift
//  tableView_study
//
//  Created by Мария on 25.11.2019.
//  Copyright © 2019 Мария. All rights reserved.
//

import UIKit

//creation of table from the story board

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    let identifier = "MyCell"
    var array = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func editTable(_ sender: Any) {
        myTableView.isEditing = !myTableView.isEditing
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
        
        let info = self.array[indexPath.row]
        cell.textLabel?.text = info
        return cell
    }
    
    //deletion
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    //move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        array.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    //let copy
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) {
            return true
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let cell = tableView.cellForRow(at: indexPath)
            let pasteBoard = UIPasteboard.general
            pasteBoard.string = cell?.textLabel?.text
        }
    }
}

//creation of table in the code

//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//
//
//    var myTable = UITableView()
//    let identifier = "myCell"
//    var array = ["0", "1", "2", "3", "4", "5", "6", "7"]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        createTable()
//    }
//
//    func createTable() {
//
//        self.myTable = UITableView(frame: view.bounds, style: .plain)
//        self.view.addSubview(myTable)
//        self.myTable.delegate = self
//        self.myTable.dataSource = self
//        self.myTable.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
//        self.myTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//    }
//
//    //MARK: UITableViewDataSource
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//
//        let info = array[indexPath.row]
////        cell.accessoryType = .detailDisclosureButton
////
////        switch indexPath.section {
////        case 0:
////            cell.backgroundColor = UIColor.green
////        case 1:
////            cell.backgroundColor = UIColor.blue
////        default:
////            cell.backgroundColor = UIColor.red
////        }
//        cell.textLabel?.text = "\(info)"
//        return cell
//    }
//
//    //MARK: UITableViewDelegate
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70.0
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
//    }
//
////    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
////        let ownerButton = tableView.cellForRow(at: indexPath)
////        print("Cell title is:", ownerButton?.textLabel?.text ?? "nil")
////    }
//}

