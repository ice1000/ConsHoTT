\begin{code}[hide]
{-# OPTIONS --cubical #-}
open import Cubical.Core.Everything
open import Cubical.Foundations.Prelude
open import Cubical.Data.Nat
variable A B : Set
\end{code}

\subsection{Paths as constructors}
\label{subsec:path-hit}

Here's the solution in CTT and CCTT.
Recall that a path on type $A$ are similar to
a function from $\mathbb I$ to $A$.
Constructors of type $A$ are similar to a function
from something arbitrary to $A$, but they don't reduce.
These two properties don't clash,
so we can put them together, form a new language structure.
Example $\mathbb Z$ defined by this idea:

\begin{code}
data ℤ : Set where
  pos neg : ℕ → ℤ
  posneg  : pos 0 ≡ neg 0
\end{code}

The constructor, \AgdaConstructor{posneg}, has a path type.

\TODO