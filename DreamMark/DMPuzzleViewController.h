//
//  DMPuzzleViewController.h
//  DreamMark
//
//  Created by OurEDA on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMPuzzleViewController : UIViewController
- (IBAction)bar2Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bar2;
- (IBAction)bar1Action:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *bar1;

- (IBAction)puzzleCancel:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIImageView *Canvas;
@property (weak, nonatomic) IBOutlet UIView *puzzelView;

@property(nonatomic, strong) NSArray * datasource;
@property(nonatomic, strong) NSArray * datasourceMark;
@property(nonatomic,strong) NSArray * aPlist;
@property(nonatomic,strong) UIImageView * images;
@property(nonatomic,strong) NSMutableArray * imagesArray;
@end
