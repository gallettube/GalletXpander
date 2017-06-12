//
//  ViewController.swift
//  Cell Expander
//
//  Created by Christian Di Lorenzo on 4/7/15.
//  Copyright (c) 2015 Christian Di Lorenzo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var selectedIndexPath : IndexPath?
    var yPos : Int = 0
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of cells to display
        return 10
    }
    
    
    func conenidoCeldas( _ containerView : UIStackView,  _ someStrings : [String]){
        for subview in containerView.subviews {
            subview.removeFromSuperview()
        }
        yPos = 0
        for texto in someStrings{
            if( texto.contains("-")){
                let du = UILabel(frame:  CGRect(x: 0, y: yPos, width: Int(UIScreen.main.bounds.width), height: 1))
                du.backgroundColor = UIColor.black
                containerView.addSubview(du)
                yPos += 2
            }else{
                let ppLabel : UILabel = UILabel(frame: CGRect(x: 0, y: yPos, width: Int(UIScreen.main.bounds.width), height: 21))
                ppLabel.textAlignment = .left
                ppLabel.textColor = UIColor.black
                ppLabel.text =  texto
                containerView.addSubview(ppLabel)
                yPos += 22
            }
        }
    }

    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StackViewTableViewCell
        switch(indexPath.row){
            case 0:
                cell.titleLabel.text = "Titulo 1"
                let someStrings = [String](arrayLiteral: "1.1","1.2","-","1.3","1.4","-","1.5","1.6","-")
                conenidoCeldas(cell.stackView , someStrings)
                break;
            case 1:
                cell.titleLabel.text = "Titulo 2"
                let someStrings = [String](arrayLiteral: "2.1","2.2","-","2.3","2.4","-")
                conenidoCeldas(cell.stackView , someStrings)
                break;
            case 2:
                cell.titleLabel.text = "Titulo 3"
                let someStrings = [String](arrayLiteral: "tres","tres b","-","tres a ","tres 2","-")
                conenidoCeldas(cell.stackView , someStrings)
                break;
            default:
                cell.titleLabel.text = "Titulo por defecto"
                break;
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<IndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        if indexPaths.count > 0 {
            tableView.reloadRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! StackViewTableViewCell).watchFrameChanges()
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! StackViewTableViewCell).ignoreFrameChanges()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        for cell in tableView.visibleCells as! [StackViewTableViewCell] {
            cell.ignoreFrameChanges()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return  CGFloat(yPos)+StackViewTableViewCell.defaultHeight
        } else {
            return StackViewTableViewCell.defaultHeight
        }
    }


}

