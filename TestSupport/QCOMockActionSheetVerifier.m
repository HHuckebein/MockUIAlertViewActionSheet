//  MockUIAlertViewActionSheet by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 Jonathan M. Reid. See LICENSE.txt

#import "QCOMockActionSheetVerifier.h"

#import "QCOMockActionSheet.h"


@implementation QCOMockActionSheetVerifier

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(actionSheetShown:)
                                                     name:QCOMockActionSheetShowNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)actionSheetShown:(NSNotification *)notification
{
    QCOMockActionSheet *alert = [notification object];
    self.showCount += 1;
	self.parentView = alert.parentView;
	self.title = alert.title;
	self.delegate = alert.delegate;
	self.cancelButtonTitle = alert.cancelButtonTitle;
	self.destructiveButtonTitle = alert.destructiveButtonTitle;
    self.otherButtonTitles = alert.otherButtonTitles;
    self.actionSheetStyle = alert.actionSheetStyle;
}

@end
