//
//  WikiViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 17/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {

    // Mark: - Outles
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    // Mark: - Properties
    let model: House
    
    // Mark: - Initialization
    init(model: House) {
        // 1. Limpio mi M***
        self.model = model
        // 2. Llamo a super
        super.init(nibName: nil, bundle: nil)
        
        // 3. Usas las properties de tu superclase
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Asignar delegados
        webView.navigationDelegate = self
        syncModelWithView()
        
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        title = model.name
        let request: URLRequest = URLRequest(url: model.wikiUrl)
        loadingView.startAnimating()
        webView.load(request)
    }
}

extension WikiViewController: WKNavigationDelegate { // Should, Will, Did
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // detener el spinner
        loadingView.stopAnimating()
        // Ocultarlo
        loadingView.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let type = navigationAction.navigationType
        
        switch type {
        case .linkActivated, .formSubmitted, .formResubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
    
}
