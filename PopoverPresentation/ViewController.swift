//
//  ViewController.swift
//  PopoverPresentation
//
//  Created by Satyadev on 01/09/17.
//  Copyright © 2017 Satyadev Chauhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var barPop: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Set the title
        self.title = "Swift"
        
        // Create a bar button
        self.barPop = UIBarButtonItem.init(title: "Pop", style: .plain, target: self, action: #selector(popClicked(_:)))
        
        // Add your bar button
        self.navigationItem.rightBarButtonItem = barPop
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func popClicked(_ sender: Any) {
        
        // Create your view controller
        let popViewController = UIViewController()
        
        // Set background so that its visible
        popViewController.view.backgroundColor = .blue
        
        // Set your popover size.
        popViewController.preferredContentSize = CGSize(width: 300, height: 300)
        
        // Set the presentation style to modal so that the above methods get called.
        popViewController.modalPresentationStyle = .popover
        
        // Set the popover presentation controller delegate so that the above methods get called.
        popViewController.popoverPresentationController?.delegate = self
        
        // Present the popover.
        self.present(popViewController, animated: true, completion: nil)
    }

}

//MARK: UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none;
    }
    
    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        popoverPresentationController.permittedArrowDirections = .any
        popoverPresentationController.barButtonItem = barPop
    }
    
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        print("Popover Dismissed!")
    }
}
