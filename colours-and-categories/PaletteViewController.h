
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface PaletteViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *allPalettes;
@property (strong, nonatomic) NSMutableArray *paletteChosen;

- (IBAction)paletteButtonPressed:(id)sender;

@end