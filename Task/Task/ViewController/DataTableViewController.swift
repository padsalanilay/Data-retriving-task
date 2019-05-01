//
//  DataTableViewController.swift
//  Task
//
//  Created by Nilay Padsala on 5/1/19.
//  Copyright © 2019 Nilay Padsala. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController, DataRetriving {
    var data: [[String: Any]]!
    let cellIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [[String: Any]]()
        
        let jsondelegate = JsonDataRetriving(with: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/10/explicit.json")
        jsondelegate.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.data?.count ?? 0
    }

    func didFinishDataRetriving(json data: [String : Any]) {
//        print(data)
        if let feed = data["feed"]{
            self.title = ((feed as! [String: Any])["title"] as! String)
            if let result = (feed as! [String: Any])["results"]{
                self.data = (result as! [[String: Any]])
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)

        cell.textLabel?.text = self.data[indexPath.row]["name"] as? String
        cell.detailTextLabel?.text = self.data[indexPath.row]["artistName"] as? String
        
        let task = URLSession.shared.dataTask(with: URL(string: self.data[indexPath.row]["artworkUrl100"] as! String)!) { (data, response, error) in
            if error != nil{
                print(error!)
            }
            else{
                if let content = data{
                    DispatchQueue.main.async {
                        let image = UIImage(data: content)
                        tableView.performBatchUpdates({
                            cell.imageView?.image = image
                        }, completion: nil)
                    }
                }
                
            }
        }
        task.resume()
    
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
