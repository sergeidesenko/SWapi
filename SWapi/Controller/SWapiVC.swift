//
//  ViewController.swift
//  SWapi
//
//  Created by user on 30.10.2020.
//

import UIKit

class SWapiVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var people: People?
    @IBOutlet weak var peopleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        getPeople()
    }
    
    func getPeople(){
        NetworkService.shared.getPeople(onSucces: { (people) in
            self.people = people
            debugPrint(people)
            self.peopleTableView.reloadData()
        }, onError: { (error) in
            debugPrint(error)
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as? SWTableCell{
            cell.nameLabel.text = people?.results[indexPath.row].name ?? " "
            return cell
        } else{
            return SWTableCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FromPeopleToPerson", sender: indexPath.row)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FromPeopleToPerson" {
            guard let dest = segue.destination as? PersonVC, let sender = sender as? Int else {
                return
            }
            guard let person = people?.results[sender] else{
                return
            }
            dest.person = person
            NetworkService.shared.getPlanet(withUrl: person.homeworld, onSucces: {(planet) in
                dest.planet = planet
                dest.updateView(with: person, planet: planet)
            }, onError: { (error) in
                debugPrint(error)
            })
        }
    }

}

