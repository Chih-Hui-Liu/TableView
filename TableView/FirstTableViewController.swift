//
//  FirstTableViewController.swift
//  TableView
//
//  Created by Leo on 2020/12/29.
//

import UIKit

class FirstTableViewController: UITableViewController {
  
    var imageModel = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        upLoad()
        
    }
   @IBSegueAction func trans(_ coder: NSCoder) -> FirstViewController? {
    let controller = FirstViewController(coder: coder)
    if let number = tableView.indexPathForSelectedRow?.row{ //判斷選到哪一個table cell並呼叫陣列第幾個圖案傳給下一個
        controller?.image2 = imageModel.model2[number]
        controller?.image = imageModel.model[number]
    }
        
        
        return controller
    }
    func upLoad() {
        for _ in 0...10{
            let str = "https://picsum.photos/427/907"
            let str2 = "https://picsum.photos/427/907"
            if let url = URL(string:str),let url2 = URL(string: str2){
                URLSession.shared.dataTask(with: url2) { (data, respone, error) in
                    if let data2 = data{
                       let image2 = UIImage(data: data2)!
                            self.imageModel.model2.append(image2)
                        //第二頁的先抓圖存在陣列內
                    }
                }.resume()
                if let data = try? Data(contentsOf: url){
                    if let image = UIImage(data: data){
                        self.imageModel.model.append(image)//產生封面一開始的圖片隨機抓圖
                    }
                }
            }
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return imageModel.model.count    //cell 陣列有幾個
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as? FirstTableViewCell else {
            return UITableViewCell() //另外create tableViewCell 自訂型別
        }
        cell.photoImage.image = imageModel.model[indexPath.row]
        cell.photoLabel.text = String(indexPath.row + 1)
        return cell
    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//    }
//
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
