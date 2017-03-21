//
//  ViewController.m
//  Demo01-PlayAudio
//
//  Created by tarena on 15-7-29.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

//音效属性
@property (nonatomic, assign) SystemSoundID SystemSoundID;

//音频属性
@property (nonatomic, strong) AVAudioPlayer *Player;

@end

@implementation ViewController

//懒加载初始化音频播放对象
- (AVAudioPlayer *)player {
    if (!_Player) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"AllOfMe.mp3" withExtension:nil];
        _Player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }

    return _Player;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)playShortAudio:(id)sender {

    //1.获取音效的文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"audio1" ofType:@"wav"];
    NSURL *url = [NSURL fileURLWithPath:filePath];

    //2.创建system sound id
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)(url), &_SystemSoundID);

    //3.播放音效
    AudioServicesPlaySystemSound(_SystemSoundID);
}

- (IBAction)playAudio:(id)sender {
    //播放mp3
    [self.Player play];

}

- (IBAction)pauseAudio:(id)sender {
    if (self.Player.playing) {
        //暂停
        [self.Player pause];
    }
}

- (IBAction)cancelAudio:(id)sender {
    [self.Player stop];

    self.Player = nil;
}






@end
