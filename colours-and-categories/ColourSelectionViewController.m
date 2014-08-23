
#import <QuartzCore/QuartzCore.h>
#import "ColourSelectionViewController.h"
#import "Constants.h"

@interface ColourSelectionViewController ()

@end

@implementation ColourSelectionViewController

@synthesize paletteChosen;
@synthesize genresArray;
@synthesize genreColoursArray;

@synthesize originalObject;
@synthesize dragObject;
@synthesize touchOffset;
@synthesize homePosition;
@synthesize previousTouchedIndexPath;
@synthesize currentTouchedIndexPath;

@synthesize previousCell;
@synthesize currentCell;

@synthesize previousCellColour;
@synthesize currentCellColour;

@synthesize currentDragMode;

@synthesize genreTableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
        self.genresArray = [[NSMutableArray alloc] initWithObjects:@"classical", @"country", @"electronic", @"folk", @"hiphop", @"jazz", @"pop", @"r+b", @"reggae", @"rock", nil];
        
        self.genreColoursArray = [[NSMutableArray alloc] initWithCapacity:[self.genresArray count]];
        
        for (int i = 0; i < GENRES; i++)
        {
            [self.genreColoursArray insertObject:[UIColor clearColor] atIndex:i];
        }
    }
    return self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Colour Selection"];
    
    self.paletteViews = [[NSMutableArray alloc] initWithCapacity:[paletteChosen count]];
    
    // load colours
    for (int i = 0; i < [paletteChosen count]; i++)
    {
        UIImageView *anImageView = (UIImageView *)[self.view viewWithTag:i+1];
        if (anImageView && [anImageView isMemberOfClass: [UIImageView class]])
        {
            anImageView.backgroundColor = [paletteChosen objectAtIndex:i];
            [self.paletteViews addObject:anImageView];
            
        }

        [self.view addSubview:anImageView];
    }
    
    // define drag object sizes
    
    defaultSecondaryDragObjectSize = CGSizeMake(50, 50);
    defaultPrimaryDragObjectSize = CGSizeMake(77, 77);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
}

- (IBAction)infoButtonPressed:(id)sender
{
    [self showInstructions];
}

-(void) showInstructions
{
    NSString *messageTitle = [NSString stringWithFormat:@"Instructions"];
    NSString *messageLineOne = [NSString stringWithFormat:@"Drag colours from the palette to the genre table."];
    NSString *messageLineTwo = [NSString stringWithFormat:@"Delete a colour-genre association by moving the colour away from the table."];
    NSString *messageLineThree = [NSString stringWithFormat:@"Swap associations by dragging the colour of a genre to the colour of another genre."];
    
    NSString *message = [NSString stringWithFormat:@"%@\n\n%@\n\n%@", messageLineOne, messageLineTwo, messageLineThree];
    
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:messageTitle message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [messageAlert show];
}

- (void)shuffleArray:(NSMutableArray*) arrayToBeShuffled
{
    for (int i = 0; i < [arrayToBeShuffled count]; ++i)
    {
        // Select a random element between i and end of array to swap with.
        int nElements = arrayToBeShuffled.count - i;
        int n = arc4random_uniform(nElements) + i;
        [arrayToBeShuffled exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

- (IBAction)selectRandomColours:(id)sender
{    
    for (int i = 0; i < GENRES; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [genreTableView cellForRowAtIndexPath:indexPath];
        cell.imageView.backgroundColor = [UIColor clearColor];
        [self.genreColoursArray replaceObjectAtIndex:indexPath.row withObject:[UIColor clearColor]];
        
    }
    for (int i = 0; i < [self.paletteViews count]; i++)
    {
        
        UIImageView *palleteViewToBeRestored = [self.paletteViews objectAtIndex:i]; //
        palleteViewToBeRestored.alpha = 1.0;
        
    }
    
    for (int i = 0; i < GENRES; i++)
    {
        int randomIndex = arc4random_uniform([self.paletteViews count]);
        UIImageView *randomView = [self.paletteViews objectAtIndex:randomIndex];
        UIColor *randomColour = randomView.backgroundColor;
        
        if ([genreColoursArray containsObject:randomColour])
        {
            i--;
            continue;
        }
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [genreTableView cellForRowAtIndexPath:indexPath];
        
        cell.imageView.backgroundColor = randomColour;
        
        [self.genreColoursArray replaceObjectAtIndex:i withObject:cell.imageView.backgroundColor];
        
        NSInteger tag = [self.paletteChosen indexOfObject:randomColour];
        UIImageView *selectedPalleteView = [self.paletteViews objectAtIndex:tag];
        selectedPalleteView.alpha = 0.05;
    }
}

- (IBAction)clearAllColours:(id)sender
{
    
    UIAlertView *clearColoursAlert = [[UIAlertView alloc]
                                      initWithTitle:@"Do you really want to delete all colour-genre associations?"
                                      message:nil
                                      delegate:self
                                      cancelButtonTitle:@"No"
                                      otherButtonTitles:@"Yes", nil];
    [clearColoursAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        
        for (int i = 0; i < GENRES; i++)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            UITableViewCell *cell = [genreTableView cellForRowAtIndexPath:indexPath];
            cell.imageView.backgroundColor = [UIColor clearColor];
            [self.genreColoursArray replaceObjectAtIndex:indexPath.row withObject:[UIColor clearColor]];
            
        }
        for (int i = 0; i < [self.paletteViews count]; i++)
        {
            
            UIImageView *palleteViewToBeRestored = [self.paletteViews objectAtIndex:i]; //
            palleteViewToBeRestored.alpha = 1.0;
            
        }
        
        [genreTableView reloadData];
    }
    else
    {
        NSLog(@"Clear cancelled");
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([touches count] == 1)
    {
        // one finger
        CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
        for (UIImageView *iView in self.view.subviews)
        {
            if ([iView isMemberOfClass:[UIImageView class]])
            {
                if (CGRectContainsPoint(iView.frame, touchPoint))
                {
                    if ([self.genreColoursArray containsObject: iView.backgroundColor])
                    {
                        NSString *messageBody = [NSString stringWithFormat:@"Please use the table to assign the colour to a different genre or unselect it."];
                        UIAlertView *messageAlert = [[UIAlertView alloc]
                                                     initWithTitle:@"This colour has been already selected." message:messageBody delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                        [messageAlert show];
                        
                    }
                    else
                    {
                        
                        self.dragObject = iView;
                        self.touchOffset = CGPointMake(touchPoint.x - iView.frame.origin.x,
                                                       touchPoint.y - iView.frame.origin.y);
                        self.homePosition = CGPointMake(iView.frame.origin.x,
                                                        iView.frame.origin.y);
                        
                        [self.view bringSubviewToFront:self.dragObject];
                        
                    }
                }
            }
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    CGRect newDragObjectFrame;
    newDragObjectFrame = CGRectMake(touchPoint.x - touchOffset.x,
                                    touchPoint.y - touchOffset.y,
                                    defaultSecondaryDragObjectSize.width,
                                    defaultSecondaryDragObjectSize.height);
    
    self.dragObject.frame = newDragObjectFrame;
    self.dragObject.alpha = 0.5;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.dragObject != nil)
    {
        
        CGPoint touchPoint = [[touches anyObject] locationInView:self.genreTableView];
        NSIndexPath *touchedIndexPath = [self.genreTableView indexPathForRowAtPoint:touchPoint];
        UITableViewCell *cell = [self.genreTableView cellForRowAtIndexPath:touchedIndexPath];
        
        if (cell != nil)
        {
            if (cell.imageView.backgroundColor == [UIColor clearColor])
            {
                cell.imageView.backgroundColor = self.dragObject.backgroundColor;
                self.dragObject.frame = CGRectMake(self.homePosition.x, self.homePosition.y, defaultPrimaryDragObjectSize.width, defaultPrimaryDragObjectSize.height);
                self.dragObject.alpha = 0.05;
                [self.genreColoursArray replaceObjectAtIndex:touchedIndexPath.row withObject:cell.imageView.backgroundColor];
            }
            else
            {
                UIColor *currentColor = cell.imageView.backgroundColor;
                NSInteger tag = [self.paletteChosen indexOfObject:currentColor];
                UIImageView *unselectedPalleteView = [self.paletteViews objectAtIndex:tag];
                unselectedPalleteView.alpha = 1.0;
                
                cell.imageView.backgroundColor = self.dragObject.backgroundColor;
                
                [self.genreColoursArray replaceObjectAtIndex:touchedIndexPath.row withObject:cell.imageView.backgroundColor];
                
                self.dragObject.frame = CGRectMake(self.homePosition.x, self.homePosition.y, defaultPrimaryDragObjectSize.width, defaultPrimaryDragObjectSize.height);
                
                self.dragObject.alpha = 0.05;
            }
        }
        else
        {
            self.dragObject.frame = CGRectMake(self.homePosition.x, self.homePosition.y, defaultPrimaryDragObjectSize.width, defaultPrimaryDragObjectSize.height);
            
            self.dragObject.alpha = 1;
        }
        dragObject = nil;
    }
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        CGPoint touchPoint = [sender locationInView:self.genreTableView];
        CGPoint otherPoint = [sender locationInView:self.view];
        
        previousTouchedIndexPath = [self.genreTableView indexPathForRowAtPoint:touchPoint];
        previousCell = [self.genreTableView cellForRowAtIndexPath:previousTouchedIndexPath];
        
        if ((previousCell !=nil) && (previousCell.imageView.backgroundColor != [UIColor clearColor]))
        {
            previousCellColour = previousCell.imageView.backgroundColor;
            if ([self.genreColoursArray containsObject: previousCellColour])
            {
                self.dragObject = [[UIImageView alloc] initWithFrame:CGRectMake(otherPoint.x - 16, otherPoint.y - 16, 32, 32)];
                self.dragObject.backgroundColor = previousCellColour;
                self.dragObject.alpha = 0.5;
                [self.view addSubview:dragObject];
                currentDragMode = 0;
            }
        }
        else
        {
            currentDragMode = -1;
        }
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
        CGPoint touchPoint = [sender locationInView:self.view];
        if (currentDragMode == 0)
        {
            if (self.dragObject != nil)
            {
                self.dragObject.center = touchPoint;
                self.dragObject.alpha = 0.5;
            }
        }
    }
    else if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint touchPoint = [sender locationInView:self.genreTableView];
        
        currentTouchedIndexPath = [self.genreTableView indexPathForRowAtPoint:touchPoint];
        currentCell = [self.genreTableView cellForRowAtIndexPath:currentTouchedIndexPath];
        
        if (currentCell != nil)
        {
            if (currentDragMode == 0)
            {
                currentCellColour = currentCell.imageView.backgroundColor;
                if ([self.genreColoursArray containsObject:currentCellColour])
                {
                    previousCell.imageView.backgroundColor = currentCellColour;
                    currentCell.imageView.backgroundColor = previousCellColour;
                    [self.genreColoursArray replaceObjectAtIndex:previousTouchedIndexPath.row withObject:currentCellColour];
                    [self.genreColoursArray replaceObjectAtIndex:currentTouchedIndexPath.row withObject:previousCellColour];
                }
                else
                {
                    previousCell.imageView.backgroundColor = [UIColor clearColor];
                    currentCell.imageView.backgroundColor = previousCellColour;
                    [self.genreColoursArray replaceObjectAtIndex:previousTouchedIndexPath.row withObject:[UIColor clearColor]];
                    [self.genreColoursArray replaceObjectAtIndex:currentTouchedIndexPath.row withObject:previousCellColour];
                }
            }
        }
        else
        {
            if (currentDragMode == 0)
            {
                UIColor *currentColor = previousCell.imageView.backgroundColor;
                NSInteger tag = [self.paletteChosen indexOfObject:currentColor];
                UIImageView *unselectedPalleteView = [self.paletteViews objectAtIndex:tag];
                unselectedPalleteView.alpha = 1.0;
                previousCell.imageView.backgroundColor = [UIColor clearColor];
                [self.genreColoursArray replaceObjectAtIndex:previousTouchedIndexPath.row withObject:[UIColor clearColor]];
            }
        }
        [self.dragObject removeFromSuperview];
        self.dragObject = nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"genres";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return GENRES;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *genreTableViewIdentifier = @"genreList";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:genreTableViewIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:genreTableViewIdentifier];
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor]; 
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    cell.imageView.image = [UIImage imageNamed:@"blank-40.png"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if ([self.genresArray count] != 0)
    {
        cell.textLabel.text = [self.genresArray objectAtIndex: indexPath.row];
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:14.0];
        cell.imageView.backgroundColor = [UIColor clearColor];
    }
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    panGesture.delaysTouchesBegan = YES;
    panGesture.cancelsTouchesInView = YES;
    [cell addGestureRecognizer:panGesture];
    
    return cell;        
}

@end
