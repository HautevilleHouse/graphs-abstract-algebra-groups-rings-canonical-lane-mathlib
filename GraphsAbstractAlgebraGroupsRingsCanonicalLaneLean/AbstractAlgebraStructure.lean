import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure AbstractAlgebraPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  addAssoc : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  addComm : ∀ a b : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  addInv : ∀ a : carrier, ∃ b : carrier, addition a b = zero
  mulAssoc : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  distribLeft : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  distribRight : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)

structure AbstractAlgebraEvidence (A : AbstractAlgebraPackage) where
  addAssocClosed : A.addAssoc
  addCommClosed : A.addComm
  zeroAddClosed : A.zeroAdd
  addZeroClosed : A.addZero
  addInvClosed : A.addInv
  mulAssocClosed : A.mulAssoc
  oneMulClosed : A.oneMul
  mulOneClosed : A.mulOne
  distribLeftClosed : A.distribLeft
  distribRightClosed : A.distribRight

def AbstractAlgebraClosed (A : AbstractAlgebraPackage) : Prop :=
  A.addAssoc ∧ A.addComm ∧ A.zeroAdd ∧ A.addZero ∧ A.addInv ∧
  A.mulAssoc ∧ A.oneMul ∧ A.mulOne ∧ A.distribLeft ∧ A.distribRight

theorem abstract_algebra_closed_from_evidence (A : AbstractAlgebraPackage)
    (E : AbstractAlgebraEvidence A) : AbstractAlgebraClosed A := by
  exact And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.zeroAddClosed
    (And.intro E.addZeroClosed (And.intro E.addInvClosed (And.intro E.mulAssocClosed
    (And.intro E.oneMulClosed (And.intro E.mulOneClosed (And.intro E.distribLeftClosed
      E.distribRightClosed))))))))

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse