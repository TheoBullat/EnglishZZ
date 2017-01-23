//
//  VCVocabulary.swift
//  EnglishZZ
//
//  Created by Theo BULLAT on 21/12/2016.
//  Copyright © 2016 Theo BULLAT Loïc GREFFIER. All rights reserved.
//

import UIKit
import AVFoundation


class VocabularyViewController: UIViewController {
    
    var listLabel = [UILabel]()
    @IBOutlet weak var labelTopLeft: UILabel!
    @IBOutlet weak var labelTopMiddle: UILabel!
    @IBOutlet weak var labelTopRight: UILabel!
    @IBOutlet weak var labelBottomLeft: UILabel!
    @IBOutlet weak var labelBottomMiddle: UILabel!
    @IBOutlet weak var labelBottomRight: UILabel!
    
    var listImage = [UIImageView]()
    @IBOutlet weak var imageCheckGoodTopLeft: UIImageView!
    @IBOutlet weak var imageCheckGoodTopMiddle: UIImageView!
    @IBOutlet weak var imageCheckGoodTopRight: UIImageView!
    @IBOutlet weak var imageCheckGoodBottomLeft: UIImageView!
    @IBOutlet weak var imageCheckGoodBottomMiddle: UIImageView!
    @IBOutlet weak var imageCheckGoodBottomRight: UIImageView!
    
    var listButton = [UIButton]()
    @IBOutlet weak var buttonTopLeft: UIButton!
    @IBOutlet weak var buttonTopMiddle: UIButton!
    @IBOutlet weak var buttonTopRight: UIButton!
    @IBOutlet weak var buttonBotLeft: UIButton!
    @IBOutlet weak var buttonBotMiddle: UIButton!
    @IBOutlet weak var buttonBotRight: UIButton!
    
    let numberOfVocabularyElements = 6
    
    var theme: Theme!    
    var tabName = [String]()
    var tabImageName = [String]()
    var tabSoundName = [String]()
    var tabExtension = [String]()

    var countOfCheck = Int()
    
    // Fonction permettant de remplir chacune de nos listes d'éléments (Boutons, Images, Labels)
    // Une liste de label contenant les noms des mots
    // Une liste d'images contenant les logos de validation
    // Une liste de boutons contenant les images associées aux mots
    func fillTheList(){
        
        listLabel.append(labelTopLeft)
        listLabel.append(labelTopMiddle)
        listLabel.append(labelTopRight)
        listLabel.append(labelBottomLeft)
        listLabel.append(labelBottomMiddle)
        listLabel.append(labelBottomRight)

        listImage.append(imageCheckGoodTopLeft)
        listImage.append(imageCheckGoodTopMiddle)
        listImage.append(imageCheckGoodTopRight)
        listImage.append(imageCheckGoodBottomLeft)
        listImage.append(imageCheckGoodBottomMiddle)
        listImage.append(imageCheckGoodBottomRight)
        
        listButton.append(buttonTopLeft)
        listButton.append(buttonTopMiddle)
        listButton.append(buttonTopRight)
        listButton.append(buttonBotLeft)
        listButton.append(buttonBotMiddle)
        listButton.append(buttonBotRight)
    }
    
    // Au chargement de la fenêtre
    // On récupère n=6 éléments de vocabulaire au hasard via la fonction "getVocabulary"
    // On remplit nos listes d'éléments graphiques
    // On remplit parallèlement 4 listes de chaînes de caractères contenant le nom, le nom de l'image, le nom du son, et l'extension du son de nos n éléments de vocabulaire
    // On initialise nos labels à vides et on cache les logos de validations
    // On place nos n images prises au hasard
    // On cache le boutton "Next"
    // On initialise le compteur de mots validés à 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let listVocabulary = self.theme.getVocabulary(numberOfVocab: numberOfVocabularyElements)
        
        fillTheList()
        
        for i in 0...numberOfVocabularyElements-1 {
            
            self.tabName.append(listVocabulary[i].getName())
            self.tabImageName.append(listVocabulary[i].getImageName())
            self.tabSoundName.append(listVocabulary[i].getSoundName())
            self.tabExtension.append(listVocabulary[i].getSoundExtension())
            self.listLabel[i].text = ""
            self.listImage[i].alpha = 0
            self.listButton[i].setImage(UIImage.init(named: tabImageName[i]), for: UIControlState.normal)
        }

        self.countOfCheck = 0
        playSound(name: "NoSound", extensionName: "m4a")
    }
    
    
    // Fonction permettant de jouer un son dont le nom et l'extension sont passés en paramètre
    func playSound(name: String?, extensionName: String?) {
        
        var mySound: SystemSoundID = 0
        
        if let soundBook = Bundle.main.url(forResource: name, withExtension: extensionName) {
            
            AudioServicesCreateSystemSoundID(soundBook as CFURL, &mySound)
        }
        
        AudioServicesPlaySystemSound(mySound);
    }

    // Action déclenché lorsque l'on clique sur un bouton
    // Dans "sender.tag" on a un identifiant associé au bouton sur lequel on a cliqué
    // On joue le son associé au bouton sur lequel on a cliqué grâce au tableau contenant les sons
    // Si le label associé au bouton cliqué est vide (= Si c'est la première fois qu'on clique sur le bouton) alors
        // On affiche le nom de l'élément cliqué
        // On affiche le logo validé 
        // On incrémente le nombre d'élément validé
    // Si le nombre d'élément validé est >= à 6 alors
        // On affiche le bouton "Suivant"
    @IBAction func ButtonPressed(_ sender: UIButton) {

        playSound(name: tabSoundName[sender.tag], extensionName: tabExtension[sender.tag])
        
        if listLabel[sender.tag].text == "" {
            
            listLabel[sender.tag].text = tabName[sender.tag]
            listImage[sender.tag].alpha = 1
            countOfCheck += 1
        }
        
        if countOfCheck >= 6 {
            
            // Vider la vue
            // Créer dynamiquement un label Félicitations, 2 bouttons Replay/Exit
        }
    }
    
    // Fonction appelé lorsque l'on clique sur le bouton "Suivant" ou "Précédent"
    // Renvoit le thème séléctionné à la fenêtre suivante ou précédente
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let exoSelectionVC = segue.destination as! ExoSelectionViewController
        exoSelectionVC.theme = self.theme
    }
}
