import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GroupActionPackage (G : Type u) [Group G] (X : Type v) [Set X] where
  action : G → X → X
  identityAction : ∀ x : X, action 1 x = x
  compatibleAction : ∀ (g h : G) (x : X), action (g * h) x = action g (action h x)

structure GroupActionEvidence {G : Type u} [Group G] {X : Type v} [Set X]
  (P : GroupActionPackage G X) where
  identityClosed : P.identityAction
  compatibleClosed : P.compatibleAction

def GroupActionClosed {G : Type u} [Group G] {X : Type v} [Set X]
  (P : GroupActionPackage G X) : Prop :=
  P.identityAction ∧ P.compatibleAction

theorem group_action_closed_from_evidence {G : Type u} [Group G] {X : Type v} [Set X]
  (P : GroupActionPackage G X) (E : GroupActionEvidence P) : GroupActionClosed P := by
  exact And.intro E.identityClosed E.compatibleClosed

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse