//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Aitor Garcia on 30/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {
    
    // MARK: - Properties
    var model: Season
    
    // MARK: - Outlets
    @IBOutlet weak var seasonNameLabel: UILabel!
    
    @IBOutlet weak var seasonReleaseDateLabel: UILabel!
    
    // MARK: - Initialization
    init(model: Season) {
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
        
        setupUI()
        
        // Sincronizar modelo y vista
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        seasonNameLabel.text = "Season: \(model.name)"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        seasonReleaseDateLabel.text = "Release Date: \(formatter.string(from: model.releaseDate))"
        title = model.name
    }
    
    func setupUI() {
        // Crear el boton
        let episodesButton = UIBarButtonItem(title: "Episodes", style: .plain, target: self, action: #selector(displayEpisodes))
        
        // Anadir los botones
        navigationItem.rightBarButtonItem = episodesButton
    }
    
    @objc func displayEpisodes() {
        let episodeListViewController = EpisodeListViewController(model: model.sortedEpisodes)
        
        // Push
        navigationController?.pushViewController(episodeListViewController, animated: true)
    }
}

extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ vc: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
        
    }
    
    
}
