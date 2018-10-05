//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Aitor Garcia on 30/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // MARK: - Properties
    var model: Person
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var houseLabel: UILabel!
    
    @IBOutlet weak var aliasLabel: UILabel!
    
    // MARK: - Initialization
    init(model: Person) {
        // Primero, limpio mi propio desorden (a.k.a, le doy valor a mis propias propiedades)
        self.model = model
        
        // Despues, llamamos a super
        super.init(nibName: nil, bundle: nil)
        
        // Si quieres, utilizas alguna propiedad de tu super clase
        title = model.name
    }
    
    // Chapuza de los de Cupertino relacionada con los nil
    // Este init es el que utilizan los Storyboards
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        nameLabel.text = model.name
        houseLabel.text = "House \(model.house.name)"
        aliasLabel.text = model.alias
        //title = model.title
    }
}
