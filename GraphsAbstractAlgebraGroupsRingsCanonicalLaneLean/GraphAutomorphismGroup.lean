import GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.GroupRingBridge

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GraphAutomorphismGroupPackage where
  graph : Type u
  vertexSet : Set graph
  edgeSet : Set (graph × graph)
  automorphismGroup : Type v
  automorphismAxioms : Group automorphismGroup
  automorphismAction : automorphismGroup → graph → graph
  preservesEdges : ∀ (f : automorphismGroup) (u v : graph), (u, v) ∈ edgeSet → (automorphismAction f u, automorphismAction f v) ∈ edgeSet

def GraphAutomorphismGroupClosed (P : GraphAutomorphismGroupPackage) : Prop :=
  P.automorphismAxioms.toIsGroup ∧ P.preservesEdges

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse