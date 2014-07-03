//
//  DMGraffitiViewController.m
//  DreamMark
//
//  Created by Ckitakishi on 14-7-3.
//  Copyright (c) 2014年 Ckitakishi. All rights reserved.
//

#import "DMGraffitiViewController.h"

@interface DMGraffitiViewController ()
{
    CGFloat  fGreen;
    CGFloat  fRed;
    CGFloat  fBlue;
    BOOL bRubber;
    CGPoint  pntBegin;
    BOOL bMoved;
}

@end

@implementation DMGraffitiViewController
int fBrushWidth=5;
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
    self.Canvas.layer.borderWidth = 2;
    self.Canvas.layer.borderColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1].CGColor;
    [self initColor];
}
- (void)initColor
{
    self.eraser.layer.borderWidth = 1;
    self.eraser.layer.borderColor = [UIColor blackColor].CGColor;
    self.eraser.layer.cornerRadius = 4;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    bMoved=NO;
    UITouch * touch=[touches anyObject];
    pntBegin=[touch locationInView:self.myView];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    bMoved=YES;
    UITouch * touch=[touches anyObject];
    CGPoint currentPoint=[touch locationInView:self.myView];
    CGContextRef context=NULL;
    
    UIGraphicsBeginImageContext(self.Canvas.frame.size);
    [self.Canvas.image drawInRect:self.Canvas.frame];
    context=UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    if(bRubber)
    {
        CGContextClearRect(context, CGRectMake(currentPoint.x-fBrushWidth,
                                               currentPoint.y-fBrushWidth,
                                               fBrushWidth*2,
                                               fBrushWidth*2));
    }
    else
    {
        CGContextMoveToPoint(context, pntBegin.x, pntBegin.y);
        CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetLineWidth(context, fBrushWidth);
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        CGContextSetRGBStrokeColor(context, fRed, fGreen, fBlue, 1.0f);
        CGContextStrokePath(context);
    }
    CGContextRestoreGState(context);
    self.Canvas.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    pntBegin=currentPoint;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch=[touches anyObject];
    CGPoint currentPoint=[touch locationInView:self.myView];
    if(!bMoved)
    {
        UIGraphicsBeginImageContext(self.Canvas.frame.size);
        [self.Canvas.image drawInRect:self.Canvas.frame];
        CGContextRef context=UIGraphicsGetCurrentContext();
        if(bRubber)
        {
            CGContextClearRect(context, CGRectMake(currentPoint.x-fBrushWidth,
                                                   currentPoint.y-fBrushWidth,
                                                   fBrushWidth*2,
                                                   fBrushWidth*2));
        }
        else
        {
            CGContextMoveToPoint(context, pntBegin.x, pntBegin.y);
            CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
            CGContextSetLineCap(context, kCGLineCapRound);
            CGContextSetLineWidth(context, fBrushWidth);
            CGContextSetBlendMode(context, kCGBlendModeNormal);
            CGContextSetRGBStrokeColor(context, fRed, fGreen, fBlue, 1.0f);
            CGContextStrokePath(context);
        }
        CGContextFlush(context);
        self.Canvas.image=UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//取消
- (IBAction)graffitiCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//清空画布，把imageview中的image置为nil
- (IBAction)graffitiClear:(id)sender
{
    self.Canvas.image = nil;
}

- (IBAction)actionD:(id)sender
{
    bRubber=NO;
    fRed=102.0f/255.0f;
    fGreen=208.0f/255.0f;
    fBlue=0.0f/255.0f;
}
//分享功能使用sharesdk，暂未实现。。
- (IBAction)acitonShare:(id)sender
{
    
}

- (IBAction)actionSave:(id)sender
{
    UIImageWriteToSavedPhotosAlbum([self.Canvas image], nil, nil, nil);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储涂鸦成功"
                                                    message:@"已将涂鸦存储于图片库中，打开照片程序即可查看。"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)buttonEraser:(id)sender
{
     bRubber=YES;
}

- (IBAction)buttonM:(id)sender
{
    bRubber=NO;
    fRed=0.0f/255.0f;
    fGreen=0.0f/255.0f;
    fBlue=0.0f/255.0f;
}

- (IBAction)buttonA:(id)sender
{
    bRubber=NO;
    fRed=238.0f/255.0f;
    fGreen=15.0f/255.0f;
    fBlue=10.0f/255.0f;
}

- (IBAction)buttonE:(id)sender
{
    bRubber=NO;
    fRed=228.0f/255.0f;
    fGreen=186.0f/255.0f;
    fBlue=10.0f/255.0f;
}

- (IBAction)actionR:(id)sender
{
    bRubber=NO;
    fRed=87.0f/255.0f;
    fGreen=156.0f/255.0f;
    fBlue=230.0f/255.0f;
}
@end
