import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure Graph where
  V : Type
  E : Type
  source : E → V
  target : E → V
  loopFree : Prop
  loopFreeTerm : loopFree

structure Group where
  G : Type
  mul : G → G → G
  one : G
  inv : G → G
  mulAssoc : ∀ a b c : G, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : G, mul one a = a
  mulOne : ∀ a : G, mul a one = a
  mulLeftInv : ∀ a : G, mul (inv a) a = one

structure Ring where
  R : Type
  add : R → R → R
  mul : R → R → R
  zero : R
  one : R
  addAssoc : ∀ a b c : R, add (add a b) c = add a (add b c)
  addComm : ∀ a b : R, add a b = add b a
  zeroAdd : ∀ a : R, add zero a = a
  addZero : ∀ a : R, add a zero = a
  mulAssoc : ∀ a b c : R, mul (mul a b) c = mul a (mul b c)
  oneMul : ∀ a : R, mul one a = a
  mulOne : ∀ a : R, mul a one = a
  leftDistrib : ∀ a b c : R, mul a (add b c) = add (mul a b) (mul a c)
  rightDistrib : ∀ a b c : R, mul (add a b) c = add (mul a c) (mul b c)

structure GraphAdmittedObject where
  graph : Graph
  simpleGraph : Prop
  finiteGraph : Prop
  conclusion : simpleGraph ∧ finiteGraph

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse
