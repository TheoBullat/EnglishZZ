//
//  ViewController.swift
//  EnglishZZ
//
//  Created by Theo BULLAT on 20/12/2016.
//  Copyright © 2016 Theo BULLAT Loïc GREFFIER. All rights reserved.
//

import UIKit

class ExoSelectionViewController: UIViewController {

    var theme: Theme!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "matchSegue" {
            
            let matchView = segue.destination as! MatchViewController
            matchView.theme = self.theme
        }
        
        if segue.identifier == "vocabularySegue" {
            
            let vocabView = segue.destination as! VocabularyViewController
            vocabView.theme = self.theme
        }
        
        if segue.identifier == "PutInOrderSegue" {
            
            let PutInOrderView = segue.destination as! PutInOrderViewController
            PutInOrderView.theme = self.theme
        }
    }
}

