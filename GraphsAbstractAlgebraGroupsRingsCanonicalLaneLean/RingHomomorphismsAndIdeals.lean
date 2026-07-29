import canonicalLaneMathlib.AdmissibleClass
import GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean.GraphObjects

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure RingHomomorphism (R S : Ring) where
  f : R.R → S.R
  preservesAdd : ∀ a b : R.R, f (R.add a b) = S.add (f a) (f b)
  preservesMul : ∀ a b : R.R, f (R.mul a b) = S.mul (f a) (f b)
  preservesOne : f R.one = S.one

structure Ideal (R : Ring) where
  I : Set R.R
  zeroInI : R.zero ∈ I
  closedUnderAdd : ∀ a b : R.R, a ∈ I → b ∈ I → R.add a b ∈ I
  closedUnderMul : ∀ (r : R.R) (a : R.R), a ∈ I → R.mul r a ∈ I

theorem kernel_is_ideal (R S : Ring) (φ : RingHomomorphism R S) :
    Ideal R where
  I := { x : R.R | φ.f x = S.zero }
  zeroInI := by
    calc
      φ.f R.zero = S.zero := by
        calc
          φ.f R.zero = φ.f R.zero := rfl
          _ = S.zero := by
            calc
              φ.f R.zero = φ.f (R.add R.zero R.zero) := by
                rw [R.addZero, R.zeroAdd]
              _ = S.add (φ.f R.zero) (φ.f R.zero) := φ.preservesAdd _ _
              _ = φ.f R.zero := by
                have h : S.add (φ.f R.zero) (φ.f R.zero) = φ.f R.zero := by
                  calc
                    S.add (φ.f R.zero) (φ.f R.zero) = S.add (φ.f R.zero) (S.zero) := by
                      rw [S.zeroAdd]
                    _ = φ.f R.zero := S.addZero _
                exact h
              _ = S.add S.zero S.zero := by
                rw [S.zeroAdd, S.addZero]
            _ = S.zero := by
              rw [S.zeroAdd, S.addZero]
    exact this
  closedUnderAdd := λ a b ha hb => by
    calc
      φ.f (R.add a b) = S.add (φ.f a) (φ.f b) := φ.preservesAdd _ _
      _ = S.add S.zero S.zero := by rw [ha, hb]
      _ = S.zero := by rw [S.zeroAdd, S.addZero]
  closedUnderMul := λ r a ha => by
    calc
      φ.f (R.mul r a) = S.mul (φ.f r) (φ.f a) := φ.preservesMul _ _
      _ = S.mul (φ.f r) S.zero := by rw [ha]
      _ = S.zero := by
        calc
          S.mul (φ.f r) S.zero = S.mul (φ.f r) (S.zero) := rfl
          _ = S.zero := by
            calc
              S.mul (φ.f r) S.zero = S.add (S.mul (φ.f r) S.zero) (S.mul (φ.f r) S.zero) := by
                rw [S.leftDistrib, S.addZero, S.addZero]
              _ = S.zero := by
                have : S.add (S.mul (φ.f r) S.zero) (S.mul (φ.f r) S.zero) = S.mul (φ.f r) S.zero := by
                  calc
                    S.add (S.mul (φ.f r) S.zero) (S.mul (φ.f r) S.zero) = S.mul (φ.f r) (S.add S.zero S.zero) := by
                      rw [S.leftDistrib]
                    _ = S.mul (φ.f r) S.zero := by
                      rw [S.zeroAdd, S.addZero]
                exact this
              _ = S.zero := ?_
    sorry

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse
