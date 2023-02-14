//
//  DisplayViewController.swift
//  Dharvi_Prac_Dtbs
//
//  Created by Jaimin Solanki on 09/11/22.
//

import UIKit
import CoreData

class DisplayViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet weak var viewStudentColl: UIView!
    @IBOutlet weak var collViewStudent: UICollectionView!
    
    @IBOutlet weak var tableview: UIView!
    
    @IBOutlet weak var tablecell: UITableView!
    @IBOutlet weak var seg1: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if seg1.selectedSegmentIndex == 0  {
            tableview.isHidden = true
            viewStudentColl.isHidden = false
        }
        else
        {
            tableview.isHidden = false
            viewStudentColl.isHidden = true
        }

        
        let managedContext = appDel.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "Student")
        
        do {
            try appDel.stuarray = managedContext.fetch(fetchReq)
        } catch let err as NSError {
            print(err)
        }
        
        let Fetchrequest = NSFetchRequest<NSManagedObject>(entityName: "Employe")
        
        do {
            try appDel.emparray = managedContext.fetch(Fetchrequest)
        } catch let err as NSError {
            print(err)
        }
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return appDel.stuarray.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! myCell
        
        let singleRow = appDel.stuarray[indexPath.row]
        
        cell.lblName.text = (singleRow.value(forKey: "name") as! String)
        cell.lblSem.text = (singleRow.value(forKey: "sem") as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        appDel.emparray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "mycell")
        let singlestu = appDel.emparray[indexPath.row]
        cell.textLabel?.text = (singlestu.value(forKey: "name") as! String)
        cell.detailTextLabel?.text = (singlestu.value(forKey: "salary") as! String)
        return cell
        
        
    }
    
    
    @IBAction func acseg(_ sender: Any) {
        
        if seg1.selectedSegmentIndex == 0  {
            tableview.isHidden = true
            viewStudentColl.isHidden = false
        }
        else
        {
            tableview.isHidden = false
            viewStudentColl.isHidden = true
        }
    
    }

    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let Managedcontext = appDel.persistentContainer.viewContext
        Managedcontext.delete(appDel.emparray[indexPath.row])
        do {
            try Managedcontext.save()
        }
        catch let err as NSError {
            print(err)
        }
        appDel.emparray.remove(at: indexPath.row)
        tablecell.reloadData()
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
