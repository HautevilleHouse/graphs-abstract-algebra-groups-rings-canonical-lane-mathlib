import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure RingStructure where
  carrierSet : Type u
  addition : carrierSet → carrierSet → carrierSet
  multiplication : carrierSet → carrierSet → carrierSet
  zero : carrierSet
  one : carrierSet
  additiveGroup : GroupStructure
  additionAssoc : ∀ a b c : carrierSet, addition (addition a b) c = addition a (addition b c)
  additionComm : ∀ a b : carrierSet, addition a b = addition b a
  zeroAdd : ∀ a : carrierSet, addition zero a = a
  addZero : ∀ a : carrierSet, addition a zero = a
  addInverse : ∀ a : carrierSet, ∃ b : carrierSet, addition a b = zero
  mulAssoc : ∀ a b c : carrierSet, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  mulOne : ∀ a : carrierSet, multiplication a one = a
  oneMul : ∀ a : carrierSet, multiplication one a = a
  leftDistrib : ∀ a b c : carrierSet, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  rightDistrib : ∀ a b c : carrierSet, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)

def RingClosed (R : RingStructure) : Prop :=
  R.additionAssoc ∧ R.additionComm ∧ R.zeroAdd ∧ R.addZero ∧ R.addInverse ∧
  R.mulAssoc ∧ R.mulOne ∧ R.oneMul ∧ R.leftDistrib ∧ R.rightDistrib

theorem ring_closed_holds (R : RingStructure) : RingClosed R := by
  exact And.intro R.additionAssoc (And.intro R.additionComm (And.intro R.zeroAdd (And.intro R.addZero (And.intro R.addInverse (And.intro R.mulAssoc (And.intro R.mulOne (And.intro R.oneMul (And.intro R.leftDistrib R.rightDistrib))))))))

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse