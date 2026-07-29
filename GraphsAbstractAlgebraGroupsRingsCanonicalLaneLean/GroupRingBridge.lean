import GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GroupRingPackage where
  group : Type u
  ring : Type v
  groupAxioms : Group group
  ringAxioms : Ring ring
  groupActingOnRing : group → ring → ring
  compatibilityAxioms : Prop

def GroupRingClosed (P : GroupRingPackage) : Prop :=
  P.groupAxioms.toIsGroup ∧ P.ringAxioms.toIsRing ∧ P.compatibilityAxioms

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse