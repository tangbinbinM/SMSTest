//
//  ViewController.m
//  SMS短信验证
//
//  Created by apple-jd18 on 15/12/8.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import <SMS_SDK/SMSSDK.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFile;
@property (weak, nonatomic) IBOutlet UITextField *PhtextFile;


@end

@implementation ViewController
//短信验证码
- (IBAction)getSmsCode:(id)sender {
    //  zone 国家代码  86代表中国
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_PhtextFile.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error) {
            NSLog(@"error %@", error);
        }else{
            NSLog(@"验证码发送成功");
        }
    }];
}
//语音验证码
- (IBAction)getVoiceCode:(id)sender {
    //  zone 国家代码  86代表中国
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodVoice phoneNumber:_PhtextFile.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (error) {
            NSLog(@"error %@", error);
        }else{
            NSLog(@"验证码发送成功");
        }
    }];
}
//验证码校验
- (IBAction)validCode:(id)sender {
    [SMSSDK commitVerificationCode:_textFile.text phoneNumber:_PhtextFile.text zone:@"86" result:^(NSError *error) {
        if (error) {
            NSLog(@"验证码不正确 %@", error);
        }else{
            NSLog(@"验证码正确");
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
