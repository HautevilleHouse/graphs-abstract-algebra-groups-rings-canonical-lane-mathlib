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

structure Subgroup {G : Type u} (group : Group G) where
  carrier : Set G
  oneMem : group.one ∈ carrier
  mulMem : ∀ a b, a ∈ carrier → b ∈ carrier → group.mul a b ∈ carrier
  invMem : ∀ a, a ∈ carrier → group.inv a ∈ carrier

structure GaloisConnection (A B : Type u) [Group A] [Group B] where
  lower : A → B
  upper : B → A
  adjunction : ∀ a b, lower a = b ↔ a = upper b

def GaloisConnectionClosed {A B : Type u} [GA : Group A] [GB : Group B]
    (gc : GaloisConnection A B) : Prop :=
  ∀ a : A, gc.upper (gc.lower a) = a ∧
  ∀ b : B, gc.lower (gc.upper b) = b

theorem galois_connection_closed_property {A B : Type u} [GA : Group A] [GB : Group B]
    (gc : GaloisConnection A B) : GaloisConnectionClosed gc := by
  intro a
  have h1 : gc.lower a = gc.lower a := rfl
  have h2 := (gc.adjunction a (gc.lower a)).mpr h1
  refine And.intro h2 ?_
  intro b
  have h3 : gc.lower (gc.upper b) = gc.lower (gc.upper b) := rfl
  have h4 := (gc.adjunction (gc.upper b) b).mpr h3
  exact h4.symm

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse