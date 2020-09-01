---
layout: post
robots: index,follow
published: true

tags: [categories,operads,Lawvere theories,multicategories,polycategories,PROPs,PROperads]

title: Composing with many inputs and outputs (1)
description: Trying to review and connect many notions of categories, multicategories and polycategories
---

For this post, I will assume some familiarity with category theory, but I will try to stick to the basics. Many of it will be informal anyway, and I will try to recall or at least give some feeling of any advanced notion I may use.

## (1) Preliminary : Composing things with one input and one output


Roughly speaking category theory is the art of composing stuff. There are plenty of textbooks and references about categories, and all of them start like this : take a bunch of things that you call objects, and throw in a bunch of arrows in between those objects, and a composition, and blahblahblah... That’s great and all, but I would like to introduce another way of looking at it, which is in my opinion not stressed upon enough. It is a subtle slight change in the paradigm, and might not really sound like a big deal - all of this introduction will indeed sound like a lot of hassle to reformulate usual things, but bear with me for a second, as I believe this slight change in paradigm can carry us a lot further than it seems.

### Boxes and wires
So I will start with whole bunch of boxes, each of them having an input wire and an output wire. I will draw them with different shapes to distinguish them 
TODO : Picture
And I want these boxes to behave like a jigsaw: I can plug the output wire of a box to the input wire of another box, and create a chain of boxes. Of course, as in any puzzle, I may not just assemble any two pieces, some of them may not fit well together. To show this in my drawings, I will add a colour to each input wires and output wires of each boxes, and I take as a rule that I can plug in an output wire to the next input wire only when they have the same colour - simple enough, kids understand jigsaws with a lot more ways to connect things.
TODO : Picture
So what’s the deal with the jigsaws and categories? Well to get a category, you start by choosing once an for all the set of all colours for the input and output wires, a category is no more that a giant jigsaw on this color, with one special property : whenever you can plug two boxes together, the result is equivalent to one of the boxes that you already have. Of course there is a bunch of axioms to throw in, like associativity, and unitality, but they are pretty standard, and I’ll not get into that now. The question is how is this a category? Well think about it this the colors really are the objects of the category, and the boxes are the morphisms. Then the idea of pluging is the composition of morphisms !

### Let’s make this mathematical - The rules of the game
So how to formalise this idea and give it a precise mathematical meaning? Well there are many ways, and most notably I could just give you the usual presentation of what a category is, and this would fit the bill, thankfully as I have been telling you since the beginning that I was explaining categories. But for what I want to talk about next, makes sense more sense to show you a different way. I will group the boxes together in sets, and I will formalise these sets. A set of boxes $X$ is equipped with two additional data : the colours for the inputs and the colours for the outputs of the boxes. I will store these data as two functions
TODO : draw span A <-i X o-> B
The function $i$ maps an operation to the colour of its input, and the function $o$ maps it to the colour of its output.
Notice that I don’t necessarily suppose that there is a fixed set of all possible colours, neither do I require that the input colours and the output colours are live in the same set. I will call such a data a set of jigsaw pieces (the technical term is a span). I now have to explain how to plug in the boxes one to another (in another words, assemble a jigsaw). For this I need a two sets of jigsaw pieces, such that the output colours of the first sets live in the same set an the input colours of the second set (this is necessary if I want to be able to chose matching colours).
TODO : draw two spans A<- X -> B <- Y -> C
With these two data, I will define the set of all possible ways of plugging a box in $X$ to a box in $Y$, this set is denoted $X\times_B Y$, and it can be explicitly described by $X\times_B Y = \{ (x,y)\in X\times Y, o(x) = i(y)\}$. In other words, it is the set of all pairs of boxes, such that the output of the first matches the input of the second. I think of this pair $(x,y)$ as describing the box $x$ and the box $y$ plugged in to each other.
TODO : draw
We can see on the figure that these two boxes plugged in still have one “free” input and one “free” output, which are namely the input of $x$ and the output of $y$, so I will define the input of $(x,y)$ by $i(x,y) = i(x)$, and the output of $(x,y)$ by $o(x,y)=o(y)$. With this definitions, $X\times_B Y$ is a set of jigsaw pieces!
TODO : draw span A <- X\times Y -> C
I will also define a morphism between two sets of jigsaw pieces $f : X \to X’$ to be simply a function that sends a box onto another with same colour for its input and its output. Now it’s time to assemble all this data into a single entity and it’s not so easy as it seems

### The bicategory of jigsaws
The most natural thing to try out when we have a things that compose, is to try and assemble them into a category. Namely, what I would like to do here is to define the objects of my category to be the set of possible colours, and the morphisms $A \to B$ to be the sets of jigsaw pieces which are allowed to have input colours in $A$ and output colours in $B$. Be careful with this : a morphism in this approach is a *set* of jigsaw pieces, a single jigsaw piece is not a morphism, and morphisms are not some kind of functions! Composition of morphisms $X$ and $Y$ is given by the operation I just described $X\times_B Y$. Does this work? Ugh, we just run into an ugly problem : composition is not associative. However, one can check that it is associative _up to isomorphism_ meaning that really the composite $(X\circ Y)\circ Z$ is isomorphic to the composite $X\circ (Y\circ Z)$. To account for that, we assemble this data into a bicategory : we add $2$-cells that really are “morphisms of morphisms”, and we chose them to be the morphisms of sets of jigsaw pieces. Now we get something like a category, but all the axioms hold up to isomorphism, instead of holding on the nose. That’s a bicategory (for what we’ll do with it and our level of formalism at least, it is enough). We call it the bicategory of jigsaws.

### What is a category
Now it’s time for the result I announced in the very beginning : a category is a monad in the bicategory of jigsaws. And there you go! A new definition of a category. Let me unravel this a bit with you. Usually we talk about a monad on a given category $\mathcal{C}$, as being an endofunctor $T$ together with two natural transformations, a unit $\eta : \mathrm{id}_{\mathcal{C}} \Rightarrow \T$ and $\mu : T\circ T \Rightarrow T$, satisfying some axioms. A monad in a bicategory is almost the same : it is an object $c$ equipped with a morphism $t : c \to c$, and two $2$-cells $\eta : \mathrm{id}_{c}\Rightarrow t$ and $\mu : t\circ t \Rightarrow t$, satisfying the same axioms. So what’s a monad in the bicategory of jigsaws? Well it is 
- An object $A$ (we first fix a definite set of colours)
- A morphism $t : A \to A$ (that is a set of jigsaw pieces with colours in $A$)
- A unit $2$-cell $\eta : \mathrm{id}_{a}\to t$ (a way of choosing identities)
- A multiplication $2$-cell $\mu : t\circ t \Rightarrow t$ (a composition operation : which given two pieces plugged in one to another provides a new piece)
- Plus the axioms satisfied by $\eta$ and $\mu$ which translate exactly to the axioms of a category! 

So hopefully by now, you can see why this really is a definition for categories. 

But you might ask, why go through all this trouble just to define categories, when the usual definition is so simple? In the definition I presented, I used monads and bicategories, which really are a bit advanced concepts of category theory, just to define categories, which are way more basic concepts. And I completely agree! However, there are various reasons why I find this construction interesting. Firstly it is nice to see that there is a slick way of defining categories in one sentence “a category is a monad in the bicategory of jigsaws” - category theory provides powerful tools like monads to encapsulate many notions, and it is great to see that categories themselves are among these notions. More importantly, this presentation generalizes well to talk about category objects in other categories than the category of sets. And most importantly, it really prepares to what comes next : considering boxes with not just one input wire and one output wire (stay tuned!)

### The non-coloured case
Before going much further, I would like to remark what happens if we just forget that there are colours and allow for composing any two boxes. Formally, we will just merge this case with the previous case by saying that the set of colours is a singleton. That means that there is only one colour, so the output of a box and the input of the next box are necessarily the same colour! What do we get in that case? If you have followed what I said until now, you might recognise the notion of a monoid - Recall that a category with one object is the same as a monoid, and in our case, the objects are called colours. This gives a (way too complicated) definition of a monoid : “a monoid is a monad on the singleton set in the bicategory of jigsaws”. I don’t have much to say about this, but I still want to mention it, since when we will add multiple inputs and/or multiple outputs, the non-coloured cases will make very natural the construction of a lot of very interesting objects : cartesian operads, Lawvere theories, operads, PROPs, symmetric operads, symmetric props…

### Category objects
In the entire construction that I have presented, I haven’t really used much the fact that I consider a set of operations and a set of colours, so let’s see what happens if I drop the requirement of them being sets. The incentive for doing such a thing is to consider categories whose objects and morphisms may be vectors of a vector space, or element of a group or points in a topological space… Or even more general things than that. It is a common practice in category theory to define a construction in a category and to see where else is would make sense, I think it is due to the fact that many examples of that appeared to be useful in maths in general. For instance topological groups are just groups in the category of topological spaces, or Lie groups are groups in the category of manifold.

Anyway back to our business : let’s consider an arbitrary category $\mathcal{C}$. I can always decide to call “object of jigsaw pieces” a diagram of the form
TODO : span
I can also always call “morphism of object of jigsaw pieces” a morphism that preserves the input colour and the output colour. I can even draw it as a diagram
TODO : diagram morphism of spans
So we are almost there to define the bicategory of jigsaws in $\mathcal{C}$ : the only thing left is the composition. So let me reformulate the composition in $\mathcal{C}$ in more categorical terms : the set $X\times_B Y$ that I had constructed is actually a pullback, and the construction for the composition can be understood as the following pullback
TODO : picture
For this construction to also make sense in the category $\mathcal{C}$, I will just require that this category has pullbacks. With this I can construct the bicategory of jigsaws in $\mathcal{C}$, and a category object in $\mathcal{C}$ is nothing else than a monad in the bicategory of jigsaws in $\mathcal{C}$. Technically this would work also if we were to consider objects of jigsaw pieces whose maps $i$ and $o$ are such that all pullbacks exists, even if not all pullbacks exist in $\mathcal{C}$. According to the nlab, example of such things even do come up!



### Some questions
- Is there a slick way to generalize this construction to talk about enriched category theory? I haven’t tried it, but it seems there should be, if you know of any such way please let me know!
- What happens when we allow for many inputs and many outputs? Stay tuned for further discussions about this!

### References
I don’t have any references for this case, I don’t know if it has ever been written down formally, but I promise I will give some good references for the more complicated cases, which repeat this whole story in a more involved way. 
