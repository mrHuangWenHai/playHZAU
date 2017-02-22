//
//  photoViewController.m
//  玩转华农APP
//
//  Created by 黄文海 on 16/3/31.
//  Copyright © 2016年 huang. All rights reserved.
//

#import "photoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "head.h"
#import "cutImageView.h"
@interface photoViewController()<UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    
}
@property(nonatomic,strong)UIImagePickerController*pickerViewControll;
@property(nonatomic,strong)cutImageView*cut;
@end

@implementation photoViewController
-(instancetype)init{
    if(self=[super init])
    {
        self.title=@"取照片";
    }
    
    return self;
}

-(void)viewDidLoad{
    self.view.backgroundColor=[UIColor whiteColor];
    self.pickerViewControll=[[UIImagePickerController alloc] init];
    _pickerViewControll.delegate=self;
    
    UIBarButtonItem*rightButton=[[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(popPhotoView)];
    rightButton.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=rightButton;
    
    if([self.typePhoto isEqualToString:@"1"])
    {
        [self selectPhotoInLibrary];
    }
    else{
        [self takePhoto];
    }
    self.cut=[[cutImageView alloc] initWithFrame:self.view.bounds];
    _cut.delegate=self;
    
    

}

-(void)selectPhotoInLibrary{
    _pickerViewControll.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    _pickerViewControll.view.frame=CGRectMake(0, 0, appWide,appHight);
    [self addChildViewController:_pickerViewControll];
    [self.view addSubview:_pickerViewControll.view];
   
}

-(void)takePhoto{
    _pickerViewControll.sourceType=UIImagePickerControllerSourceTypeCamera;
    _pickerViewControll.cameraCaptureMode=UIImagePickerControllerCameraCaptureModePhoto;
    _pickerViewControll.cameraDevice=UIImagePickerControllerCameraDeviceRear;
    _pickerViewControll.cameraDevice=UIImagePickerControllerCameraDeviceFront;
    _pickerViewControll.allowsEditing=YES;
}

-(void)popPhotoView{
    [_pickerViewControll removeFromParentViewController];
    [_pickerViewControll.view removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage*image=nil;
    NSString*mediaType=[info objectForKey:UIImagePickerControllerMediaType];
    if([mediaType isEqualToString:(NSString*)kUTTypeImage]&&picker.sourceType==UIImagePickerControllerSourceTypeCamera)
    {
        image=[info objectForKey:UIImagePickerControllerEditedImage];
    }
    else{
        image=[info objectForKey:UIImagePickerControllerOriginalImage];
    }
    NSLog(@"%@",info);
    [_cut setUpImage:image];
    [self.view addSubview:_cut];
}

-(void)finshImage:(UIImage*)image{
    NSLog(@"huanghuanghuang");
    [_cut removeFromSuperview];
    _myblock(image);

    [_pickerViewControll removeFromParentViewController];
    [_pickerViewControll.view removeFromSuperview];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
