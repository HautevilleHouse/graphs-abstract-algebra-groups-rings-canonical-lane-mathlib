import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure SubgroupLatticePackage (G : Type u) [Group G] where
  subgroups : Set (Subgroup G)
  containmentOrder : Prop
  joinClosed : Prop
  meetClosed : Prop
  latticeStructure : Prop

structure SubgroupLatticeEvidence {G : Type u} [Group G] (S : SubgroupLatticePackage G) where
  containmentOrderClosed : S.containmentOrder
  joinClosedClosed : S.joinClosed
  meetClosedClosed : S.meetClosed
  latticeStructureClosed : S.latticeStructure

def SubgroupLatticeClosed {G : Type u} [Group G] (S : SubgroupLatticePackage G) : Prop :=
  S.containmentOrder ∧ S.joinClosed ∧ S.meetClosed ∧ S.latticeStructure

theorem subgroup_lattice_closed_from_evidence {G : Type u} [Group G] (S : SubgroupLatticePackage G)
    (E : SubgroupLatticeEvidence S) : SubgroupLatticeClosed S := by
  exact And.intro E.containmentOrderClosed
    (And.intro E.joinClosedClosed (And.intro E.meetClosedClosed E.latticeStructureClosed))

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse