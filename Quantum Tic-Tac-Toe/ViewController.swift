//
//  ViewController.swift
//  Quantum Tic-Tac-Toe
//
//  Created by Colin Thompson on 9/19/15.
//  Copyright © 2015 Colin Thompson. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var matrix0: buttonMatrix!
    @IBOutlet weak var matrix1: buttonMatrix!
    @IBOutlet weak var matrix2: buttonMatrix!
    @IBOutlet weak var matrix3: buttonMatrix!
    @IBOutlet weak var matrix4: buttonMatrix!
    @IBOutlet weak var matrix5: buttonMatrix!
    @IBOutlet weak var matrix6: buttonMatrix!
    @IBOutlet weak var matrix7: buttonMatrix!
    @IBOutlet weak var matrix8: buttonMatrix!
    
    var turnNum = 0;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: AnyObject? {
        didSet {
            
        }
    }

    @IBAction func buttonClicked(sender: buttonMatrix) {
        let selcell: NSButtonCell = sender.selectedCell() as! NSButtonCell;
        if(turnNum % 2 == 0){
            selcell.title = "X";
            selcell.enabled = false;
        }else{
            selcell.title = "O";
            selcell.enabled = false;
        }
        turnNum++;
        
        let index = selcell.tag;
        if(sender.winner == ""){
            sender.calculatewinner();
        }
        
        for(var x = 0; x < 9; x++){
            if(){
                
            }
        }
    }
    
    func isThereAWinner() -> Bool{
        
        if(matrix0.winner == matrix1.winner && matrix0.winner == matrix2.winner && matrix0.winner != ""){
            return true;
        }else if(matrix3.winner == matrix4.winner && matrix3.winner == matrix5.winner && matrix3.winner != ""){
            return true;
        }else if(matrix6.winner == matrix7.winner && matrix6.winner == matrix8.winner && matrix6.winner != ""){
            return true;
        }else if(matrix0.winner == matrix3.winner && matrix0.winner == matrix6.winner && matrix0.winner != ""){
            return true;
        }else if(matrix1.winner == matrix4.winner && matrix1.winner == matrix7.winner && matrix1.winner != ""){
            return true;
        }else if(matrix2.winner == matrix5.winner && matrix2.winner == matrix8.winner && matrix2.winner != ""){
            return true;
        }else if(matrix0.winner == matrix4.winner && matrix0.winner == matrix8.winner && matrix0.winner != ""){
            return true;
        }else if(matrix2.winner == matrix4.winner && matrix2.winner == matrix6.winner && matrix2.winner != ""){
            return true;
        }
        return false;
    }
    

}

