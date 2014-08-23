
#import <UIKit/UIKit.h>

@interface ColourSelectionViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate, UIAlertViewDelegate>
{
    BOOL primaryIsBeingDragged;
    CGSize defaultPrimaryDragObjectSize;
    CGSize defaultSecondaryDragObjectSize;
}

@property (strong, nonatomic) NSMutableArray *paletteChosen;
@property (strong, nonatomic) NSMutableArray *genresArray;
@property (strong, nonatomic) NSMutableArray *genreColoursArray;
@property (weak, nonatomic) IBOutlet UITableView *genreTableView;

@property (strong, nonatomic) NSIndexPath *previousTouchedIndexPath;
@property (strong, nonatomic) NSIndexPath *currentTouchedIndexPath;

@property (strong, nonatomic) UITableViewCell *previousCell;
@property (strong, nonatomic) UITableViewCell *currentCell;

@property (nonatomic, strong) UIColor *previousCellColour;
@property (nonatomic, strong) UIColor *currentCellColour;

@property (nonatomic) int currentDragMode;

@property (nonatomic, strong) UIImageView *originalObject;
@property (nonatomic, strong) UIImageView *dragObject;
@property (nonatomic, assign) CGPoint touchOffset;
@property (nonatomic, assign) CGPoint homePosition;

@property (nonatomic, strong) NSMutableArray *paletteViews;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (IBAction)infoButtonPressed:(id)sender;

@end
