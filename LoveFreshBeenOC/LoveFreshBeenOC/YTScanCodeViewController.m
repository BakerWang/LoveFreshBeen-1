//
//  YTScanCodeViewController.m
//  LoveFreshBeenOC
//
//  Created by youyou on 16/3/16.
//  Copyright © 2016年 youyou. All rights reserved.
//

#import "YTScanCodeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface YTScanCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>

// 会话
@property (nonatomic, strong) AVCaptureSession *session;
// 扫描线
@property (nonatomic, strong) CALayer *scanLayer;
// 扫描框
@property (nonatomic, weak) UIView *boxView;
/// 保存二维码结果
@property (nonatomic, copy) NSString *string;

@end

@implementation YTScanCodeViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //判断相机是否可用
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if(status == AVAuthorizationStatusAuthorized) {
    
    }else if(status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if(granted) {
                NSLog(@"允许");
            }else {
                NSLog(@"不允许");
            }
        }];
    }
    ////1.初始化捕捉设备（AVCaptureDevice），类型为AVMediaTypeVideo
    AVCaptureDevice *devices = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError *error;
    
    //用captureDevice创建输入流
    AVCaptureDeviceInput *input = [[AVCaptureDeviceInput alloc]initWithDevice:devices error:&error];
    if(input == nil) {
        return;
    }
    //输出
    AVCaptureMetadataOutput *outPut = [[AVCaptureMetadataOutput alloc]init];
    
    dispatch_queue_t dispathQueue = dispatch_queue_create("myQueue", NULL);
    
    [outPut setMetadataObjectsDelegate:self queue:dispathQueue];
    
    AVCaptureSession *session = [[AVCaptureSession alloc]init];
    self.session = session;
    
    //将输入输出对象添加到会话
    if([session canAddInput:input]) {
        [session addInput:input];
    }
    if([session canAddOutput:outPut]) {
        [session addOutput:outPut];
    }
    //设置输出媒体数据类型为QRCode
    [outPut setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    //创建预览图层
    AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:session];
    preview.frame  = self.view.bounds;
    [self.view.layer insertSublayer:preview atIndex:0];
    
    // 9.设置扫面范围
    outPut.rectOfInterest = CGRectMake(0.2, 0.18, 0.6, 0.5);
    
    // 10.设置扫描框
    UIView *boxView = [[UIView alloc] initWithFrame:CGRectMake(0.2 * self.view.frame.size.width, 0.18 * self.view.frame.size.height, 0.6 * self.view.frame.size.width, 0.5 * self.view.frame.size.height)];
    self.boxView = boxView;
    
    
    boxView.layer.borderColor = [UIColor yellowColor].CGColor;
    boxView.layer.borderWidth = 3;
    
    [self.view addSubview:boxView];
    
    // 设置扫描线
    CALayer *scanLayer = [[CALayer alloc] init];
    self.scanLayer = scanLayer;
    
    scanLayer.frame = CGRectMake(0, 0, boxView.bounds.size.width, 2);
    scanLayer.backgroundColor = [UIColor redColor].CGColor;
    [boxView.layer addSublayer:scanLayer];
    
    // 开始扫描
    [session startRunning];
        // Do any additional setup after loading the view.
}
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    if (metadataObjects != nil && [metadataObjects count] > 0) {
        AVMetadataMachineReadableCodeObject *metadataObj = [metadataObjects objectAtIndex:0];
        //判断回传的数据类型
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode]) {
//            [_lblStatus performSelectorOnMainThread:@selector(setText:) withObject:[metadataObj stringValue] waitUntilDone:NO];
            [self performSelectorOnMainThread:@selector(stopReading) withObject:nil waitUntilDone:NO];
//            _isReading = NO;
        }
    }
    
    
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
