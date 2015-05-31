//
//  GameScene.swift
//  weat
//
//  Created by Thanabordi Jianrungsang on 5/31/15.
//  Copyright (c) 2015 ETR. All rights reserved.
//

import SpriteKit

let PLATFORM = UInt32(0x1 << 0);
let PLAYER   = UInt32(0x1 << 1);

class GameScene: SKScene {
    
    var player : SKSpriteNode?;
    var platform: SKSpriteNode?;
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Come home already, Rohit!";
//        myLabel.fontSize = 20;
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
//        self.addChild(myLabel)
        
        self.physicsWorld.gravity = CGVectorMake(0, -6);
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: self.frame);
        self.physicsBody = physicsBody;
        
        let player = SKSpriteNode(imageNamed:"PlayerLeft");
        
        player.xScale = 0.7;
        player.yScale = 0.7;
        player.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(player);
        player.physicsBody = SKPhysicsBody(circleOfRadius: player.frame.size.width/2);
        player.physicsBody!.friction = 0.3;
//        player.physicsBody!.restitution = 0.8;
        player.physicsBody!.mass = 0.5;
        player.physicsBody!.allowsRotation = false;
        player.physicsBody?.categoryBitMask = PLAYER;
        player.physicsBody?.collisionBitMask = PLATFORM;
        self.player = player;
        
        let platform = SKSpriteNode(imageNamed:"MossPlatform")
        platform.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(platform)
        platform.physicsBody = SKPhysicsBody(rectangleOfSize: platform.frame.size)
        platform.physicsBody?.dynamic = false;
        platform.physicsBody?.categoryBitMask = PLATFORM;
        self.platform = platform

    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
//            let location = touch.locationInNode(self)
            self.player?.physicsBody?.applyImpulse(CGVectorMake(0, 280));
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
//        self.player?.physicsBody?.contactTestBitMask
        
        if self.player?.physicsBody?.velocity.dy > 0 {
            self.player?.physicsBody?.collisionBitMask = 0;
        } else {
            self.player?.physicsBody?.collisionBitMask = PLATFORM;
        }

        
    }
}
