import Data.Array
import Tuura.BFS

box :: Graph
box = array (1, 4) [ (1, [2, 3])
                   , (2, [1, 4])
                   , (3, [1, 4])
                   , (4, [2, 3]) ]

tree :: Graph
tree = array (1, 7) [ (1, [2, 3])
                    , (2, [4, 5])
                    , (3, [6, 7])
                    , (4, [])
                    , (5, [])
                    , (6, [])
                    , (7, []) ]

main :: IO ()
main = do
    print (bfs box 1)
    print (bfs tree 1)
