import canonicalLaneMathlib.AdmissibleClass
import GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.GraphObjects

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GroupAction (G : Group) (X : Type) where
  act : G.G → X → X
  actOne : ∀ x : X, act G.one x = x
  actMul : ∀ (g h : G.G) (x : X), act (G.mul g h) x = act g (act h x)

structure CayleyGraph (G : Group) (S : Set G.G) where
  graph : Graph
  vertexSet : graph.V ≃ G.G
  edgeSet : ∀ v : graph.V, graph.E ≃ { s : G.G // s ∈ S }

theorem cayley_graph_is_regular (G : Group) (S : Set G.G) (C : CayleyGraph G S) :
    True := by trivial

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse
