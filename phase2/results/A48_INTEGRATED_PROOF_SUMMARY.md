# A48 Integrated Proof Summary

## Final result

The C3 A48 property was verified through one integrated Tamarin invocation containing three helper obligations and the final property.

```text
H1: a48_h1_same_child_id_implies_same_lineage
    verified (6 steps)

H2: a48_h2_same_generated_lineage_implies_same_public_tuple
    verified (2 steps)

H3: a48_h3_uncompromised_acceptance_has_generated_origin
    verified (52 steps)

Final:
past_epoch_identity_is_bound_or_target_compromised
    verified (8 steps)
```

All wellformedness checks completed successfully.

Processing time reported by Tamarin:

```text
707.76 seconds
```

## Proof chain

```text
same accepted child_id
        ↓ H1
same lineage
        ↓ H3 for each uncompromised acceptance
matching generated origins
        ↓ H2
same epoch, keys, predecessor, issuer, parents,
times, window, root, and space
        ↓
final A48 identity-binding branch
```

If a target epoch key or the root key was compromised before either acceptance, the corresponding explicit compromise branch satisfies the final disjunction.

## Frozen evidence

Integrated model SHA-256:

```text
6a674d76a6c37479a10c727387a9a5771b7557064781ea4411b658e9bf355133
```

Integrated proof log SHA-256:

```text
7a3b2b0e6b64e2d8bfca323dce4ca49c267fb78286044a11e4c39645a4a714c1
```

The original direct attack-search log recorded a timeout after 1,800 seconds. The final result is based on the integrated universal proof, not on that timeout.
