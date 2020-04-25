-- Question 1 (maxlist)--

max_list :: [Int] -> Int
max_list [x] = x
max_list (x:xs)
 | (max_list xs) > x = max_list xs
 | otherwise = x

-- Question 2 (delete kth)--

delete :: Int->[Int]->[Int]
deletek::[Int] ->Int->Int ->[Int]
delete n [] = []
delete n (x:xs) = deletek (x:xs) n 1
deletek [] n ys=[]
deletek (x:xs) y ys
           | y<0 = error "Enter positive value"
           | y==0 = x:xs
           | mod ys y == 0   = []  ++ deletek xs y (ys+1)
           | mod ys y /= 0   = [x]  ++ deletek xs y (ys+1)

-- Question 3 (isort)--

combine :: Int->[Int]->[Int]
combine x[]=[x]
combine x(y:ys)
	| x>y = y:(combine x ys)
	| otherwise  =x:y:ys
isort::[Int]->[Int]
isort [] =[]
isort(x:xs)= (combine x (isort xs))


-- Question 4 (rotate n)--

rotate :: Int -> [Int] -> [Int]
rotate n xs = drop k xs ++ take k xs
 where k = length xs - n


-- Question 5 (single lt)--

single_lt :: [Int] -> [[Int]]
single_lt [] = []
single_lt(x:xs) = [[x]] ++ single_lt(xs)


-- Question 6 (double lt)--

double_lt :: [Int] -> [Int]
double_lt [] = []
double_lt [x] = [2 * x]
double_lt (x:y:xs) = (2*x):y:(double_lt xs)
