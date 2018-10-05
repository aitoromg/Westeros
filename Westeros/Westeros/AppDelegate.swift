//
//  AppDelegate.swift
//  Westeros
//
//  Created by Alexandre Freire on 06/09/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UITabBarControllerDelegate {

    var window: UIWindow?

    var houseDetailNavigationController: UINavigationController!
    var seasonDetailNavigationController: UINavigationController!
    var splitViewController: UISplitViewController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .cyan
        
        // 1. Creamos los modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        // Crear los controladores
        // Master
        let houseListViewController = HouseListViewController(model: houses)
        //let lastHouseSelected = houseListViewController.lastSelectedHouse()
        let seasonListViewController = SeasonListViewController(model: seasons)
        //let lastSeasonSelected = seasonListViewController.lastSelectedSeason()
        
        // Detail
        let houseDetailViewController = HouseDetailViewController(model: houseListViewController.lastSelectedHouse())
        houseDetailNavigationController = houseDetailViewController.wrappedInNavigation()
        let seasonDetailViewController = SeasonDetailViewController(model: seasonListViewController.lastSelectedSeason())
        seasonDetailNavigationController = seasonDetailViewController.wrappedInNavigation()
        
        // iPad & iPhone device check
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            houseListViewController.delegate = houseDetailViewController
            seasonListViewController.delegate = seasonDetailViewController
        } else {
            houseListViewController.delegate = houseListViewController
            //seasonListViewController.delegate = seasonListViewController
        }
        
        // Creamos el combinador
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [
            houseListViewController.wrappedInNavigation(),
            seasonListViewController.wrappedInNavigation()
        ]
        tabBarViewController.delegate = self
        
        // Asignar delegados
        // Un objeto SOLO puede tener un delegado
        // Sin embargo, un objeto, SI puede ser delegado de varios otros
        seasonListViewController.delegate = seasonDetailViewController
        houseListViewController.delegate = houseDetailViewController
        
        // Crear el combinador, osea, el UISplitVC
        splitViewController = UISplitViewController()
        splitViewController.viewControllers = [
//            houseListViewController.wrappedInNavigation(),
            tabBarViewController,
            houseDetailNavigationController
        ]
        
        // Asignamos el rootVC
        window?.rootViewController = splitViewController
        
        window?.makeKeyAndVisible()
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // iPad
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            if let navController = viewController as? UINavigationController {
                let typeOfViewController = type(of: navController.viewControllers.first!)
                var detailViewController: UINavigationController
                
                switch (typeOfViewController) {
                case is HouseListViewController.Type:
                    detailViewController = houseDetailNavigationController
                    
                case is SeasonListViewController.Type:
                    detailViewController = seasonDetailNavigationController
                    
                default:
                    NSLog("Controller Error \(typeOfViewController)")
                    detailViewController = UINavigationController()
                }
                
                splitViewController.showDetailViewController(detailViewController, sender: self)
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

