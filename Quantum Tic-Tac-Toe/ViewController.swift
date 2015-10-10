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
    
    @IBOutlet weak var box0: NSBox!
    @IBOutlet weak var box1: NSBox!
    @IBOutlet weak var box2: NSBox!
    @IBOutlet weak var box3: NSBox!
    @IBOutlet weak var box4: NSBox!
    @IBOutlet weak var box5: NSBox!
    @IBOutlet weak var box6: NSBox!
    @IBOutlet weak var box7: NSBox!
    @IBOutlet weak var box8: NSBox!
    
    var turnNum = 0
    var winner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override var representedObject: AnyObject? {
        didSet {
            
        }
    }
    func matrixArr() -> [buttonMatrix!] {
        let arr = [matrix0,matrix1,matrix2,matrix3,matrix4,matrix5,matrix6,matrix7,matrix8]
        return arr
    }
    
    func boxArr() -> [NSBox!] {
        let arr = [box0,box1,box2,box3,box4,box5,box6,box7,box8]
        return arr
    }

    @IBAction func buttonClicked(sender: buttonMatrix) {
        let selcell: NSButtonCell = sender.selectedCell() as! NSButtonCell
        if(turnNum % 2 == 0){
            selcell.title = "X"
            selcell.enabled = false
        }else{
            selcell.title = "O"
            selcell.enabled = false
        }
        turnNum++;
        
        let index = selcell.tag;
        
        sender.calculatewinner()
        
        let boxes = self.boxArr()
        if(sender.winner == "X"){
            boxes[sender.tag].fillColor = NSColor(red: 0, green: 1, blue: 0, alpha: 0.25)
            boxes[sender.tag].transparent = false
        }else if(sender.winner == "O"){
            boxes[sender.tag].fillColor = NSColor(red: 1, green: 0, blue: 0, alpha: 0.25)
            boxes[sender.tag].transparent = false
        }
        
        let arr = self.matrixArr()
        for matrix in arr{
            if(matrix.tag == index){
                matrix.enableButtons()
            }else{
                matrix.disableButtons()
            }
        }
        if(arr[index].allButtonsDisabled()){
            for matrix in arr{
                matrix.enableButtons()
            }
        }
        
        self.isThereAWinner()
        if(self.isTie()){
            let tieAlert = NSAlert()
            tieAlert.messageText = "It's a Draw!"
            tieAlert.informativeText = "Would you like to play again?"
            tieAlert.alertStyle = NSAlertStyle.WarningAlertStyle
            tieAlert.addButtonWithTitle("Restart")
            tieAlert.addButtonWithTitle("Quit")
            let res = tieAlert.runModal()
            if(res == NSAlertFirstButtonReturn){
                self.restart()
            }else{
                exit(0)
            }
        }
        
        if(winner != ""){
            let winAlert = NSAlert()
            winAlert.messageText = "The winner is " + winner + "!"
            winAlert.informativeText = "Would you like to play again?"
            winAlert.alertStyle = NSAlertStyle.WarningAlertStyle
            winAlert.addButtonWithTitle("Restart")
            winAlert.addButtonWithTitle("Quit")
            let result = winAlert.runModal()
            if(result == NSAlertFirstButtonReturn){
                self.restart()
            }else{
                exit(0)
            }
        }
        
    }
    
    func isThereAWinner(){
        if(matrix0.winner == matrix1.winner && matrix0.winner == matrix2.winner && matrix0.winner != ""){
            winner = matrix0.winner;
        }else if(matrix3.winner == matrix4.winner && matrix3.winner == matrix5.winner && matrix3.winner != ""){
            winner = matrix3.winner;
        }else if(matrix6.winner == matrix7.winner && matrix6.winner == matrix8.winner && matrix6.winner != ""){
            winner = matrix6.winner;
        }else if(matrix0.winner == matrix3.winner && matrix0.winner == matrix6.winner && matrix0.winner != ""){
            winner = matrix0.winner;
        }else if(matrix1.winner == matrix4.winner && matrix1.winner == matrix7.winner && matrix1.winner != ""){
            winner = matrix1.winner;
        }else if(matrix2.winner == matrix5.winner && matrix2.winner == matrix8.winner && matrix2.winner != ""){
            winner = matrix2.winner;
        }else if(matrix0.winner == matrix4.winner && matrix0.winner == matrix8.winner && matrix0.winner != ""){
            winner = matrix0.winner;
        }else if(matrix2.winner == matrix4.winner && matrix2.winner == matrix6.winner && matrix2.winner != ""){
            winner = matrix2.winner;
        }
    }
    
    func isTie() -> Bool {
        if(matrix0.winner != "" && matrix1.winner != "" && matrix2.winner != "" && matrix3.winner != "" && matrix4.winner != "" && matrix5.winner != "" && matrix6.winner != "" && matrix7.winner != "" && matrix8.winner != "" && self.winner == ""){
            return true;
        }else{
            return false
        }
    }
    
    func restart() {
        let matrices = matrixArr()
        let boxes = boxArr()
        self.turnNum = 0
        self.winner = ""
        
        for(var i = 0; i < 9; i++){
            boxes[i].transparent = true
            matrices[i].reset()
        }
    }
    

}