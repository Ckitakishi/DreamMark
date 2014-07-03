//
//  DMGraffitiViewController.h
//  DreamMark
//
//  Created by Ckitakishi on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMGraffitiViewController : UIViewController
- (IBAction)acitonShare:(id)sender;
- (IBAction)actionSave:(id)sender;
- (IBAction)buttonEraser:(id)sender;
- (IBAction)buttonM:(id)sender;
- (IBAction)buttonA:(id)sender;
- (IBAction)buttonE:(id)sender;
- (IBAction)actionR:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *eraser;
- (IBAction)actionD:(id)sender;
- (IBAction)graffitiCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *Canvas;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end
