---
title: "Notes on the Security of Certificateless Aggregate Signature Schemes"
authors: "Zhang F., Shen, Wu"
year: 2014
journal: "Information Sciences"
doi: "10.1016/j.ins.2014.07.019"
tags: [CLAS, cryptanalysis, KGC-attack, coalition-attack, bilinear-map, foundational]
---

# Notes on the Security of Certificateless Aggregate Signature Schemes

## Overview

This foundational paper presents four concrete attacks on Xiong et al.'s CLAS scheme: honest-but-curious KGC, malicious-but-passive KGC, inside signer collusion, and insider signer with malicious KGC collusion. The coalition attacks (especially insider + malicious KGC) are shown to be practical and destructive.

The paper also proposes a new secure CLAS scheme where the aggregate signature is valid if and only if every individual signature is valid. This is one of the earliest and most cited CLAS security analyses.

## Relevance to Our Work

This is the foundational cryptanalysis paper that established the security requirements for all subsequent CLAS schemes. The attack taxonomy (KGC, collusion, insider) is the basis for Type I/II/III adversary models used in all later work.

## Key Contributions

- Four concrete attacks on Xiong et al.'s CLAS scheme
- Coalition attacks (insider + malicious KGC) as most destructive
- Proposes new secure CLAS scheme
- Established attack taxonomy for CLAS security

## Mathematical Notation

**Attacks on Xiong et al.:**

1. **Honest-but-curious KGC attack**: KGC observes partial keys and can deduce information
2. **Malicious-but-passive KGC attack**: KGC uses master key $s$ to compute $D_i = sH(ID_i)$ for any user and forge signatures
3. **Inside signer collusion**: Multiple signers combine their partial information
4. **Insider + malicious KGC**: Most destructive — KGC collaborates with one signer to forge for all

**New secure scheme:**
- Aggregate signature $\sigma_{agg}$ is valid $\iff$ every $\sigma_i$ is individually valid
- Bilinear map construction

## Protocol / Scheme

The paper analyzes attacks and proposes:
1. **Attack 1**: KGC observes and deduces
2. **Attack 2**: KGC forges using master key
3. **Attack 3**: Signers collude
4. **Attack 4**: KGC + signer collude (most destructive)
5. **New scheme**: Individual validity ↔ aggregate validity

## Security Analysis

- Demonstrates four attack classes
- Establishes that KGC attacks are practical
- Coalition attacks are the most dangerous
- New scheme provides stronger guarantees

## Performance

- Uses bilinear pairings (computationally expensive)
- Short aggregate signature
- Validity equivalence property

## Strengths & Limitations

- Strengths: Foundational security analysis, established attack taxonomy, highly cited
- Limitations: Bilinear pairing-based (less efficient), 2014 (outdated)

## Related Work

- [[zhang2024|Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT]]
- [[shim2023|Security Analysis of Conditional Privacy-Preserving Authentication Schemes for VANETs]]
- [[shim2026|On the security of aggregate signature-based conditional privacy-preserving authentication schemes for VANETs]]
