//
//  gameOverScene.swift
//  SlimeZerkTest
//
//  Created by Kiran Mehal on 2019-02-25.
//  Copyright © 2019 Parrot. All rights reserved.
//

import Foundation
import SpriteKit

// The default template for a new scssene
class gameOverScene:SKScene {
    var playerWins = true
    
    init(size: CGSize, win:Bool) {
        super.init(size: size)
        self.playerWins = win
    }
    
    // required nonsense to make this class work
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        
        var background = SKLabelNode()
        background.fontSize = 70
        if (self.playerWins == true) {
            background = SKLabelNode(text: "You Win")
        }
        else {
            background = SKLabelNode(text: "You lose")

        }
        
        background.position = CGPoint(x:self.size.width/2, y:self.size.height/2)
        
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // When person touches screen, send them back to the game
        
        // 1. Initialize the new scene
        let gameScene = GameScene(size:self.size)
        gameScene.scaleMode = self.scaleMode
        
        // 2. Configure the "animation" between screens
        let transitionEffect = SKTransition.flipHorizontal(withDuration: 3)
        
        // 3. Show the scene
        self.view?.presentScene(gameScene, transition: transitionEffect)
        
        
    }
}
