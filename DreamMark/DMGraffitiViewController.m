//
//  DMGraffitiViewController.m
//  DreamMark
//
//  Created by Ckitakishi on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import "DMGraffitiViewController.h"

@interface DMGraffitiViewController ()

@end

@implementation DMGraffitiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.saveButton setBackgroundImage:[UIImage imageNamed:@"save.png"] forState:UIControlStateNormal];
    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];
    self.graffitiView.layer.borderWidth = 2;
    self.graffitiView.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)graffitiCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
