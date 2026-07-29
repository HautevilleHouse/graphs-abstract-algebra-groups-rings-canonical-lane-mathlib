import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure Ring (R : Type u) where
  add : R → R → R
  mul : R → R → R
  zero : R
  one : R
  addAssoc : ∀ a b c : R, add (add a b) c = add a (add b c)
  addComm : ∀ a b : R, add a b = add b a
  zeroAdd : ∀ a : R, add zero a = a
  addZero : ∀ a : R, add a zero = a
  addInv : ∀ a : R, ∃ b : R, add a b = zero
  mulAssoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : R, mul one a = a
  mulOne : ∀ a : R, mul a one = a
  distribLeft : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)
  distribRight : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)

structure Ideal (R : Type u) [Ring R] where
  carrier : Set R
  zeroMem : Ring.zero ∈ carrier
  addMem : ∀ a b, a ∈ carrier → b ∈ carrier → Ring.add a b ∈ carrier
  mulMem : ∀ a b, a ∈ carrier → Ring.mul a b ∈ carrier
  smulMem : ∀ r a, a ∈ carrier → Ring.mul r a ∈ carrier

structure PrimeIdeal (R : Type u) [Ring R] extends Ideal R where
  proper : Ring.one ∉ carrier
  prime : ∀ a b : R, Ring.mul a b ∈ carrier → a ∈ carrier ∨ b ∈ carrier

structure RingSpectrum (R : Type u) [Ring R] where
  points : Set (PrimeIdeal R)
  zarTopology : Set (Set (PrimeIdeal R))
  structureSheaf : Type v
  localRingStalks : Prop
  affineScheme : Prop

def RingSpectrumClosed (R : Type u) [Ring R] (S : RingSpectrum R) : Prop :=
  S.localRingStalks ∧ S.affineScheme

theorem ring_spectrum_closed_property (R : Type u) [Ring R] (S : RingSpectrum R)
    (h_local : S.localRingStalks) (h_affine : S.affineScheme) : RingSpectrumClosed R S := by
  exact And.intro h_local h_affine

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse