//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Ashish Sharma on 12/22/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var simpsonsArray = [Simpsons]()
    var chosenSimpson: Simpsons?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //Simpsons objects
        let homer = Simpsons(name: "Homer", job: "Worker", image: UIImage(named: "Homer")!)
        let maggie = Simpsons(name: "Maggie", job: "Baby", image: UIImage(named: "Maggie")!)
        let bart = Simpsons(name: "Bart", job: "Student", image: UIImage(named: "Bart")!)
        let marge = Simpsons(name: "Marjorie", job: "Homemaker", image: UIImage(named: "Marge")!)
        
        simpsonsArray = [homer, marge, bart, maggie]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonsArray[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonsArray[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsViewController", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsViewController" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.selectedSimpson = chosenSimpson
        }
    }
    

    
}

