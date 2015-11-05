//
//  ZPDFPageController.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFPageController.h"
#import "ZPDFView.h"

@interface ZPDFPageController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView  *scrollView;
@property (nonatomic,strong) ZPDFView *pdfView;
@end

@implementation ZPDFPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
   
    _pdfView = [[ZPDFView alloc] initWithFrame:frame atPage:self.pageNO withPDFDoc:self.pdfDocument];
    _pdfView.backgroundColor=[UIColor whiteColor];
    _scrollView=[[UIScrollView alloc]initWithFrame:frame];
    _scrollView.contentSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    _scrollView.delegate=self;
    _scrollView.backgroundColor=[UIColor redColor];
    //设置最大伸缩比例
    _scrollView.maximumZoomScale=5.0;
    //设置最小伸缩比例
    _scrollView.minimumZoomScale=0.5;
    [_scrollView addSubview:_pdfView];
    [self.view addSubview:_scrollView];
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _pdfView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
