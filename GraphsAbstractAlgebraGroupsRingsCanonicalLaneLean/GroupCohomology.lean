import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure Group (G : Type u) where
  mul : G → G → G
  inv : G → G
  one : G
  mulAssoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : G, mul one a = a
  mulOne : ∀ a : G, mul a one = a
  mulLeftInv : ∀ a : G, mul (inv a) a = one

structure Module (R : Type u) [Ring R] where
  carrier : Type v
  add : carrier → carrier → carrier
  smul : R → carrier → carrier
  addAssoc : ∀ x y z : carrier, add (add x y) z = add x (add y z)
  addComm : ∀ x y : carrier, add x y = add y x
  zeroAdd : ∀ x : carrier, add (Ring.zero) x = x
  addZero : ∀ x : carrier, add x (Ring.zero) = x

structure GroupCohomology (G : Type u) (A : Type v) [Group G] [Module A] where
  degree : Nat
  cocycle : (G → A) → Prop
  coboundary : (G → A) → Prop
  cohomologyGroup : Type w
  exactness : Prop
  closedness : Prop

def GroupCohomologyClosed (G : Type u) (A : Type v) [Group G] [Module A]
    (H : GroupCohomology G A) : Prop :=
  H.exactness ∧ H.closedness

theorem group_cohomology_closed_property (G : Type u) (A : Type v) [Group G] [Module A]
    (H : GroupCohomology G A) (h_exact : H.exactness) (h_closed : H.closedness) :
    GroupCohomologyClosed G A H := by
  exact And.intro h_exact h_closed

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse