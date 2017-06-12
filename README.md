# GalletXpander
Easy to use Just get the Swift classes and complete the next function with as much items as you want!

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StackViewTableViewCell
        switch(indexPath.row){
            case 0:
                cell.titleLabel.text = "Titulo 1"
                let someStrings = [String](arrayLiteral: "1.1","1.2","-","1.3","1.4","-","1.5","1.6","-")
                conenidoCeldas(cell.stackView , someStrings)
                break;
            case 1:
                break;
            case 2:      
                break;
            case n...:      
                break;  
            default:
                break;
        }
        return cell
    }
    
You also need to increase the numbers of row but it's easy

 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of cells to display To increase in the example there is 10
        return 10
    }
