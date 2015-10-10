//
//  buttonMatrix.swift
//  Quantum Tic-Tac-Toe
//
//  Created by Colin Thompson on 9/19/15.
//  Copyright © 2015 Colin Thompson. All rights reserved.
//

import Cocoa

class buttonMatrix: NSMatrix {

    var winner: String = "";
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
    func calculatewinner(){
        if(winner == ""){
            if(self.cellAtRow(0, column: 0)!.title == self.cellAtRow(0, column: 1)!.title &&
                self.cellAtRow(0, column: 0)!.title == self.cellAtRow(0, column: 2)!.title && self.cellAtRow(0, column: 0)!.title != ""){
                    winner = (self.cellAtRow(0, column: 0)!.title);
            }else if(self.cellAtRow(1, column: 0)!.title == self.cellAtRow(1, column: 1)!.title && self.cellAtRow(1, column: 0)!.title == self.cellAtRow(1, column: 2)!.title && self.cellAtRow(1, column: 0)!.title != ""){
                winner = (self.cellAtRow(1, column: 0)!.title);
            }else if(self.cellAtRow(2, column: 0)!.title == self.cellAtRow(2, column: 1)!.title && self.cellAtRow(2, column: 0)!.title == self.cellAtRow(2, column: 2)!.title && self.cellAtRow(2, column: 0)!.title != ""){
                winner = (self.cellAtRow(2, column: 0)!.title);
            }else if(self.cellAtRow(0, column: 0)!.title == self.cellAtRow(1, column: 0)!.title && self.cellAtRow(0, column: 0)!.title == self.cellAtRow(2, column: 0)!.title && self.cellAtRow(0, column: 0)!.title != ""){
                winner = (self.cellAtRow(0, column: 0)!.title);
            }else if(self.cellAtRow(0, column: 1)!.title == self.cellAtRow(1, column: 1)!.title && self.cellAtRow(0, column: 1)!.title == self.cellAtRow(2, column: 1)!.title && self.cellAtRow(0, column: 1)!.title != ""){
                winner = (self.cellAtRow(0, column: 1)!.title);
            }else if(self.cellAtRow(0, column: 2)!.title == self.cellAtRow(1, column: 2)!.title && self.cellAtRow(0, column: 2)!.title == self.cellAtRow(2, column: 2)!.title && self.cellAtRow(0, column: 2)!.title != ""){
                winner = (self.cellAtRow(0, column: 2)!.title);
            }else if(self.cellAtRow(0, column: 0)!.title == self.cellAtRow(1, column: 1)!.title && self.cellAtRow(0, column: 0)!.title == self.cellAtRow(2, column: 2)!.title && self.cellAtRow(0, column: 0)!.title != ""){
                winner = (self.cellAtRow(0, column: 0)!.title);
            }else if(self.cellAtRow(0, column: 2)!.title == self.cellAtRow(1, column: 1)!.title && self.cellAtRow(0, column: 2)!.title == self.cellAtRow(2, column: 0)!.title && self.cellAtRow(0, column: 2)!.title != ""){
                winner = (self.cellAtRow(0, column: 2)!.title);
            }
        }
        if(isTie()){
            winner = "T"
        }
    }
    
    func enableButtons(){
        for(var row = 0; row < 3; row++){
            for(var col = 0; col < 3; col++){
                if(self.cellAtRow(row, column: col)!.title == ""){
                    self.cellAtRow(row, column: col)!.enabled = true;
                }
            }
        }
    }
    
    func disableButtons(){
        for(var row = 0; row < 3; row++){
            for(var col = 0; col < 3; col++){
                if(self.cellAtRow(row, column: col)!.title == ""){
                    self.cellAtRow(row, column: col)!.enabled = false;
                }
            }
        }
    }
    
    func allButtonsDisabled() -> Bool{
        for(var row = 0; row < 3; row++){
            for(var col = 0; col < 3; col++){
                if(self.cellAtRow(row, column: col)!.enabled == true){
                    return false
                }
            }
        }
        return true
    }
    
    func isTie() -> Bool {
        if(winner == ""){
            for(var x = 0; x < 3; x++){
                for(var y = 0; y < 3; y++){
                    if(self.cellAtRow(x, column: y)!.title == ""){
                        return false
                    }
                }
            }
            return true
        }
        return false
    }
    
    func reset() {
        for(var x = 0; x < 3; x++){
            for(var y = 0; y < 3; y++){
                self.cellAtRow(x, column: y)?.title = ""
                self.cellAtRow(x, column: y)?.enabled = true
            }
        }
        self.winner = ""
    }
    
}
