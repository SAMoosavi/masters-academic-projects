# eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication

## Bibliographic

- Authors: Yibo Han, Wei Song, Zhangbing Zhou, Hao Wang, Bo Yuan (src: L3; text: L9)
- Year: 2022; Venue: IEEE Systems Journal, Volume 16, Issue 1 (src: L5; src: L67)
- DOI: 10.1109/JSYST.2021.3116029 (src: L6; text: L3)
- Title: eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication (src: L2; text: L7)
- Mode: Abstract-only; no PDF full text was fetched per task constraints (src: L7; src: L13; text: L5)

## Problem

- VANETs have become an important part of the intelligent transportation system for vehicle-to-vehicle communication to ensure safety and improve driving experience (text: L9).
- Signed messages in VANETs need to be authenticated by roadside units (RSUs) in a very short time (text: L9).
- Limited network bandwidth and computing power constrain authentication in the VANET environment (text: L9).
- Certificateless aggregate signature (CLAS) is considered a promising solution to these bandwidth and computation constraints (text: L9).
- This work targets efficient V2I authentication under those constraints, with no additional problem details available beyond the abstract (text: L9; src: L17).

## Method

- The authors propose eCLAS, an efficient pairing-free CLAS scheme suitable for vehicle-to-infrastructure (V2I) communication (text: L9; src: L25).
- Sign: vehicles individually sign distinct messages (text: L9; src: L32).
- Aggregate: individual signatures on different messages from different vehicles are aggregated into one short signature (text: L9; src: L26, L33).
- Verify: the RSU authenticates the aggregated signature rather than each signature separately (text: L9; src: L34).
- Security is claimed in the random oracle model under adaptive chosen-message attack and elliptic-curve discrete logarithm hardness (text: L9; src: L27).
- No concrete algorithms, parameters, equations, or proofs are reproduced here because only the landing-page abstract was available (text: L5; src: L13, L36).
- Full-text algorithms and verification equations would be needed to describe the scheme concretely, and they are unavailable in this source (src: L36; text: L5).

## Key findings

- Proposed pairing-free CLAS scheme eCLAS for V2I communication in VANETs (text: L9; src: L25).
- Aggregation compresses individual signatures on different messages from different vehicles into one short signature (text: L9; src: L26).
- Security proof is claimed in the random oracle model against adaptive chosen-message attacks under elliptic-curve discrete logarithm hardness (text: L9; src: L40).
- Security analysis is claimed to show the scheme meets VANET security requirements (text: L9; src: L41).
- Comparison is claimed to demonstrate obvious advantages in signature verification over existing schemes with better applicability (text: L9; src: L28).
- No timings, counts, effect sizes, or quoted performance numbers are reported because the abstract provides no numbers (src: L47-L49; text: L9).

## Limitations

- Source is abstract-only, so scheme details, proofs, and comparison numbers could not be verified (src: L43; src: L54; text: L5).
- No adversary-type breakdown, privacy mechanism, or formal theorem is stated because the abstract does not provide them (src: L43).
- No timings, message counts, or asymptotic costs are stated because the abstract provides no numbers (src: L47-L49).
- Concrete security guarantees and efficiency claims require the unavailable full text to verify (src: L36; src: L54).
- This report therefore states only abstract-level claims and explicit caveats, with zero invented equations (src: L36; src: L70).

## Related Work

- [[cahyadi2022-clas-scheme|A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET]] — listed as related reference in the audited summary (src: L58).
- [[cahyadi2022-survey|A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks]] — listed as related reference in the audited summary (src: L59).

## Provenance

- Database + endpoint + params: IEEE Xplore landing page https://ieeexplore.ieee.org/document/9580742 via Zotero snapshot 4GAJGY45, HTML only, no PDF fetched (src: L63; text: L1-L2).
- Access date: 2026-09-21; text dump: research/clas-vanet-audit/sources/han2022.txt; audit source: summaries/han2022.md (src: L64; src: L69; text: L1).
- Mode: Abstract-only; DOI 10.1109/JSYST.2021.3116029; publisher IEEE (src: L65; src: L67; text: L3).

Abstract-only (+ OA link https://ieeexplore.ieee.org/document/9580742)
