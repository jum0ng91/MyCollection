//
//  ViewController.swift
//  MyCollection
//
//  Created by GREED on 8/4/17.
//  Copyright © 2017 GREED. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!;
    
    var collection:[Collection] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
        
        do {
         collection = try context.fetch(Collection.fetchRequest());
            tableView.reloadData();
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        
        let collect = collection[indexPath.row];
        cell.textLabel?.text = collect.title;
        cell.imageView?.image = UIImage(data: collect.image! as Data);
        
        return cell;
    }

}

