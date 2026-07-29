import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean

structure Graph where
  vertex : Type u
  edge : vertex → vertex → Prop

structure GraphHomomorphism (G H : Graph) where
  map : G.vertex → H.vertex
  edgePreserved : ∀ u v : G.vertex, G.edge u v → H.edge (map u) (map v)

structure GraphIsomorphism (G H : Graph) where
  hom : GraphHomomorphism G H
  inv : GraphHomomorphism H G
  leftInv : ∀ v : G.vertex, inv.map (hom.map v) = v
  rightInv : ∀ w : H.vertex, hom.map (inv.map w) = w

def GraphIsomorphismClosed {G H : Graph} (iso : GraphIsomorphism G H) : Prop :=
  (∀ u v : G.vertex, G.edge u v ↔ H.edge (iso.hom.map u) (iso.hom.map v)) ∧
  (∀ u : G.vertex, iso.inv.map (iso.hom.map u) = u) ∧
  (∀ w : H.vertex, iso.hom.map (iso.inv.map w) = w)

theorem graph_isomorphism_closed (G H : Graph) (iso : GraphIsomorphism G H) :
    GraphIsomorphismClosed iso := by
  refine And.intro ?_ (And.intro iso.leftInv iso.rightInv)
  intro u v
  refine And.intro (fun h ⇒ iso.hom.edgePreserved u v h) ?_
  intro h
  have := iso.inv.edgePreserved (iso.hom.map u) (iso.hom.map v) h
  rw [iso.leftInv u, iso.leftInv v] at this
  exact this

end GraphsAbstractAlgebraGroupsRingsCanonicalLaneLean
end HautevilleHouse