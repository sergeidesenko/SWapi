//
//  PersonVC.swift
//  SWapi
//
//  Created by user on 30.10.2020.
//

import UIKit

class PersonVC: UIViewController {

    var person: Person?
    var planet: Planet?
    var isInPersonState = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        backButton.isHidden = true
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBAction func didTapOnHomeworld(_ sender: Any) {
        if isInPersonState{
            updateView(withPlanet: planet!)
            isInPersonState = false
            backButton.isHidden = false
        }
    }
    @IBOutlet weak var homeworldButton: UIButton!
    @IBAction func didTapOnBack(_ sender: Any) {
        updateView(with: person!, planet: planet!)
        backButton.isHidden = true
        isInPersonState = true
    }
    @IBOutlet weak var backButton: UIButton!
    
    

    func updateView(with person: Person, planet: Planet){
        headerLabel.text = person.name
        nameLabel.text = "Name: \(person.name)"
        heightLabel.text = "Height: \(person.height)"
        birthdateLabel.text = "Birth Date: \(person.birth_year)"
        homeworldButton.setTitle("Homeworld: \(planet.name)", for: .normal)
        switch person.gender{
        case "male":
            genderLabel.text = "Gender: ♂"
        case "female":
            genderLabel.text = "Gender: ♀"
        default:
            genderLabel.text = "Gender: Attack Helicopter"
        }
    }
    
    func updateView(withPlanet planet: Planet){
        headerLabel.text = planet.name
        nameLabel.text = "Name: \(planet.name)"
        heightLabel.text = "Rotation Period: \(planet.rotation_period)"
        birthdateLabel.text = "Diameter: \(planet.diameter)"
        homeworldButton.setTitle("Climate: \(planet.climate)", for: .normal)
        genderLabel.text = "Population: \(planet.population)"
    }
}
