import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GraphGroupActionPackage (G : Type u) [Group G] (V : Type v) where
  action : G → V → V
  identityAction : Prop
  compatibility : Prop
  actionStructure : Prop

structure GraphGroupActionEvidence {G : Type u} [Group G] {V : Type v}
    (A : GraphGroupActionPackage G V) where
  identityActionClosed : A.identityAction
  compatibilityClosed : A.compatibility
  actionStructureClosed : A.actionStructure

def GraphGroupActionClosed {G : Type u} [Group G] {V : Type v}
    (A : GraphGroupActionPackage G V) : Prop :=
  A.identityAction ∧ A.compatibility ∧ A.actionStructure

theorem graph_group_action_closed_from_evidence {G : Type u} [Group G] {V : Type v}
    (A : GraphGroupActionPackage G V) (E : GraphGroupActionEvidence A) : GraphGroupActionClosed A := by
  exact And.intro E.identityActionClosed
    (And.intro E.compatibilityClosed E.actionStructureClosed)

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse