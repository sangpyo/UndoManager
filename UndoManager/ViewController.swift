//
//  ViewController.swift
//  UndoManager
//
//  Created by park sang pyo on 28/01/2019.
//  Copyright © 2019 park sang pyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var colorPanalView: UIView!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var redoButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.applicationSupportsShakeToEdit = false
        
        self.undoButton.isEnabled = self.undoManager?.canUndo ?? false
        self.redoButton.isEnabled = self.undoManager?.canRedo ?? false
    }
    
    @IBAction func reset(_ sender: Any) {
        self.undoManager?.removeAllActions()
        
        self.undoButton.isEnabled = self.undoManager!.canUndo
        self.redoButton.isEnabled = self.undoManager!.canRedo
    }
    
    @IBAction func Undo(_ sender: Any) {
        self.undoManager?.undo()
        self.undoButton.isEnabled = self.undoManager!.canUndo
        self.redoButton.isEnabled = self.undoManager!.canRedo
    }
    
    @IBAction func Redo(_ sender: Any) {
        self.undoManager?.redo()
        self.undoButton.isEnabled = self.undoManager!.canUndo
        self.redoButton.isEnabled = self.undoManager!.canRedo
    }
    
    @objc func switchColor(_ color: UIColor) {
        self.undoManager?.registerUndo(withTarget: self, selector: #selector(switchColor(_:)), object: self.colorPanalView.backgroundColor)
        self.colorPanalView.backgroundColor = color
        self.undoButton.isEnabled = self.undoManager?.canUndo ?? false
        self.redoButton.isEnabled = self.undoManager?.canRedo ?? false
    }
    
    @IBAction func Red(_ sender: Any) {
        
        self.switchColor(UIColor.red)
    }
    
    @IBAction func Green(_ sender: Any) {
        
        self.switchColor(UIColor.green)
    }
    
    @IBAction func Blue(_ sender: Any) {
        
        self.switchColor(UIColor.blue)
    }
    

    @objc func switchImage(_ image: UIImage) {
        let oldImage = self.photoImageView.image
        self.undoManager?.registerUndo(withTarget: self, handler: { (targetSelf) in
            targetSelf.switchImage(oldImage!)
        })
        
        self.photoImageView.image = image
        
        self.undoButton.isEnabled = self.undoManager?.canUndo ?? false
        self.redoButton.isEnabled = self.undoManager?.canRedo ?? false
    }
    
    @IBAction func ariana(_ sender: Any) {
        self.switchImage(UIImage(named: "image-1")!)
    }
    
    @IBAction func taylor(_ sender: Any) {
        self.switchImage(UIImage(named: "image-2")!)
    }
    
    @IBAction func rihanna(_ sender: Any) {
        self.switchImage(UIImage(named: "image-3")!)
    }
}

