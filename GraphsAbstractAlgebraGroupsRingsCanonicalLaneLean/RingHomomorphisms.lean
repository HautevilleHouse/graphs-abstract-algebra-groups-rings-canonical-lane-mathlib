import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure RingHomomorphismPackage (R : Type u) [Ring R] (S : Type v) [Ring S] where
  hom : R → S
  additiveGroupHom : ∀ a b : R, hom (a + b) = hom a + hom b
  multiplicativeMonoidHom : ∀ a b : R, hom (a * b) = hom a * hom b
  unitPreserving : hom 1 = 1

structure RingHomomorphismEvidence {R : Type u} [Ring R] {S : Type v} [Ring S]
  (P : RingHomomorphismPackage R S) where
  additiveClosed : P.additiveGroupHom
  multiplicativeClosed : P.multiplicativeMonoidHom
  unitClosed : P.unitPreserving

def RingHomomorphismClosed {R : Type u} [Ring R] {S : Type v} [Ring S]
  (P : RingHomomorphismPackage R S) : Prop :=
  P.additiveGroupHom ∧ P.multiplicativeMonoidHom ∧ P.unitPreserving

theorem ring_homomorphism_closed_from_evidence {R : Type u} [Ring R] {S : Type v} [Ring S]
  (P : RingHomomorphismPackage R S) (E : RingHomomorphismEvidence P) : RingHomomorphismClosed P := by
  exact And.intro E.additiveClosed (And.intro E.multiplicativeClosed E.unitClosed)

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse