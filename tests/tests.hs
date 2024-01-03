module Main where
import My
import Test.HUnit
import qualified System.Exit as Exit

mySucc_1 :: Test
mySucc_2 :: Test
mySucc_1 = TestCase (assertEqual "should be 43" 43 (mySucc 42))
mySucc_2 = TestCase (assertEqual "should be 43" 0 (mySucc (-1)))

myIsNeg_1 :: Test
myIsNeg_2 :: Test
myIsNeg_3 :: Test
myIsNeg_1 = TestCase (assertEqual "should be false" False (myIsNeg 42))
myIsNeg_2 = TestCase (assertEqual "should be true" True (myIsNeg (-42)))
myIsNeg_3 = TestCase (assertEqual "should be false" False (myIsNeg 0))

myMin_1 :: Test
myMin_1 = TestCase (assertEqual "" 42 (myMin 69 42))
myMin_2 :: Test
myMin_2 = TestCase (assertEqual "" 0 (myMin 0 0))

myMax_1 :: Test
myMax_1 = TestCase (assertEqual "" 69 (myMax 69 42))
myMax_2 :: Test
myMax_2 = TestCase (assertEqual "" 0 (myMax 0 0))

myAbs_1 :: Test
myAbs_1 = TestCase (assertEqual "" 42 (myAbs (-42)))
myAbs_2 :: Test
myAbs_2 = TestCase (assertEqual "" 42 (myAbs 42))

myQuickSort_1 :: Test
myQuickSort_1 = TestCase (assertEqual "" [1,2,3,4] (myQuickSort (<) [3,2,4,1]))

myQuickSort_2 :: Test
myQuickSort_2 = TestCase (assertEqual "" [4,3,2,1] (myQuickSort (>) [3,2,4,1]))

myQuickSort_3 :: Test
myQuickSort_3 = TestCase (assertEqual "" [0] (myQuickSort (>) [0]))

tests :: Test
tests = TestList[
    TestLabel "succ 1" mySucc_1,
    TestLabel "succ 2" mySucc_2,

    TestLabel "min 1" myMin_1,
    TestLabel "min 2" myMin_2,

    TestLabel "max 1" myMax_1,
    TestLabel "max 2" myMax_2,

    TestLabel "abs 1" myAbs_1,
    TestLabel "abs 2" myAbs_2,

    TestLabel "sort 1" myQuickSort_1,
    TestLabel "sort 2" myQuickSort_2,
    TestLabel "sort 3" myQuickSort_3,

    TestLabel "is neg 1" myIsNeg_1,
    TestLabel "is neg 2" myIsNeg_2,
    TestLabel "is neg 3" myIsNeg_3]
 
main :: IO ()
main = do
    result <- runTestTT tests
    if failures result > 0 then Exit.exitFailure else Exit.exitSuccess
