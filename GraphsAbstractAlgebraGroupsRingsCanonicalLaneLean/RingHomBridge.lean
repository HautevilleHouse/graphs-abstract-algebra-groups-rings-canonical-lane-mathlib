import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure RingHomBridgePackage (R S : Type u) [Ring R] [Ring S] where
  hom : R → S
  preservesAddition : Prop
  preservesMultiplication : Prop
  preservesOne : Prop
  homStructure : Prop

structure RingHomBridgeEvidence {R S : Type u} [Ring R] [Ring S]
    (B : RingHomBridgePackage R S) where
  preservesAdditionClosed : B.preservesAddition
  preservesMultiplicationClosed : B.preservesMultiplication
  preservesOneClosed : B.preservesOne
  homStructureClosed : B.homStructure

def RingHomBridgeClosed {R S : Type u} [Ring R] [Ring S] (B : RingHomBridgePackage R S) : Prop :=
  B.preservesAddition ∧ B.preservesMultiplication ∧ B.preservesOne ∧ B.homStructure

theorem ring_hom_bridge_closed_from_evidence {R S : Type u} [Ring R] [Ring S]
    (B : RingHomBridgePackage R S) (E : RingHomBridgeEvidence B) : RingHomBridgeClosed B := by
  exact And.intro E.preservesAdditionClosed
    (And.intro E.preservesMultiplicationClosed (And.intro E.preservesOneClosed E.homStructureClosed))

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse