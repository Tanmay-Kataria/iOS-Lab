//
//  ViewController.swift
//  Segue and Nabigation
//
//  Created by Tanmay Kataria on 30/07/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Toggleswitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func unwindToRed(unwindSeque:UIStoryboardSegue) {
        
    }
    

    @IBAction func goToYellowButtonTapped(_ sender: Any) {
        if Toggleswitch.isOn {
            performSegue(withIdentifier: "Yellow", sender: nil)
        } else if !Toggleswitch.isOn {
            performSegue(withIdentifier: "Green", sender: nil)
        }
    }
    

}

