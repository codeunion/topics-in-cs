module BinaryTree ( BinaryTree(EmptyTree, Node), height) where

data BinaryTree a = EmptyTree
                  | Node a (BinaryTree a) (BinaryTree a)
                                       deriving (Show, Eq)

height :: (BinaryTree a) -> Int
height EmptyTree           = 0
height (Node _ left right) = 1 + max (height left) (height right)

-- insert (Ord a) => :: BinaryTree a -> a -> BinaryTree a
-- insert EmptyTree a = (Node a) EmptyTree EmptyTree
-- insert (Node a left right) b
--   | b == a = (Node a) left right
--   | b < a  = (Node a) (insert left b) right
--   | b > a  = (Node a) left (insert right b)
