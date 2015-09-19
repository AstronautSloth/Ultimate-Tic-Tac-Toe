//
//  buttonMatrix.swift
//  Quantum Tic-Tac-Toe
//
//  Created by Colin Thompson on 9/19/15.
//  Copyright © 2015 Colin Thompson. All rights reserved.
//

import Cocoa

class buttonMatrix: NSMatrix {

    var winner: NSString?;
    
    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)
    }
    
    func calculatewinner(){
        if(self.cellAtRow(0, column: 0)!.title == self.cellAtRow(0, column: 1)?.title && self.cellAtRow(0, column: 0)?.title == self.cellAtRow(0, column: 2)?.title){
            winner = (self.cellAtRow(0, column: 0)?.title)!;
        }else if(self.cellAtRow(1, column: 0)!.title == self.cellAtRow(1, column: 1)?.title && self.cellAtRow(1, column: 0)?.title == self.cellAtRow(1, column: 2)?.title){
            winner = self.cellAtRow(1, column: 0)?.title;
        }else if(self.cellAtRow(2, column: 0)!.title == self.cellAtRow(2, column: 1)?.title && self.cellAtRow(2, column: 0)?.title == self.cellAtRow(2, column: 2)?.title){
            winner = self.cellAtRow(2, column: 0)?.title;
        }else if(self.cellAtRow(0, column: 0)!.title == self.cellAtRow(0, column: 1)?.title && self.cellAtRow(0, column: 0)?.title == self.cellAtRow(0, column: 2)?.title){
            winner = self.cellAtRow(0, column: 0)?.title;
        }else if(self.cellAtRow(1, column: 0)!.title == self.cellAtRow(1, column: 1)?.title && self.cellAtRow(1, column: 0)?.title == self.cellAtRow(1, column: 2)?.title){
            winner = self.cellAtRow(1, column: 0)?.title;
        }else if(self.cellAtRow(2, column: 0)!.title == self.cellAtRow(2, column: 1)?.title && self.cellAtRow(2, column: 0)?.title == self.cellAtRow(2, column: 2)?.title){
            winner = self.cellAtRow(2, column: 0)?.title;
        }else if(self.cellAtRow(0, column: 0)!.title == self.cellAtRow(1, column: 1)?.title && self.cellAtRow(0, column: 0)?.title == self.cellAtRow(2, column: 2)?.title){
            winner = self.cellAtRow(0, column: 0)?.title;
        }else if(self.cellAtRow(0, column: 2)!.title == self.cellAtRow(1, column: 1)?.title && self.cellAtRow(0, column: 2)?.title == self.cellAtRow(2, column: 0)?.title){
            winner = self.cellAtRow(0, column: 2)?.title;
        }
    }
    
}
