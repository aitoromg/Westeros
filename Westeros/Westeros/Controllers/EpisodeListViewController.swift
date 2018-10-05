//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Aitor Garcia on 30/9/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
        
    // Mark: - Properties
    var model: [Episode]
    
    // Mark: - Initialization
    init(model: [Episode]) {
        self.model = model
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Episodes"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(seasonDidChange), name: .seasonDidChangeNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func seasonDidChange(notification: Notification) {
        guard let info = notification.userInfo else { return }
        guard let season: Season = info[ Constants.seasonKey ] as? Season else { return }
        model = season.sortedEpisodes
        
        tableView.reloadData()
    }
    
    // Mark: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "EpisodeCell"
        
        // Descubrimos cual es el Episode que hay que mostrar
        let theEpisode = episode(at: indexPath.row)
        
        // Creamos la celda (o nos la dan de cache)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Sincronizar modelo-vista (episode-cell)
        cell?.textLabel?.text = theEpisode.title
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        cell?.detailTextLabel?.text = formatter.string(from: theEpisode.issueDate)
        
        return cell!
    }
    
    // MARK: - Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let theEpisode = episode(at: indexPath.row)
        navigationController?.pushViewController(EpisodeDetailViewController(model: theEpisode), animated: true)
    }
}

extension EpisodeListViewController {
    func episode(at row: Int) -> Episode {
        return model[row]
    }
}
