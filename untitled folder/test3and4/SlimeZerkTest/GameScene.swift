//
//  GameScene.swift
//  SlimeZerkTest
//
//  Created by Parrot on 2019-02-25.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate{
    
    // MARK: Variables for tracking time
    private var lastUpdateTime : TimeInterval = 0
    var playerSpeed = CGFloat(20)
    
    var Lives = 1
    var score  = 0
    // MARK: Sprite variables
    var player:SKSpriteNode = SKSpriteNode()
    var upButton:SKSpriteNode = SKSpriteNode()
    var downButton:SKSpriteNode = SKSpriteNode()
    var leftButton:SKSpriteNode = SKSpriteNode()
    var rightButton:SKSpriteNode = SKSpriteNode()
    var enemy:SKSpriteNode = SKSpriteNode()
    var wall:SKSpriteNode = SKSpriteNode()
    var exit:SKSpriteNode = SKSpriteNode()
    var bullet:SKSpriteNode = SKSpriteNode()
   // var wall2:SKSpriteNode = SKSpriteNode()
    //var wall3:SKSpriteNode = SKSpriteNode()
    //var exit1:SKSpriteNode = SKSpriteNode()
    var musicButton:SKSpriteNode = SKSpriteNode()



    
    // MARK: Label variables
    var livesLabel:SKLabelNode = SKLabelNode(text:"")
    var scoreLabel:SKLabelNode = SKLabelNode(text:"")
    
    
    // MARK: Scoring and Lives variables
    
    
    // MARK: Game state variables
    
    
    
    // MARK: Default GameScene functions
    // -------------------------------------
    override func didMove(to view: SKView) {
        self.lastUpdateTime = 0
        
       // self.addChild(livesLabel)
    
        
        // get sprites from Scene Editor
        self.player = self.childNode(withName: "player") as! SKSpriteNode
        self.upButton = self.childNode(withName: "upButton") as! SKSpriteNode
        self.downButton = self.childNode(withName: "downButton") as! SKSpriteNode
        self.leftButton = self.childNode(withName: "leftButton") as! SKSpriteNode
        self.rightButton = self.childNode(withName: "rightButton") as! SKSpriteNode
        self.wall = self.childNode(withName: "wall") as! SKSpriteNode
        self.exit = self.childNode(withName: "exit") as! SKSpriteNode
        
        self.bullet = self.childNode(withName: "bButton") as! SKSpriteNode
        // self.wall2 = self.childNode(withName: "wall2") as! SKSpriteNode
       // self.wall3 = self.childNode(withName: "wall3") as! SKSpriteNode
        self.musicButton = self.childNode(withName: "musicButton") as! SKSpriteNode


        self.enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        
        
        // get labels from Scene Editor
        self.livesLabel = self.childNode(withName: "livesLabel") as! SKLabelNode
        self.livesLabel.text  = "Lives : \(Lives)"
        self.scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
        self.scoreLabel.text = "Score : \(score)"
        
         let playsound = SKAction.playSoundFileNamed("BackgroundMusic/SpaceTrip.mp3", waitForCompletion: true)
        self.run(playsound)
        
        
        // - add a hitbox to the player
        self.player.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:self.player.frame.width, height:self.player.frame.height))
        
        self.player.physicsBody?.affectedByGravity = false
        self.player.physicsBody?.isDynamic = true
        
        self.physicsWorld.contactDelegate = self
        
        //add a hitbox to the enemy
        self.enemy.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.enemy.frame.width, height: self.enemy.frame.height))
        self.enemy.physicsBody?.categoryBitMask = PhysicsCategory.enemy
        self.enemy.physicsBody?.affectedByGravity = false
        self.enemy.physicsBody?.isDynamic = true

        
        // add hitbox to exit
        self.exit.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.exit.frame.width, height: self.exit.frame.height))
       self.exit.physicsBody?.affectedByGravity = false
        self.exit.physicsBody?.categoryBitMask = PhysicsCategory.exit
        self.exit.physicsBody?.isDynamic = true
        
        
        // add hitbox to wall
        self.wall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.wall.frame.width, height: self.wall.frame.height))
        self.wall.physicsBody?.affectedByGravity = false
        self.wall.physicsBody?.collisionBitMask = PhysicsCategory.walls
        self.wall.physicsBody?.isDynamic = true
        

        
       // added collision rules
        self.player.physicsBody!.collisionBitMask =
            PhysicsCategory.enemy
        
        
        
        
        self.player.physicsBody!.contactTestBitMask =
            PhysicsCategory.enemy
    }
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        if (contact.collisionImpulse > 40) {
            if (nodeA?.name == "enemy") {
                
                
                
            
                let reduceImageSize = SKAction.scale(by: 0.8, duration: 0.5)
                let removeNode = SKAction.removeFromParent()
                
                let sequence = SKAction.sequence([reduceImageSize, removeNode])
                
                nodeA?.run(sequence)
                
                //self.gameOver()
            }
            else if (nodeB?.name == "exit") {
                
                // animate and remove the skull
                let reduceImageSize = SKAction.scale(by: 0.8, duration: 0.5)
                let removeNode = SKAction.removeFromParent()
                
                let sequence = SKAction.sequence([reduceImageSize, removeNode])
                
                nodeB?.run(sequence)
            
                //self.gameOver()
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        guard let touch = touches.first  else {
            return
        }
        
        let mouseLocation = touch.location(in: self)
        print("Finger starting position: \(mouseLocation)")
        
        // detect what sprite was touched
        let spriteTouched = self.atPoint(mouseLocation)
        
        if (spriteTouched.name == "rightButton") {
            //print("YOU CLICKED THE TREE")
            // add an orange where the person clicked
            self.player.xScale = 1
            self.player.position.x += playerSpeed
            //self.orange?.physicsBody?.restitution = 1.0
            
            
            self.player.physicsBody?.isDynamic = true
            
            // set the starting position of the finger
            //self.mouseStartingPosition = mouseLocation
        }
        if (spriteTouched.name == "leftButton") {
            
            self.player.xScale = -1
            self.player.position.x -= playerSpeed
            //self.orange?.physicsBody?.restitution = 1.0
            
            
            self.player.physicsBody?.isDynamic = true
            
            // set the starting position of the finger
            //self.mouseStartingPosition = mouseLocation
        }
        if (spriteTouched.name == "upButton") {
            //print("YOU CLICKED THE TREE")
            // add an orange where the person clicked
            self.player.position.y += playerSpeed
            //self.orange?.physicsBody?.restitution = 1.0
            
            
            self.player.physicsBody?.isDynamic = true
            
            // set the starting position of the finger
            //self.mouseStartingPosition = mouseLocation
        }
        if (spriteTouched.name == "downButton") {
            //print("YOU CLICKED THE TREE")
            // add an orange where the person clicked
            self.player.position.y -= playerSpeed
            //self.orange?.physicsBody?.restitution = 1.0
            
            
            self.player.physicsBody?.isDynamic = true
            
            // set the starting position of the finger
            //self.mouseStartingPosition = mouseLocation
        }
        
        
        if (spriteTouched.name == "bButton")
        {
            
            let Bullet = SKSpriteNode(imageNamed: "Orange.png")
            Bullet.zPosition = -5
            
            Bullet.position = CGPoint(x:player.position.x, y:player.position.y)
            Bullet.zRotation = enemy.zRotation
            Bullet.zPosition = enemy.zPosition
            
            let action = SKAction.moveTo(x: self.size.width + 20, duration: 0.5)
            //let action = SKAction.moveTo(self.ship.size.height, duration: 0.8)
            let actionDone = SKAction.removeFromParent()
            Bullet.run(SKAction.sequence([action, actionDone]))
            
            Bullet.physicsBody = SKPhysicsBody(rectangleOf: Bullet.size)
            Bullet.physicsBody?.affectedByGravity = false
            Bullet.physicsBody?.isDynamic = false
            self.addChild(Bullet)
            if Bullet.frame.intersects(enemy.frame){
                enemy.removeFromParent()
                score = score + 50
                self.scoreLabel.text = "\(score)"
               // self.addChild(scoreLabel)
                
            }
        }
        
            
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func moveEnemy()
    {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
       // player.position.x += playerSpeed
        
        
        
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }

        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
    
        // HINT: This code prints "Hello world" every 5 seconds
        if (dt > 5) {
            print("HELLO WORLD!")
            self.lastUpdateTime = currentTime
        }
        
        // MARK: Check if player touches enemuy
        // -------------------------------------
        if (self.player.frame.intersects(self.enemy.frame)) {
            enemy.removeFromParent()
            print("COLLISION!")
            self.Lives = self.Lives - 1
            self.livesLabel.text = " \(self.Lives)"
            
            // Before restarting the game, check if this is a game over
            if (self.Lives == 0) {
                // display the YOU LOSE screen
                
                // 1. Initialize the new scene
                let GameOverScene = gameOverScene(size:self.size, win:false)
                GameOverScene.scaleMode = self.scaleMode
                
                // 2. Configure the "animation" between screens
                let transitionEffect = SKTransition.flipHorizontal(withDuration: 2)
                
                // 3. Show the scene
                self.view?.presentScene(GameOverScene, transition: transitionEffect)
            }
            if(self.player.frame.intersects(self.exit.frame))
            {
                exit.removeFromParent()
                guard let scene = GameScene(fileNamed: "BerzerkLevel2") else{
                    return
                }
                view?.presentScene(scene)
               // guard GameScene(fileNamed:"BerzerkLevel2") != nil else {
                   // return
                //SKScene level2 =
                
               

            }
            
            
            // restart the game
            // - moving all the sprites back to their original positions
            //self.restartGame()
        }

        
    }
    
    // MARK: Custom GameScene Functions
    // Your custom functions can go here
    // -------------------------------------
    
    
    struct PhysicsCategory {
        static let None:  UInt32 = 0
        static let player:   UInt32 = 0b1      // 0x00000001 = 1
        static let enemy: UInt32 = 0b10     // 0x00000010 = 2
        static let exit:   UInt32 = 0b100    // 0x00000100 = 4
        static let walls: UInt32 = 0b1000   // 0x00001000 = 8
    }

    
}
