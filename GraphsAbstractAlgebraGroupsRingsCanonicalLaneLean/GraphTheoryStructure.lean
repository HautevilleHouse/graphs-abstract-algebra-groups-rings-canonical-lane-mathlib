import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GraphStructure where
  vertexSet : Type u
  edgeSet : Type v
  incidence : edgeSet → vertexSet × vertexSet
  isSimple : Prop
  isFinite : Prop

def GraphClosed (G : GraphStructure) : Prop :=
  G.isSimple ∧ G.isFinite

theorem graph_closed_holds (G : GraphStructure) (h1 : G.isSimple) (h2 : G.isFinite) : GraphClosed G := by
  exact And.intro h1 h2

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse