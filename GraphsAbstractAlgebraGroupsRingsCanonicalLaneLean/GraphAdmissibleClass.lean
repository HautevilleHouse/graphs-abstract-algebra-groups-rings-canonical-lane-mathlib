import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GraphAdmissibleObject where
  carrier : Set (Type u)
  graphStructure : Prop
  groupStructure : Prop
  ringStructure : Prop
  conclusion : graphStructure ∧ groupStructure ∧ ringStructure

structure AdmissibleClass where
  object : GraphAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.graphStructure ∧ A.object.groupStructure ∧ A.object.ringStructure) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse