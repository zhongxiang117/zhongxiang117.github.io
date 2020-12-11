---
---

# Fortran IF statement

Good document: [fortran-if](http://www.personal.psu.edu/jhm/f90/lectures/11.html)

[backup]

As a conclusion, there are three different definitions;

## IF-THEN-ELSE-IF

```fortran
      IF (CONDITION-1) THEN
         expression-1
      ELSE IF (CONDITION-2) THEN
         expression-2
      ENDIF

C  space does not matter, thus
C     ELSE IF === ELSEIF
C     END IF  === ENDIF
```

## IF oneline

```fortran
      IF (CONDITION) expression
```

## IF three-gotos (legacy)

```fortran
      IF (CONDITION) n1, n2, n3

   n1 expression-1
   n2 expression-2
   n3 expression-3

C  in sequence, arithmetic comparing
C     less than zero   --> n1
C     equals to zero   --> n2
C     bigger than zero --> n3
```


