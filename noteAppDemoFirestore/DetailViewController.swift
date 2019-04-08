//
//  DetailViewController.swift
//  noteAppDemoFirestore
//
//  Created by Phillip Eismark on 15/03/2019.
//  Copyright © 2019 Phillip Eismark. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    var currentIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DetailView Loadet")
    }

    override func viewWillAppear(_ animated: Bool) {
        if currentIndex != -1 {
            textView.text = fR.notes[currentIndex].text
        } else {
            print("Current index value is nil")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let txt = textView.text {
            fR.notesCollection.document(fR.notes[currentIndex].id).updateData(["text" : txt]) { (error) in
                if error != nil {
                    print("error saving to firebase\(error.debugDescription)")
                }
                else{
                    print("uploadet \(txt) to storage")
                }
            }
            
        }
    }
    
    
    /*    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
