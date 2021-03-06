//
//  main.m
//  EKAlgorithms
//
//  Created by Evgeny Karkan on 11.08.13.
//  Copyright (c) 2013 EvgenyKarkan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+EKStuff.h"
#import "NSNumber+EKStuff.h"
#import "NSString+EKStuff.h"
#import "EKStack.h"
#import "EKQueue.h"
#import "EKDeque.h"
#import "EKVertex.h"
#import "EKGraph.h"
#import "EKLinkedList.h"
#import "EKNode.h"
#import "EKBSTree.h"

int main(int argc, const char *argv[])
{
	@autoreleasepool {
        //Linear search
		NSLog(@"Linear search result: %li", (long)[@[@6, @9, @12, @13, @14, @29, @42] indexOfObjectViaLinearSearch:@42]);

        //Binary search
		NSLog(@"Binary search result: %li", (long)[@[@6, @9, @12, @13, @14, @29, @42] indexOfObjectViaBinarySearch:@42]);

        //Init array with 5 random elements
		NSMutableArray *array = [NSMutableArray array];
		for (int i = 0; i < 5; i++) {
			[array addObject:[NSNumber numberWithInt:arc4random() % 20]];
		}

        //Max element of array
		NSLog(@"Max element of created array %@ equals to %@ and stored at index %li", [array debugDescription],
		      [array objectAtIndex:(long)[array indexOfMaximumElement]],
		      (long)[array indexOfMaximumElement]);

        //Get the Max and Min Simultaneously.
        NSArray *indexes = [array indexesOfMinimumAndMaximumElements];
		NSLog(@"Min and max elements of created array %@ equal to %@ and %@ and stored at indexes: %@ %@", [array debugDescription], [array objectAtIndex:[[indexes firstObject] unsignedIntegerValue]], [array objectAtIndex:[[indexes lastObject] unsignedIntegerValue]],
		      [indexes firstObject], [indexes lastObject]);

        //Bubble sort
		NSLog(@"Bubble sorted array is: %@", [array bubbleSortedArray]);

        //Shell sort
		NSLog(@"Shell sorted array is %@", [@[@2, @45, @8, @1, @27, @16, @5.3, @ - 53.7] shellSortedArray]);

        //Merge sort
		NSLog(@"Merge sorted array %@", [@[@21, @45, @87, @10, @273, @616, @0.2, @ - 0.52] mergeSortedArray]);

        //Quick sort numbers
		NSLog(@"Quick sorted array %@", [@[@2.1, @405, @817, @10, @2732, @616, @0.2, @ - 0.52] quickSortedArrayWithLeftIndex:0
                                                                                                              withRightIndex:[[NSMutableArray arrayWithArray:@[@21, @45, @87, @10, @273, @616, @0.2, @ - 0.52]] count] - 1]);

        //Insertion sort
		NSLog(@"Insertion sorted array %@", [@[@ -23.0154, @46, @0.021, @42, @5, @NO, @YES] insertionSortedArray]);

        //Selection sort
		NSLog(@"Selection sorted array  %@", [@[@160, @0.097, @NO, @89, @ -61.001256, @7.5, @YES] selectionSortedArray]);

        //Heap sort
        NSLog(@"Heap sorted array --> %@", [@[@9871523, @0.0987516, @NO, @89, @ -61.001256, @712.5, @YES, @384756] heapSortedArray]);



        //Palindrome string
		NSLog(@"Palindrome? Answer:%@", [@"Was it a car or a cat I saw" isPalindrome] ? @"YES" : @"NO");

		NSLog(@"Palindrome? Answer:%@", [@"wasitacaroracatisaw" isPalindrome] ? @"YES" : @"NO");

        //Reverse
        NSLog(@"Reverse is: %@", [@"Lorem ipsum dolor" reversedString]);

        //Count words
        NSLog(@"Words # %lu", (unsigned long)[@"fgf fgfdgfdg dfgfdgfd dfgfdgfd dfg" numberOfWordsInString]);

        //Permutations
        char a[] = "ABC";
        [NSString allPermutationsOfCString:a withFirstCharacterPosition:0 lastCharacterPosition:2];

        //Count each letter occurence in string
        [@"Hello World" countEachCharacterOccurrenceInString];

        //Needles in haystack
        NSLog(@"Needle %lu", (unsigned long)[@"Foo is a bar with foo bar foo" numberOfOccurrenciesOfString:@"foo"]);

        //Random string
        NSLog(@"Random string %@", [NSString randomStringWithLength:100]);

        //Concat
        NSLog(@"Concat string is --> %@", [@"Hello" concatenateWithString:@"World!"]);

        //First occurance of needle in a haystack
        NSLog(@"Index is --> %ld", (long)[@"Lorem ipsum dolor sit amet lorem ipsum" indexOfFirstOccurrenceOfNeedle:@"em"]);

        //Last occurance of needle in a haystack
        NSLog(@"Index is --> %ld", (long)[@"Lorem ipsum dolor sit amet lorem ipsum" indexOfLastOccurrenceOfNeedle:@"or"]);

        //Longest common sequence
        NSLog(@"Longest common sequence of abcdbceea and cabdefga is --> %@",[@"abcdbceea" LCS_WithString:@"cabdefga"]);

        //Levenshtein Distance
        NSLog(@"Levenshtein Distance of levenshtein and meilenstein is --> %ld",(long)[@"levenshtein" LD_WithString:@"meilenstein"]);

        //Longest string from array
		NSLog(@"The longest string is %@", [@[@"Kiev", @"Moscow", @"Tokyo", @"Saint-Petersburg", @"SanFrancisco"] longestString]);

        //Shortest string from array
		NSLog(@"The shortest string is %@", [@[@"DRY", @"KISS", @"YAGNI", @"SOLID", @"GRASP"] shortestString]);

        //Reverse of array
        NSLog(@"Reversed array is %@", [@[@"one", @"two", @"three", @"four", @"five"] reversedArray]);

        //Intersection of two arrays
        NSLog(@"Intersection is %@", [@[@"one", @"two", @"three"] intersectionWithArray:@[@"two", @"three", @"four"]]);

        //Union of two arrays
        NSLog(@"Union is %@", [@[@"Honda", @"Toyota"] unionWithoutDuplicatesWithArray:@[@"Toyota", @"Alfa Romeo"]]);

        //Find duplicates
        NSLog(@"Result of finding duplicates is %@", [@[@"foo", @"bar", @"buzz", @"foo"] hasDuplicates] ? @"YES" : @"NO");

        //Random object
        NSLog(@"Random array %@", [NSArray randomObjectsWithArraySize:5 maxRandomValue:6 uniqueObjects:YES]);

        //Is sorted check
        NSLog(@"Given array sorted? --> %@", [@[@1.1, @1.5, @1.9, @2.5, @3, @4, @4] isSorted] ? @"YES" : @"NO");

        // Array Shuffle (Fisher–Yates)
        NSLog(@"Array Shuffle of array: %@ is: %@", array, [array shuffledArray]);
        
        //Sum of elements in array
        NSLog(@"Sum is --> %@", [@[@-5, @-5, @-5, @-5, @-5] sumOfElements]);

        
        //Sieve of Eratosf
		NSLog(@"Primes from sieve %@", [[NSNumber primeNumbersFromSieveEratosthenesWithMaxNumber:42] description]);

        //GCD
		NSLog(@"Greatest common divisor of two numbers is %lu", (unsigned long)[@42 greatestCommonDivisorWithNumber:84]);

        //LCM
		NSLog(@"Least common multiple of two numbers is %lu", [@16 leastCommonMultipleWithNumber:20]);

        //Swap integer pointers without using a third element

        NSInteger intValue1 = 12, intValue2 = 21;
        NSLog(@"Integer values before swap: %ld, %ld", (long)intValue1, (long)intValue2);
        [NSNumber swapValueOfIntPointer:&intValue1 withValueOfIntPointer:&intValue2];
        NSLog(@"Integer values after swap: %ld, %ld", (long)intValue1, (long)intValue2);

        //Factorial
		NSLog(@"Factorial is %llu", (unsigned long long)[@3 factorial]);

        //Fibonacci numbers
		NSLog(@"Fibonacci series is %@", [NSNumber fibonacciNumbersUpToNumber:15]);

        for (int i = 298; i < 300; i++) {
            NSLog(@"Fibonacci at index %i: %@", i, [NSNumber fibonacciAtIndex:i]); //limited by 92
            NSLog(@"Fibonacci at index %i: %@", i, [NSNumber fibonacciWithDecimal:i]);
        }

        //Find sum of digits
        NSLog(@"Sum of digits is: %lu", (unsigned long)[@1234 sumOfDigits]);

        //Binary to decimal convertion
        NSLog(@"Decimal is: %lu", (unsigned long)[NSNumber decimalNumberFromBinary:1101]);

        //Decimal to binary
        NSLog(@"Binary is %lu", (unsigned long)[NSNumber binaryNumberFromDecimal:3]);

        //Fast Exp
        NSLog(@"Fast exp %ld", (long)[NSNumber fastExpForNumber:2 withPower:10]);

        //Number reverse
        NSLog(@"Reversed number is %li", (long)[@123456789 reverseNumber]);

        //Even/Odd
        NSLog(@"Given number even? - %@", [@1234567 isEven] ? @"YES" : @"NO");

        //Leap year check
        NSLog(@"Is given year leap? - %@", [@2000 isLeapGivenYear] ? @"YES" : @"NO");

        //Armstrong number check
        NSLog(@"Is given number Armstrong? --> %@", [@407 isArmstrongNumber] ? @"YES" : @"NO");

        //Prime Number Check
        NSLog(@"Is given number Prime? --> %@", [@23 isPrime] ? @"YES" : @"NO");

        //Nth prime
        NSLog(@"Nth prime is --> %lu", (unsigned long)[NSNumber nthPrime:101]);

        //Square root
        NSLog(@"Square root is --> %f", [@-144.0 squareRoot]);
        NSLog(@"Square root is --> %f", [@2.0 squareRoot]);

        //Convertion to another numeral system
        NSLog(@"Converted number is --> %@", [@42 convertedNumberWithBase:2]);


        //Stack
		EKStack *stack = [[EKStack alloc] initWithSize:3];
		[stack push:@"Hello"];
		[stack push:@"World"];
		[stack push:@"Programming is fun!"];
		NSLog(@"All objects from stack %@", [stack allObjectsFromStack]);
		[stack popLastObject];
		NSLog(@"All objects from stack after POP %@", [stack allObjectsFromStack]);
		NSLog(@"PEEK %@", [stack peek]);

        //Queue
		EKQueue *queue = [[EKQueue alloc] init];
		[queue insertObject:@"Foo"];
		[queue insertObject:@"Bar"];
		[queue insertObject:@"HakunaMatata"];
		NSLog(@"All objects from queue %@", [queue allObjectsFromQueue]);
		[queue removeFirstObject];
		NSLog(@"All objects from queue after REMOVE %@", [queue allObjectsFromQueue]);
		NSLog(@"PEEK object %@", [queue peek]);

        //Deque
		EKDeque *deque = [[EKDeque alloc] init];
		[deque insertObjectToFront:@"Foo"];
		[deque insertObjectToFront:@"Bar"];
		NSLog(@"All objects from deque %@", [deque allObjectsFromDeque]);
		[deque insertObjectToBack:@"Hi"];
		NSLog(@"All objects from deque %@", [deque allObjectsFromDeque]);
		NSLog(@"PEEK first object %@", [deque peekFirstObject]);
		[deque removeFirstObject];
		NSLog(@"All objects from deque %@", [deque allObjectsFromDeque]);
		NSLog(@"PEEK last object %@", [deque peekLastObject]);
		[deque removeLastObject];
		NSLog(@"All objects from deque %@", [deque allObjectsFromDeque]);

        //Graph stuff

        //DFS
        //Init vertices
        EKVertex *aV = [[EKVertex alloc] init]; //this is a start vertex
        aV.label = @"A vertex";

        EKVertex *bV = [[EKVertex alloc] init];
        bV.label = @"B vertex";

        EKVertex *cV = [[EKVertex alloc] init];
        cV.label = @"C vertex";

        EKVertex *dV = [[EKVertex alloc] init];
        dV.label = @"D vertex";

        EKVertex *eV = [[EKVertex alloc] init];
        eV.label = @"E vertex";

        EKVertex *fV = [[EKVertex alloc] init];
        fV.label = @"F vertex";

        EKVertex *gV = [[EKVertex alloc] init];
        gV.label = @"G vertex";

        //Set adjacent vertices
		aV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:bV, eV, fV, nil];
        bV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:aV, cV, nil];
        cV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:bV, dV, nil];
        dV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:cV, nil];
        eV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:aV, nil];
        fV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:aV, gV, nil];
        gV.adjacentVertices = [[NSMutableSet alloc] initWithObjects:fV, nil];

        //Init graph (see EKGraphPicture.png)
        EKGraph *graph = [[EKGraph alloc] initWithStartVertex:aV];
        graph.vertices = [@[aV,bV,cV,dV,eV,fV,gV] mutableCopy];
        [graph depthFirstSearch];

        //BFS
        [graph breadthFirstSearch];

        //Linked list stuff
		EKLinkedList *list = [[EKLinkedList alloc] initWithHead:@5];
		[list addToFront:@7];
		[list addToFront:@9];
		[list addToFront:@11];
		[list addToFront:@13];
		[list addToFront:@15];

		NSLog(@"Head is %@", list.head.value);
		NSLog(@"Nodes in list - %lu", (unsigned long)[list count]);

		[list printList];
		[list removeObjectAtIndex:3];

		NSLog(@"Nodes in list after remove - %lu", (unsigned long)[list count]);
		[list printList];

        //BST stuff
        EKBSTree *tree = [[EKBSTree alloc] initWithObject:@4 compareSelector:@selector(compare:)];
        [tree insertObject:@9];
        [tree insertObject:@2];
        [tree insertObject:@10];
        [tree insertObject:@7];
        [tree insertObject:@-5];
        [tree insertObject:@-1];
        [tree insertObject:@2.5f];
        [tree insertObject:@-5.5f];

        [tree printDescription]; // see EKBSTree.png picture

    }

	return 0;
}
