import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.graphStructure ∧ A.object.groupStructure ∧ A.object.ringStructure

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse