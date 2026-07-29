import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure Graph (V : Type u) where
  Adj : V → V → Prop

structure GraphHomomorphismPackage (G : Graph V) (H : Graph W) where
  vertexMap : V → W
  edgePreserving : ∀ (x y : V), G.Adj x y → H.Adj (vertexMap x) (vertexMap y)

structure GraphHomomorphismEvidence {G : Graph V} {H : Graph W}
  (P : GraphHomomorphismPackage G H) where
  edgePreservingClosed : P.edgePreserving

def GraphHomomorphismClosed {G : Graph V} {H : Graph W}
  (P : GraphHomomorphismPackage G H) : Prop :=
  P.edgePreserving

theorem graph_homomorphism_closed_from_evidence {G : Graph V} {H : Graph W}
  (P : GraphHomomorphismPackage G H) (E : GraphHomomorphismEvidence P) : GraphHomomorphismClosed P := by
  exact E.edgePreservingClosed

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse