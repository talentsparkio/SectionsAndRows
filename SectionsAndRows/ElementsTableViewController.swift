//
//  ElementsTableViewController.swift
//  SectionsAndRows
//
//  Created by Nick Chen on 9/23/15.
//  Copyright © 2015 Nick Chen. All rights reserved.
//

import UIKit

class ElementsTableViewController: UITableViewController {

    let elements = ["Actinium",
    "Aluminium",
    "Americium",
    "Antimony",
    "Argon",
    "Arsenic",
    "Astatine",
    "Barium",
    "Berkelium",
    "Beryllium",
    "Bismuth",
    "Bohrium",
    "Boron",
    "Bromine",
    "Cadmium",
    "Caesium",
    "Calcium",
    "Californium",
    "Carbon",
    "Cerium",
    "Chlorine",
    "Chromium",
    "Cobalt",
    "Copernicium",
    "Copper",
    "Curium",
    "Darmstadtium",
    "Dubnium",
    "Dysprosium",
    "Einsteinium",
    "Erbium",
    "Europium",
    "Fermium",
    "Fluorine",
    "Francium",
    "Gadolinium",
    "Gallium",
    "Germanium",
    "Gold",
    "Hafnium",
    "Hassium",
    "Helium",
    "Holmium",
    "Hydrogen",
    "Indium",
    "Iodine",
    "Iridium",
    "Iron",
    "Krypton",
    "Lanthanum",
    "Lawrencium",
    "Lead",
    "Lithium",
    "Lutetium",
    "Magnesium",
    "Manganese",
    "Meitnerium",
    "Mendelevium",
    "Mercury",
    "Molybdenum",
    "Neodymium",
    "Neon",
    "Neptunium",
    "Nickel",
    "Niobium",
    "Nitrogen",
    "Nobelium",
    "Osmium",
    "Oxygen",
    "Palladium",
    "Phosphorus",
    "Platinum",
    "Plutonium",
    "Polonium",
    "Potassium",
    "Praseodymium",
    "Promethium",
    "Protactinium",
    "Radium",
    "Radon",
    "Rhenium",
    "Rhodium",
    "Roentgenium",
    "Rubidium",
    "Ruthenium",
    "Rutherfordium",
    "Samarium",
    "Scandium",
    "Seaborgium",
    "Selenium",
    "Silicon",
    "Silver",
    "Sodium",
    "Strontium",
    "Sulfur",
    "Tantalum",
    "Technetium",
    "Tellurium",
    "Terbium",
    "Thallium",
    "Thorium",
    "Thulium",
    "Tin",
    "Titanium",
    "Tungsten",
    "Ununhexium",
    "Ununoctium",
    "Ununpentium",
    "Ununquadium",
    "Ununseptium",
    "Ununtrium",
    "Uranium",
    "Vanadium",
    "Xenon",
    "Ytterbium",
    "Yttrium",
    "Zinc",
    "Zirconium"]

    var elementsDirectory: [Character: [String]]!
    // Because built-in dictionary implementation is unordered, we maintain our order in this list else we risk losing the ordering
    var sectionsToCharacterKeys: [Character]!

    // This just groups the elements by first character
    func processElements(element: [String]) -> [Character: [String]] {
        var directory = [Character: [String]]()
        for element in elements {
            let character = element[element.startIndex]
            
            if directory[character] == nil {
                directory[character] = [String]()
            }

            directory[character]?.append(element)
        }
        
        return directory
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        elementsDirectory = processElements(elements)
        sectionsToCharacterKeys = Array(elementsDirectory.keys).sort()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return elementsDirectory.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let characterKey = sectionsToCharacterKeys[section]

        if let count = elementsDirectory[characterKey]?.count {
            return count
        } else {
            return 0
        }
    }

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCellWithIdentifier("HeaderCell")
        cell?.textLabel?.text = String(sectionsToCharacterKeys[section])
        return cell
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RowCell", forIndexPath: indexPath)

        let characterKey = sectionsToCharacterKeys[indexPath.section]
        let elementValue = elementsDirectory[characterKey]?[indexPath.row]

        cell.textLabel?.text = elementValue

        return cell
    }

}
