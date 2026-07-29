import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure SubgroupLatticePackage (G : Type u) [Group G] where
  subgroups : Set (Set G)
  subgroupCondition : ∀ H ∈ subgroups, ∀ g h : G, g ∈ H → h ∈ H → g * h ∈ H ∧ g⁻¹ ∈ H ∧ 1 ∈ H
  intersectionClosed : ∀ (S : Set (Set G)), S ⊆ subgroups → ⋂₀ S ∈ subgroups

structure SubgroupLatticeEvidence {G : Type u} [Group G] (P : SubgroupLatticePackage G) where
  subgroupConditionClosed : P.subgroupCondition
  intersectionClosedClosed : P.intersectionClosed

def SubgroupLatticeClosed {G : Type u} [Group G] (P : SubgroupLatticePackage G) : Prop :=
  P.subgroupCondition ∧ P.intersectionClosed

theorem subgroup_lattice_closed_from_evidence {G : Type u} [Group G]
  (P : SubgroupLatticePackage G) (E : SubgroupLatticeEvidence P) : SubgroupLatticeClosed P := by
  exact And.intro E.subgroupConditionClosed E.intersectionClosedClosed

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse