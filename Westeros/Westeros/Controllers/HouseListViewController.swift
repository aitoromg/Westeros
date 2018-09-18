//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 17/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class HouseListViewController: UITableViewController {
    
    // Mark: - Properties
    let model: [House]
    
    // Mark: - Initialization
    init(model: [House]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "HouseCell"
        
        // Descubir el item (casa) que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda (o que nos la den del caché)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincronizar celda (view) y casa (model)
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        // Devolver la celda
        return cell!
    }
    
    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar la casa en cuestion
        let house = model[indexPath.row]
        
        // Crear el controlador del detalle de esa casa
        let houseDetailViewController = HouseDetailViewController(model: house)
        
        // Push
        navigationController?.pushViewController(houseDetailViewController, animated: true)
    }
}
