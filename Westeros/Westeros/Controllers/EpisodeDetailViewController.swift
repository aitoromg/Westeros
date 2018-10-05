//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Aitor Garcia on 30/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    // MARK: - Properties
    var model: Episode
    
    // MARK: - Outlets
    @IBOutlet weak var episodeTitleLabel: UILabel!
    
    @IBOutlet weak var episodeIssueDateLabel: UILabel!
    
    // MARK: - Initialization
    init(model: Episode) {
        // Primero, limpio mi propio desorden (a.k.a, le doy valor a mis propias propiedades)
        self.model = model
        
        // Despues, llamamos a super
        super.init(nibName: nil, bundle: nil)
        
        // Si quieres, utilizas alguna propiedad de tu super clase
        title = model.title
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
        episodeTitleLabel.text = "Episode: \(model.title)"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        episodeIssueDateLabel.text = "Issue Date: \(formatter.string(from: model.issueDate))"
        //title = model.title
    }

}
