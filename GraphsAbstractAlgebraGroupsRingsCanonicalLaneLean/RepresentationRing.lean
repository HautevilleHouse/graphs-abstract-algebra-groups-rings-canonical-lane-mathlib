import GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.GraphAutomorphismGroup

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure RepresentationRingPackage where
  group : Type u
  field : Type v
  groupAxioms : Group group
  fieldAxioms : Field field
  representation : group → Matrix (Fin n) (Fin n) field
  representationIsHomomorphism : ∀ (g h : group), representation (g * h) = representation g * representation h
  ringStructureOnEndomorphisms : Ring (Matrix (Fin n) (Fin n) field)

def RepresentationRingClosed (P : RepresentationRingPackage) : Prop :=
  P.groupAxioms.toIsGroup ∧ P.fieldAxioms.toIsField ∧ P.representationIsHomomorphism ∧ P.ringStructureOnEndomorphisms.toIsRing

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse