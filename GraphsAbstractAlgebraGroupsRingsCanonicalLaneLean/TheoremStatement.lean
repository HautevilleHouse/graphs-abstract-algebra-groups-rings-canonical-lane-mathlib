import HautevilleHouse.GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure AdmittedObject where
  structure : Type
  axioms : Prop
  conclusion : axioms

def WitnessClosed (O : AdmittedObject) : Prop :=
  O.axioms

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse