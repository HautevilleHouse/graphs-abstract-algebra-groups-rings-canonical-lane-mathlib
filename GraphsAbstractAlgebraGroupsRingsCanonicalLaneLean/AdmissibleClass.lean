import HautevilleHouse.GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse