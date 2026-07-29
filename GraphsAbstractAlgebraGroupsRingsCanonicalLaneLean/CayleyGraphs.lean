import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure CayleyGraphPackage (G : Type u) [Group G] [Fintype G] where
  generators : Finset G
  graphVertexSet : Finset G
  adjacency : (g h : G) → Prop
  adjacencyDef : ∀ g h : G, adjacency g h ↔ g⁻¹ * h ∈ generators

structure CayleyGraphEvidence {G : Type u} [Group G] [Fintype G] (P : CayleyGraphPackage G) where
  adjacencyDefClosed : P.adjacencyDef

def CayleyGraphClosed {G : Type u} [Group G] [Fintype G] (P : CayleyGraphPackage G) : Prop :=
  P.adjacencyDef

theorem cayley_graph_closed_from_evidence {G : Type u} [Group G] [Fintype G]
  (P : CayleyGraphPackage G) (E : CayleyGraphEvidence P) : CayleyGraphClosed P := by
  exact E.adjacencyDefClosed

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse