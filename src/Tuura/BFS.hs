module Tuura.BFS (Graph, Vertex, bfs) where

import Data.Array
import Data.Sequence (Seq, ViewL (..), (><))
import Data.IntSet   (IntSet)

import qualified Data.Sequence as Seq
import qualified Data.IntSet as Set

type Vertex = Int
type Graph  = Array Vertex [Vertex]

bfs :: Graph -> Vertex -> [Vertex]
bfs graph vertex = visit Set.empty (Seq.singleton vertex)
  where
    visit :: IntSet -> Seq Vertex -> [Vertex]
    visit visited queue = case Seq.viewl queue of
        EmptyL  -> []
        v :< vs -> if Set.member v visited
                   then visit visited vs
                   else v : (visit newVisited newQueue)
          where
            toVisit    = filter (\u -> Set.notMember u visited) (graph ! v)
            newVisited = Set.insert v visited
            newQueue   = vs >< Seq.fromList toVisit
