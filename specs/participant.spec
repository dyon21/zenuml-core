# Participant

The parser can extract participants from the DSL in two modes - implicit and explicit.

## Implicit declaration

In most cases, you do not need to explicitly declare participants, as the the parser can implicitly extract the participants from the DSL.

* Extract participants from DSL
      | text              | participants |
      |-------------------|--------------|
      | A.m               | [A]          |
      | A.m B.m           | [A,B]        |
      | A.m { B.m }       | [A,B]        |
      | A->B: m           | [A,B]        |


## Explicit declaration

Explicit declaration can be useful to re-order the participant lifelines (row #4).

* Extract participants from DSL
      | text      | participants |
      |-----------|--------------|
      | A         | [A]          |
      | A B       | [A,B]        |
      | A\\nB     | [A,B]        |
      | B A\\nA.m | [B,A]        |


