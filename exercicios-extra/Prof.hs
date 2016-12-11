module Prof where

newtype Pred a = Pred {runPred :: a -> Bool}

newtype Forget r a b = Forget { runForget :: a -> r }

instance Profunctor (Forget r) where
    dimap f _ (Forget h) = Forget (h . f)

newtype Costar f d c = Costar { runCostar :: f d -> c }

instance (Functor f) => Profunctor (Costar f) where
    dimap ab cd (Costar fbc) = Costar (cd . fbc . fmap ab)

newtype Star f d c = Star { runStar :: d -> f c }

instance (Functor f) => Profunctor (Star f) where
    dimap ab cd (Star bfc) = Star (fmap cd . bfc . ab)

class Contravariant f where
    contramap :: (a -> b) -> f b -> f a

instance Contravariant Pred where
    contramap f (Pred g) = Pred (g . f)

class Profunctor p => Strong p where
    first' :: p a b -> p (a, c) (b, c)
    second' :: p a b -> p (c, a) (c, b)

instance Strong (->) where
    first' f (a, c) = (f a, c)
    second' f (c, a) = (c, f a)

instance (Functor f) => Strong (Star f) where
    first' (Star afb) = Star (\(a,c) -> fmap (\b -> (b,c)) (afb a))
    second' (Star afb) = Star (\(c,a) -> fmap (\b -> (c,b)) (afb a))

instance Strong (Forget r) where
    first' (Forget ar) = Forget (ar . fst)
    second' (Forget ar) = Forget (ar . snd)

class Profunctor p where
    dimap :: (a -> b) -> (c -> d) -> p b c -> p a d

instance Profunctor (->) where
    dimap f g h = g . h . f

