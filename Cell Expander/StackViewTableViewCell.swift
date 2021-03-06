//
//  PickerTableViewCell.swift
//  Cell Expander
//
//  Copyright (c) 2017 Jon Galletero. All rights reserver
//

import UIKit

class StackViewTableViewCell : UITableViewCell {
    
    var isObserving = false;
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    
    class var defaultHeight: CGFloat  { get { return 44  } }
    
    func checkHeight() {
        stackView.isHidden = (frame.size.height < stackView.bounds.size.height)
    }
    
    func watchFrameChanges() {
        if !isObserving {
            addObserver(self, forKeyPath: "frame", options: [NSKeyValueObservingOptions.new, NSKeyValueObservingOptions.initial], context: nil)
            isObserving = true;
        }
    }
    
    func ignoreFrameChanges() {
        if isObserving {
            removeObserver(self, forKeyPath: "frame")
            isObserving = false;
        }
    }
    
    // Observador del estado del slidepanel
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?){
        if keyPath == "frame" {
            checkHeight()
        }
    }
}
