//
//  TableViewController.swift
//  TableViewsThree
//
//  Created by Jaxon Stevens on 7/12/17.
//  Copyright © 2017 Jaxon Stevens. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
   // let array = ["Jaxon", "Mitch", "Jesse",  ]
    var categoryArray = [Category]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
    tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Jaxon")
    getNetworkData()
        
    }
    
    // Get the network data here from the best buy API 1
    private func getNetworkData() {
     
        let myUrl = URL(string: "http://www.bestbuy.ca/api/v2/json/category/departments?lang=en&format=json")!
        let myRequest = URLRequest(url: myUrl)
        let session = URLSession.shared
        let task = session.dataTask(with: myRequest) {
            (data, response, error) -> Void in
            if let httpResponse = response as? HTTPURLResponse {
                print (httpResponse.statusCode)
                }
            
            
        if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let dict = json as? [String: Any] {
            if let subCategoriesArray = dict["subCategories"] as? [[String: Any]] {
                
                for subCategory in subCategoriesArray {
                    
                    if let categoryId = subCategory["id"] as? String, let name = subCategory["name"] as? String,
                        let hasSubcategories = subCategory["hasSubcategories"] as? Bool, let productCount = subCategory["productCount"] as? Int {
                        
                        let category = Category(categoryId: categoryId, name: name, hasSubcategories: hasSubcategories, productCount: productCount)
                           self.categoryArray.append(category)
                        
                  }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        
                    }
                }
              }
           }
        }
        
         task.resume()
    } // END BEST BUY FUNCTION
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       // return 5
        return categoryArray.count
    }

    // TABLE VIEW CELL
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Jaxon", for: indexPath) as! TableViewCell
        
        cell.blueTitleLabel.text = categoryArray[indexPath.row].name
        cell.productIdLabel.text = categoryArray[indexPath.row].categoryId

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categoryArray[indexPath.row]
        
        let vc = TableViewControllerTwo()
        vc.category = category
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
