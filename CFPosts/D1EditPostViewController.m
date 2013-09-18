//
//  D1EditPostViewController.m
//  CFPosts
//
//  Created by Brad on 9/11/13.
//  Copyright (c) 2013 Brad. All rights reserved.
//

#import "D1EditPostViewController.h"

@interface D1EditPostViewController ()

@property (nonatomic,strong) NSArray *enteredData;

@end

@implementation D1EditPostViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self)
    {
        [self receivePostData:self.editPost];
        
    }
        
    
}

-(void)receivePostData:(Post *)myPost
{
    
    self.userNameTextField.text = myPost.userName;
    self.titleTextField.text = myPost.title;
    self.contentTextField.text = myPost.body;
    //self.timeStampTextField.text = myPost.timeStamp;
    
}

- (IBAction)savePressed:(id)sender
{
    
    _editPost.title =self.titleTextField.text;
    _editPost.userName =self.userNameTextField.text;
    _editPost.body =self.contentTextField.text;
    //editedPost.timeStamp =self.timeStampTextField.text;
    
    if([self.delegate respondsToSelector:@selector(saveEditedPost:OnCell:)])
    {
        [self.delegate saveEditedPost:_editPost OnCell:self.collectionCellNumber];
        
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)deletePressed:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(deletePost:WithCellNumber:)])
    {
        [self.delegate deletePost:self.editPost WithCellNumber:self.collectionCellNumber];
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];    
}

- (IBAction)timePressed
{
    D1TimeDataSourceObject *timeDataSource = [[D1TimeDataSourceObject alloc]init];
    
    self.timeStampTextField.text = [NSString stringWithFormat:@" %@", [timeDataSource grabCurrentTime]];
    
    
}
@end
