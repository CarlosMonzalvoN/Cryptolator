//
//  ViewController.swift
//  Cryptolator
//
//  Created by Pedro Carlos Monzalvo Navarro on 29/04/22.
//

import UIKit

class ViewController: UIViewController {

    private let button : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Clic", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self,
                         action: #selector(didTapButton),
                         for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    @objc func didTapButton(){
        let tabBarViewController = UITabBarController()
        
        let coinsMarkViewController = UINavigationController(rootViewController: CoinsMarketViewController())
        let calculatorViewController = UINavigationController(rootViewController: CalculatorViewController())
        
        coinsMarkViewController.title = "Coins"
        calculatorViewController.title = "Calculator"
        
        tabBarViewController.setViewControllers([coinsMarkViewController, calculatorViewController], animated: false)
        
        tabBarViewController.tabBar.backgroundColor = .lightText
        
        let images = ["bitcoinsign.circle", "plus.slash.minus"]
        
        guard let items = tabBarViewController.tabBar.items else {
            return
        }
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBarViewController.modalPresentationStyle = .fullScreen
        present(tabBarViewController, animated: true)
        
    }


}

