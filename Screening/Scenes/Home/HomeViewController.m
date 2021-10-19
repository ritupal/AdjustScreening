//
//  HomeViewController.m
//  Screening
//
//  Created by Kumari Ritu Pal on 19/10/21.
//

#import "HomeViewController.h"
#import "EventViewModel.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *postEventButton;
@property (nonatomic, strong) EventViewModel *viewModel;

@end

@implementation HomeViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[EventViewModel alloc] init];
    }
    return self;
}

#pragma mark - View LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.postEventButton.layer setCornerRadius:4.0];
}

- (void)postSeconds:(NSString *)seconds {
    __weak HomeViewController *weakSelf = self;
    
    [self.viewModel postEvent:seconds WithSuccess:^(Event * _Nonnull event) {
        NSLog(@"Event Id %@", event.eventId);
        NSLog(@"Event seconds %@", event.seconds);
    } error:^(NSError * _Nonnull error) {
        NSLog(@"Error %@", error);
    }];
}

- (IBAction)postEvent:(id)sender {
    NSString *sec = [self.viewModel getCurrentSeconds];
    NSLog(@"Sec %@", sec);
    [self postSeconds: sec];
}

@end
