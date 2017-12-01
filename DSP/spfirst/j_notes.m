% vectors for the melody notes and durations
treble = [-1 47 49  51 54 52  52 56 54    54 59 58  59 54 51  47 49 51 ...
	  52 54 56  54 52 51  49 51 47    46 47 49  42 46 49  52 51 49 ...
	  51 47 49  51 54 52  52 56 54    54 59 58  59 54 51  47 49 51 ...
	  44 54 52  51 49 47  42 47 46    47 51 54  59 54 51  47       ...
          51 52   54 54   52 51 ...
          49 42 44  46 49 47  49 52 51    52 49 46  42 46 49  52 51 49 ...
          51 52   54 51   49 51 52 51 49  47 51 49  51 54 52  52 56 54];
tdur = 	 [(1/3)*ones(1,69), 1 2 1 2 1 2 1 (1/3)*ones(1,18) 2 1 2 1 ...
	  1-(1/16) (1/16) (1/16) 1-(1/16) 1 (1/3)*ones(1,9)];

% vectors for the 1st bass line notes and durations
bass1 =  [-1 42 35   35 39 -1   40 35 32   37 34 -1   42 35 32   35 39 39 ...
	  35 35 37   39 39 35 39   42 34 35   37 35 34   35 37 42 ...
	  34 37 40   34 40 37   42 34 35   35 30 35   32 35 34   39 35 32];
b1dur =  [ones(1,21) 2 (1/3) (1/3) (1/3) ones(1,27)];

% vectors for the 2nd bass line notes and durations
bass2 =  [35 35 32   27 32 32   37 27 28   30 -1 30   35 32 28   27 32 30 ...
	  28 29 30   35 -1      35 -1 32   34 32 30   32 34 35   30 -1 -1 ...
	  30 -1 -1   35 -1 32   27 -1 32   28 30 30   35 32 28];
b2dur =  [ones(1,21) 2 ones(1,28)];

% vectors for the 3rd bass line notes and durations
bass3 = [-1 40 -1 40 -1];
b3dur = [20  1 26  1 3];  

% special thanks to Brian Patrick Towles for providing the file upon which
% this was based