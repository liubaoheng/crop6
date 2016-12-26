//
//  ViewController.m
//  crop
//
//  Created by sibo on 2016/12/12.
//  Copyright © 2016年 sibozn. All rights reserved.
//

#import "ViewController.h"
#import "RKCropImageController.h"
@interface ViewController ()<RKCropImageViewDelegate>{
    UIImageView *imageView;
}
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //pict.jpeg
    imageView.image =[UIImage imageNamed: @"pict.jpeg"];
    [self.view addSubview:imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(50, 200, 50, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)btn{
    RKCropImageController *cropController = [[RKCropImageController alloc] initWithImage:imageView.image];
    cropController.delegate = self;
    [self presentModalViewController:cropController animated:YES];
}
-(void)cropImageViewControllerDidFinished:(UIImage *)image{
    imageView.image = image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
