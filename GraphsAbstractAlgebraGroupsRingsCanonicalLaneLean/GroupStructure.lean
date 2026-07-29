import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure GroupStructure where
  carrierSet : Type u
  multiplication : carrierSet → carrierSet → carrierSet
  identity : carrierSet
  inverse : carrierSet → carrierSet
  associativity : ∀ a b c : carrierSet, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  identityLeft : ∀ a : carrierSet, multiplication identity a = a
  identityRight : ∀ a : carrierSet, multiplication a identity = a
  inverseLeft : ∀ a : carrierSet, multiplication (inverse a) a = identity
  inverseRight : ∀ a : carrierSet, multiplication a (inverse a) = identity

def GroupClosed (G : GroupStructure) : Prop :=
  G.associativity ∧ G.identityLeft ∧ G.identityRight ∧ G.inverseLeft ∧ G.inverseRight

theorem group_closed_holds (G : GroupStructure) : GroupClosed G := by
  exact And.intro G.associativity (And.intro G.identityLeft (And.intro G.identityRight (And.intro G.inverseLeft G.inverseRight)))

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse