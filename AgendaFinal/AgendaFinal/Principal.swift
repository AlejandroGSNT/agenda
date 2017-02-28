//
//  ViewController.swift
//  AgendaFinal
//
//  Created by orlando  arias on 2/28/17.
//  Copyright © 2017 orlando  arias. All rights reserved.
//

import UIKit

class Principal: UIViewController {

    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var cellphone: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        
        //put the link of the php file here. The php file connects the mysql and swift
        let request = NSMutableURLRequest(url: NSURL(string: "https://localhost/usuario.php")! as URL)
        request.httpMethod = "POST"
        
        let postString = "a=\(name.text!)&b=\(address.text!)\(cellphone.text!)"
        
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
        }
        task.resume()
        
        
        let alertController = UIAlertController(title: "Candidate's Name", message:
            "Successfully Added", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
        name.text = ""
        address.text = ""
        cellphone.text = ""
        

        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

