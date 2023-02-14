//
//  ViewController.swift
//  Dharvi_Prac_Dtbs
//
//  Created by Jaimin Solanki on 09/11/22.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var appdel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var studentview: UIView!
    
    @IBOutlet weak var segview: UISegmentedControl!
    
    @IBOutlet weak var sname: UITextField!
    
    @IBOutlet weak var ssem: UITextField!
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var `switch`: UISwitch!
    
    @IBOutlet weak var girlimage: UIImageView!
    
    @IBOutlet weak var boyimage: UIImageView!
    
    @IBOutlet weak var lblerror: UILabel!
    
    @IBOutlet weak var viewEmployee: UIView!
    
    
    var gender = ""
    
    var marks = 0.0
    
    @IBOutlet weak var ename: UITextField!
    
    
    @IBOutlet weak var esalary: UITextField!
    
    
    @IBOutlet weak var edes: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segview.selectedSegmentIndex == 0 {
            studentview.isHidden = false
            viewEmployee.isHidden = true
        }
        else{
            studentview.isHidden = true
            viewEmployee.isHidden = false
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Slider2(_ sender: Any) {
        lblerror.text = String(slider1.value)
        
        marks = Double(slider1.value)
    }
    
    @IBAction func Actionsave(_ sender: Any) {
        if  (sname.text == "" || ssem.text == ""){
            let alertcontroller = UIAlertController(title: "Enter Details", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertcontroller.addAction(UIAlertAction(title:
                                                        "ok", style: UIAlertActionStyle.default))
            self.present(alertcontroller, animated: true, completion: nil)
        }
        else
        {
            let ManagedContext = appdel.persistentContainer.viewContext
            let Managedentity = NSEntityDescription.entity(forEntityName:"Student", in: ManagedContext)
            let  ManagedObject = NSManagedObject(entity: Managedentity!, insertInto: ManagedContext)
            
            ManagedObject.setValue(sname.text, forKey: "name")
            ManagedObject.setValue(ssem.text, forKey: "sem")
            ManagedObject.setValue(gender, forKey: "gender")
            ManagedObject.setValue(String(marks), forKey: "marks")
            
            do {
                try ManagedContext.save()
            } catch let err as NSError{
                print(err)
            }
            
            let alertcontroller = UIAlertController(title: "Save", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertcontroller.addAction(UIAlertAction(title:
                                                        "ok", style: UIAlertActionStyle.default))
            self.present(alertcontroller, animated: true, completion: nil)
        }
            
            
    }
    
    @IBAction func Switchact(_ sender: Any) {
        if (`switch`.isOn) {
            boyimage.isHidden = true
            girlimage.isHidden = false
            gender = "Female"
        }
        else{
            boyimage.isHidden = false
            girlimage.isHidden = true
            gender = "Male"
        }
    }
    
    @IBAction func segact(_ sender: Any) {
        
        if segview.selectedSegmentIndex == 0 {
            studentview.isHidden = false
            viewEmployee.isHidden = true
        }
        else{
            studentview.isHidden = true
            viewEmployee.isHidden = false
        }
        
    }
    
    @IBAction func acsave(_ sender: Any) {
        if  (ename.text == "" || esalary.text == "" || edes.text == ""){
            let alertcontroller = UIAlertController(title: "Enter Details", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertcontroller.addAction(UIAlertAction(title:
                                                        "ok", style: UIAlertActionStyle.default))
            self.present(alertcontroller, animated: true, completion: nil)
        }
        else
        {
            let ManagedContext = appdel.persistentContainer.viewContext
            let Managedentity = NSEntityDescription.entity(forEntityName:"Employe", in: ManagedContext)
            let ManagedObject = NSManagedObject(entity: Managedentity!, insertInto: ManagedContext)
            
            ManagedObject.setValue(ename.text, forKey: "name")
            ManagedObject.setValue(esalary.text, forKey: "salary")
            ManagedObject.setValue(edes.text, forKey: "des")
           
            
            do {
                try ManagedContext.save()
            } catch let err as NSError{
                print(err)
            }
            
            let alertcontroller = UIAlertController(title: "Save", message: "", preferredStyle: UIAlertControllerStyle.alert)
            alertcontroller.addAction(UIAlertAction(title:
                                                        "ok", style: UIAlertActionStyle.default))
            self.present(alertcontroller, animated: true, completion: nil)
        }
            

        
    }
    
    @IBAction func acnext(_ sender: Any) {
    }
}

