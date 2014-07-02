//
//  DMGraffitiViewController.h
//  DreamMark
//
//  Created by Ckitakishi on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMGraffitiViewController : UIViewController
- (IBAction)graffitiCancel:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *myView;
@property (weak, nonatomic) IBOutlet UIImageView *graffitiView;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end
