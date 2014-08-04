//
//  GameScene.swift
//  TurkeyDinner
//
//  Created by Striker on 8/4/14.
//  Copyright (c) 2014 Striker. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    var turkey = SKSpriteNode()

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */

        // Physics
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)

        // Turkey
        var turkeyTexture = SKTexture(imageNamed:"Turkey")
        turkeyTexture.filteringMode = SKTextureFilteringMode.Nearest

        turkey = SKSpriteNode(texture: turkeyTexture)
        turkey.setScale(0.5)
        turkey.position = CGPoint(x: self.frame.size.width * 0.35, y: self.frame.size.height * 0.6)

        turkey.physicsBody = SKPhysicsBody(circleOfRadius: turkey.size.height/2.0)
        turkey.physicsBody.dynamic = true
        turkey.physicsBody.allowsRotation = false

        self.addChild(turkey)

        // Ground
        var groundTexture = SKTexture(imageNamed:"Ground")

        var sprite = SKSpriteNode(texture: groundTexture)
        sprite.setScale(2.0)
        sprite.position = CGPointMake(self.size.width/2.0, sprite.size.height/2.0)

        self.addChild(sprite)

        var ground = SKNode()

        ground.position = CGPointMake(0, groundTexture.size().height)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, groundTexture.size().height * 2.0))

        ground.physicsBody.dynamic = false
        self.addChild(ground)

    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {

            let location = touch.locationInNode(self)

            turkey.physicsBody.velocity = CGVectorMake(0, 0)
            turkey.physicsBody.applyImpulse(CGVectorMake(0, 25))

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
