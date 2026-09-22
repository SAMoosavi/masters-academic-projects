---
title: "An efficient certificateless aggregate signature scheme resistant to collusion attacks for VANETs"
authors: "Wanqing Wu, Yanxu Heng"
year: 2025
journal: "Computer Networks"
volume: 272
article: "111637"
doi: "10.1016/j.comnet.2025.111637"
tags: [CLAS, VANET, collusion-resistance]
mode: "Abstract-only (closed, no OA link)"
---

# An Efficient CLAS Resistant to Collusion Attacks for VANETs

> Status note: Abstract-only. Closed access; no full text and no abstract
> indexed in the metadata records checked, so no scheme equations, proofs,
> or performance numbers are stated as fact. All scheme-level statements
> below are explicitly hedged per-summary claims (unverified — full text not accessed).

## Overview

Title- and bib-record scope only: the record describes a certificateless
aggregate signature (CLAS) scheme for VANETs framed around resistance to
collusion attacks (Crossref title field; OpenAlex title field).
Bibliography per Crossref record retrieved 2026-09-21: journal Computer
Networks, volume 272, article-number 111637, published November 2025,
publisher Elsevier BV, authors Wanqing Wu and Yanxu Heng,
DOI 10.1016/j.comnet.2025.111637.

## Verification Answer

Yes — bib matches the expected citation (Comput Netw 272:111637,
DOI 10.1016/j.comnet.2025.111637, Wu + Heng, 2025), and every scheme,
proof, and performance statement in this file is explicitly hedged as
unverified pending full text. No equations or scheme details are
presented as fact.

## Relevance to Our Work

Relevance is conditional: IF the title-framed collusion-resistance claim
verifies against the full text, this paper would be a direct comparator
for triple-adversary (Type I / II / III) coverage. Until the PDF is
obtained, no comparison should cite its construction, proof, or numbers.

## Key Contributions (unverified — prior-summary claims, need PDF)

- Prior summary claimed resistance against Type I, Type II, AND Type-III (collusion) adversaries (unverified — full text not accessed).
- Prior summary claimed a pairing-free ECC-based construction with an EUF-CMA proof in the random oracle model (unverified — full text not accessed).
- Prior summary claimed MIRACL-based experiments and joint NS3 + SUMO simulation (unverified — full text not accessed).
- Prior summary claimed lower communication/computation overhead versus related schemes (unverified — full text not accessed).

## Mathematical Notation

Withheld. No notation is stated because no full text was accessed and no
abstract with technical content was indexed in the records checked.

## Protocol / Scheme

Withheld. No setup, key-generation, signing, aggregation, or verification
steps are stated because no full text was accessed.

## Security Analysis (hedged — needs PDF verification)

- Type I / Type II resistance: previously claimed, NOT verified without full text (unverified — full text not accessed).
- Type-III (collusion) resistance as the paper's distinctive contribution per its title framing: previously claimed, NOT verified without full text (unverified — full text not accessed).
- EUF-CMA in ROM under ECDLP: previously claimed, NOT verified without full text (unverified — full text not accessed).

## Performance (hedged — needs PDF verification)

- No verified numbers are stated (unverified — full text not accessed).
- Prior claims about MIRACL measurements, NS3 + SUMO results, and overhead comparisons are retained only as hedged per-summary claims above, not as facts (unverified — full text not accessed).

## Strengths & Limitations

- Strength (bibliographic): peer-reviewed journal venue with collusion-attack framing per the indexed title (Crossref + OpenAlex records).
- Limitation: closed access with no retrievable full text and no abstract indexed, so all technical claims remain unverified (OpenAlex record: is_oa false, pdf_url null).

## Related Work

- [[tao2026|ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks]]
- [[wu2025-pseudonyms|A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs]]
- [[yue2025|A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs]]
- [[zheng2023|A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks]]

## Provenance

- Mode: Abstract-only (closed, no OA link).
- Endpoints (metadata only, no full-text fetch):
- Crossref check: GET https://api.crossref.org/works/10.1016/j.comnet.2025.111637 (DOI URL-encoded; Accept application/json). Retrieved 2026-09-21: DOI 10.1016/j.comnet.2025.111637; title "An efficient certificateless aggregate signature scheme resistant to collusion attacks for VANETs"; container-title Computer Networks; volume 272; article-number 111637; published date-parts [[2025, 11]]; publisher Elsevier BV; type journal-article; authors Wanqing Wu + Yanxu Heng; ISSN 1389-1286; URL https://doi.org/10.1016/j.comnet.2025.111637. Expected (Comput Netw 272:111637, Wu+Heng, 2025) matches retrieved on every field.
- OpenAlex check: GET https://api.openalex.org/works/https://doi.org/10.1016/j.comnet.2025.111637 (DOI URL-encoded). Retrieved 2026-09-21: id https://openalex.org/W4413825160; DOI https://doi.org/10.1016/j.comnet.2025.111637; title matches Crossref; type article; publication_year 2025; open_access.is_oa false; open_access.oa_status closed; open_access.oa_url null; best_oa_location null; primary_location.pdf_url null; primary_location.source.display_name Computer Networks; abstract_inverted_index absent (null); cited_by_count 3. Closed access confirmed: pdf_url / best_oa_location null, is_oa false as expected.
- Warnings: OpenAlex returned no abstract index, so no abstract-derived technical claims are possible; this summary rests on title + bib metadata only. Crossref link entries point to api.elsevier.com text-mining URLs, not followed per task constraints (metadata only, no web-fetch of full text). No PDF invented, no full-text fetch attempted beyond the two metadata APIs.
- Dump file: NONE (no text dump; text=NONE per spawn — closed access, nothing to dump).
- Schemes file: NONE written (no schemes file per spawn).
- Access date: 2026-09-21.
- What changed 2026-09-21: re-verified bib against live Crossref/OpenAlex records; aligned frontmatter title casing to Crossref record; removed all placeholder equations and generic protocol steps (none are stated as fact); converted every scheme/proof/number statement to explicitly hedged per-summary claims; relabelled mode to Abstract-only (closed, no OA link).
