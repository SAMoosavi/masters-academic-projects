---
title: "PAPER_TITLE"
authors: "AUTHORS"
year: YEAR
journal: "JOURNAL"
doi: "DOI"
tags: [TAGS]
---

# PAPER_TITLE

## Overview

OVERVIEW_PARAGRAPH

## Relevance to Our Work

RELEVANCE_PARAGRAPH

## Key Contributions

- CONTRIBUTION_1
- CONTRIBUTION_2

## Mathematical Notation

### Setup

$$
\begin{aligned}
&P \in \mathbb{G},\quad q=|\mathbb{G}|,\quad s\in\mathbb{Z}_q^* \\
&P_{pub}=sP \\
&H_{1,2}:\{0,1\}^*\rightarrow\mathbb{Z}_q^*
\end{aligned}
$$

### Partial Private Key Extract

$$
\begin{aligned}
&r_{ID}\in\mathbb{Z}_q^*,\quad R_{ID}=r_{ID}P \\
&h_1=H_1(ID,R_{ID},P_{pub}) \\
&d_{ID}=r_{ID}+h_1 s \\
&D_{ID}=(d_{ID},R_{ID})
\end{aligned}
$$

### Set Secret Value

$$
\begin{aligned}
&x_{ID}\in\mathbb{Z}_q^* \\
&X_{ID}=x_{ID}P
\end{aligned}
$$

### Set Private/Public Key

$$
\begin{aligned}
&SK_{ID}=(x_{ID},d_{ID}) \\
&PK_{ID}=(X_{ID},R_{ID})
\end{aligned}
$$

### Signature

$$
\begin{aligned}
&t\in\mathbb{Z}_q^*,\quad T=tP \\
&h_2=H_2(m,ID,PK_{ID},T) \\
&\tau=t+h_2(x_{ID}+d_{ID})\pmod q \\
&\sigma=(T,\tau)
\end{aligned}
$$

### Aggregate (if CLAS)

$$
\begin{aligned}
&T'=\sum T,\quad \tau'=\sum\tau \\
&\sigma_{agg}=(T',\tau')
\end{aligned}
$$

### Verification

$$
\begin{aligned}
\tau P = T + h_2(X_{ID}+R_{ID}+h_1 P_{pub})
\end{aligned}
$$

## Protocol / Scheme

1. **Setup**: System parameters
2. **KeyGen**: Vehicle key generation
3. **Sign**: Message signing
4. **Aggregate**: Signature aggregation (if CLAS)
5. **Verify**: Verification

## Security Analysis

- SECURITY_RESULT_1
- SECURITY_RESULT_2

## Performance

- PERFORMANCE_METRIC_1
- PERFORMANCE_METRIC_2

## Strengths & Limitations

- Strengths: STRENGTH_1
- Limitations: LIMITATION_1

## Related Work

- [[related_paper_1|Title 1]]
- [[related_paper_2|Title 2]]
