\begin{code}[hide]
{-# OPTIONS --cubical #-}
open import Cubical.Core.Everything
variable A B : Set
\end{code}

Cubical Agda overloads lambdas over intervals as paths,
so path abstraction and application have exactly the same syntax
lambda abstraction and application.
Therefore, the constant function $\lambda i \rightarrow a$
proves reflexivity of paths:

\begin{code}[hide]
module _ (a : A) where
 private
\end{code}
\begin{code}[number]
  refl : a ≡ a
  refl i = a
\end{code}

Note that paths are similar to functions over intervals,
so we can think of \AgdaFunction{refl} as
(\AgdaDatatype{I} is Cubical Agda's $\mathbb I$):

\begin{code}[hide]
module _ (a b : A) where
 private
\end{code}
\begin{code}[number]
  refl : I → A
  refl i = a
\end{code}

Function composition proves the \textsf{ap} (action on paths)
operation in the HoTT Book~\cite[Lemma 2.2.1]{hottbook}
(which is proved with the J rule in MLTT),
and by flipping the parameters of a binary
function we prove function extensionality
(which is not provable in MLTT):

\begin{code}[number]
  ap : (f : A → B) → a ≡ b → f a ≡ f b
  ap f p i = f (p i)

  funExt : {f g : A → B} → (∀ a → f a ≡ g a) → f ≡ g
  funExt p i a = p a i
\end{code}

We may also think of \AgdaFunction{ap} and \AgdaFunction{funExt} as
(note that the function bodies are identical):

\begin{code}[hide]
module _ (a b : A) where
 private
\end{code}
\begin{code}[number]
  ap : (f : A → B) → (I → A) → (I → B)
  ap f p i = f (p i)

  funExt : {f g : A → B} → (∀ a → (I → B)) → (I → (A → B))
  funExt p i a = p a i
\end{code}

All of these proofs are perfectly constructive.
\AgdaFunction{symm} and \AgdaFunction{trans} are not yet provable,
we provide a proof in Arend in~\cref{subsec:coe}
and several proofs under CTT and CCTT in~\cref{sec:kan}.
Unlike \AgdaFunction{ap} or \AgdaFunction{funExt}
which have similar proofs in almost all constructive HoTT models,
different model have different proofs of
\AgdaFunction{symm} and \AgdaFunction{trans} --
there are several approaches.

