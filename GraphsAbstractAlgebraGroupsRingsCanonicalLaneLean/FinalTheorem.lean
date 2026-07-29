import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

def ConstrainedGraphAlgebraClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graph_algebra_endgame (A : AdmissibleClass) : ConstrainedGraphAlgebraClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse