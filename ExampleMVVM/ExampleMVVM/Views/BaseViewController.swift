//
//  BaseViewController.swift
//  ExampleMVVM
//
//  Created by hooni on 4/1/22.
//

import UIKit

class BaseViewController: UIViewController {
    let contentView = UIView()
    
    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        setupNavigationBar()
        
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.backgroundColor = "#1079c6".toUIColor()
        navigationController?.navigationBar.barTintColor = "#1079c6".toUIColor()
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = "#1079c6".toUIColor()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func setupView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        view.addSubview(contentView)
        
        let margins = view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
                guide.bottomAnchor.constraint(equalToSystemSpacingBelow: contentView.bottomAnchor, multiplier: 1.0)
            ])
        } else {
            let standardSpacing: CGFloat = 8.0
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: standardSpacing),
                bottomLayoutGuide.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: standardSpacing)
            ])
        }
    }
    
    @objc
    func rotated() {
        if UIDevice.current.orientation.isLandscape {
            //print("Landscape")
        } else {
            //print("Portrait")
        }
    }
}
