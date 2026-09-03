# Mathematical Notation — CLAS/VANET Papers

> Aggregated from all paper summaries. LaTeX notation.

## A Certificateless Aggregate Signature Scheme for Security and Privacy Protection in VANET
*Source: [cahyadi2022-clas-scheme](cahyadi2022-clas-scheme.md)*

Key generation:
- KGC generates master key $s \in \mathbb{Z}_q^*$ and master public key $P_{pub} = sP$
- Partial private key: $D_i = s \cdot H_1(ID_i)$ where $H_1: \{0,1\}^* \to G_1$
- Secret value: $x_i \in \mathbb{Z}_q^*$, public key: $PK_i = x_iP$
- Full private key: $SK_i = (D_i, x_i)$

Signature generation (on message $m_j$):
- Choose random $r_j \in \mathbb{Z}_q^*$
- Compute $R_j = r_jP$
- $h_j = H_2(m_j, ID_i, PK_i, R_j)$
- $S_j = r_j + h_j \cdot x_i \mod q$ (using secret value)

Aggregation:
$$\sigma = \sum_{j=1}^{n} S_j, \quad R = \sum_{j=1}^{n} R_j, \quad H = \prod_{j=1}^{n} h_j$$

Verification:
$$e(\sigma P, P) \stackrel{?}{=} e(R, P) \cdot e(H \cdot PK_i, P_{pub})$$

---

## A Comprehensive Survey on Certificateless Aggregate Signature in Vehicular Ad Hoc Networks
*Source: [cahyadi2022-survey](cahyadi2022-survey.md)*

The survey catalogs the following generic CLAS framework:

**Certificateless Signature (CLS) foundation:**
- Public key: $PK = xP$ where $x$ is user's secret value
- Private key: $(D_{user}, x)$ where $D_{user} = sH_1(ID)$ from KGC

**Aggregate signature construction:**
- Individual signatures $(S_i, R_i)$ for messages $m_i$
- Aggregate: $\sigma_{agg} = \sum_{i=1}^n S_i$
- Verification: $e(\sigma_{agg}P, P) = \prod e(R_i, P) \cdot e(\sum h_i PK_i, P_{pub})$

**Security assumptions cataloged:**
- Computational Diffie-Hellman (CDH)
- Elliptic Curve Discrete Logarithm (ECDL)
- Bilinear Diffie-Hellman (BDH)

---

## Pairing-Free Certificateless Aggregate Signcryption Scheme for Vehicular Sensor Networks
*Source: [dai2022](dai2022.md)*

**Signcryption (sign):**
- Secret value $x_i$, partial key $D_i = sH_1(ID_i)$
- Random $k_i$, $R_i = k_iP$
- Shared key: $K = k_i \cdot PK_{receiver}$
- $c = m \oplus H(K)$ (encryption)
- $\sigma_i = k_i + H(m \| ID_i \| R_i) \cdot x_i + D_i \mod q$

**Aggregate:**
$$\sigma_{agg} = \sum_{i=1}^n \sigma_i$$

**Unsigncrypt + verify:**
$$e(\sigma_{agg}P, P) \stackrel{?}{=} e(\sum R_i, P) \cdot e(\sum H(m_i \| ID_i \| R_i) \cdot PK_i + H_1(ID_i), P_{pub})$$

---

## PCAS: Cryptanalysis and Improvement of Pairing-Free Certificateless Aggregate Signature Scheme with Conditional Privacy-Preserving for VANETs
*Source: [gong2023](gong2023.md)*

**Key generation:**
- KGC: master key $s \in \mathbb{Z}_q^*$, public key $P_{pub} = sP$
- User partial private key: $D_i = s \cdot H_1(ID_i)$
- Secret value: $x_i$, public key: $PK_i = x_iP$
- Vehicle private key: $(D_i, x_i)$

**Signature (revised algorithm):**
- Pick random $k_i \in \mathbb{Z}_q^*$
- $R_i = k_iP$
- $h_i = H(ID_i \| m_i \| R_i)$
- $\sigma_i = k_i + h_i \cdot (x_i + D_i) \mod q$

**Aggregation:**
$$\sigma = \sum_{i=1}^n \sigma_i, \quad R = \sum_{i=1}^n R_i$$

**Batch verification:**
$$e(\sigma P, P) \stackrel{?}{=} e(R, P) \cdot \prod_{i=1}^n e(H_1(ID_i) \cdot h_i, P_{pub}) \cdot \prod_{i=1}^n e(PK_i \cdot h_i, P)$$

---

## eCLAS: An Efficient Pairing-Free Certificateless Aggregate Signature for Secure VANET Communication
*Source: [han2022](han2022.md)*

**Key generation:**
- KGC: master key $s$, public $P_{pub} = sP$
- Partial key: $D_i = sH(ID_i)$
- Secret value $x_i$, public key $PK_i = x_iP$

**Signing:**
- Random $r_i \in \mathbb{Z}_q^*$
- $R_i = r_iP$
- $h_i = H(m_i \| ID_i \| R_i \| PK_i)$
- $\sigma_i = r_i + h_i \cdot x_i + D_i \mod q$

**Aggregation:**
$$\sigma = \sum_{i=1}^n \sigma_i, \quad R = \sum_{i=1}^n R_i, \quad H = \prod_{i=1}^n h_i$$

**Verification (single pairing-free equation):**
$$e(\sigma P, P) = e(R, P) \cdot e(H \cdot PK_i + H_1(ID_i), P_{pub})$$

---

## An Efficient and Secure Certificateless Aggregate Signature Scheme for Vehicular Ad Hoc Networks
*Source: [iqbal2023](iqbal2023.md)*

**HECC-based construction:**
- Curve: genus-$g$ hyperelliptic curve over $\mathbb{F}_q$
- Jacobian group $J_C(\mathbb{F}_q)$ of order $n$
- Generator $P$ of prime order $n$

**Key generation:**
- KGC: $s \in \mathbb{Z}_n^*$, $P_{pub} = [s]P$
- Partial key: $D_i = [s]H(ID_i)$
- Secret value $x_i$, public key $PK_i = [x_i]P$

**Signing:**
- Random $r_i \in \mathbb{Z}_n^*$
- $R_i = [r_i]P$
- $h_i = H(m_i \| ID_i \| R_i)$
- $\sigma_i = r_i + h_i(x_i + D_i) \mod n$

**Aggregation:**
$$\sigma = \sum_{i=1}^n \sigma_i \mod n$$

---

## A Comprehensive Review of ECC-based Certificateless Aggregate Signature for VANETs and Cryptanalysis of Quantum-Secure CLAS
*Source: [lode2026](lode2026.md)*

**Generic ECC-based CLAS framework (from survey):**

- System params: $(E/\mathbb{F}_p, P, q, H)$
- KGC: master $s$, $P_{pub} = sP$
- User: $D_i = sH_1(ID_i)$, secret $x_i$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$
- Verify: $e(\sigma P, P) = e(\sum R_i, P) \cdot e(\sum h_i(PK_i) + H_1(ID_i), P_{pub})$

**Quantum attack model analyzed:**
- Shor's algorithm breaks discrete logarithm
- Grover's algorithm provides quadratic speedup for search
- Claimed quantum-secure scheme found vulnerable to algebraic manipulation

---

## Security Analysis of Conditional Privacy-Preserving Authentication Schemes for VANETs
*Source: [shim2023](shim2023.md)*

**KGC attack on Wang et al.:**
- KGC knows master key $s$ and can compute any user's partial key $D_i = sH(ID_i)$
- With $D_i$ and knowledge of the verification equation structure, KGC can forge signatures
- Traceability broken: KGC can generate signatures that appear to come from any vehicle

**Key recovery on Xiong et al.:**
- Adversary recovers full private key $(D_i, x_i)$ from public information
- Enables universal signature forgery

---

## On the security of aggregate signature-based conditional privacy-preserving authentication schemes for VANETs
*Source: [shim2026](shim2026.md)*

- Type I adversary: can replace public keys but not access master secret key
- Type II adversary: knows master secret key but cannot replace public keys
- CL-PKC combines advantages of PKI and IBC by decoupling key generation
- Attack: adversary replaces target vehicle public key, algebraic elimination removes master public key during verification
- Countermeasure: hash-based binding h_i = H(M_i, ID_i, P_i, R_i) includes all public components

---

## ES-CLAS: An Efficient Certificateless Fully Aggregate Signature Scheme for Vehicular Ad Hoc Networks
*Source: [tao2026](tao2026.md)*

**Key generation:**
- KGC master key $s$, public $P_{pub} = sP$
- User partial key: $D_i = s \cdot H(ID_i)$
- Secret value $x_i$, public key $PK_i = x_iP$

**Signing:**
- Pick random $k_i \in \mathbb{Z}_q^*$
- $R_i = k_iP$
- $c_i = H(ID_i \| m_i \| R_i \| T_i)$ where $T_i$ is timestamp
- $S_i = k_i + c_i \cdot x_i + D_i \mod q$

**Full aggregation:**
$$\sigma = \sum_{i=1}^n S_i, \quad R = \sum_{i=1}^n R_i, \quad C = \bigoplus_{i=1}^n c_i$$

**Verification:**
$$e(\sigma P, P) \stackrel{?}{=} e(R, P) \cdot \prod_{i=1}^n e(c_i PK_i + D_i, P_{pub})$$

---

## Efficient Certificate-Less Aggregate Signature Scheme with Conditional Privacy-Preservation for VANETs Enhanced Smart Grid System
*Source: [vallent2021](vallent2021.md)*

**Standard CLAS framework (pairing-free):**
- KGC: $s$, $P_{pub} = sP$
- User: $D_i = sH_1(ID_i)$, secret $x_i$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$

---

## A Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs
*Source: [wang2022](wang2022.md)*

**Standard model construction:**
- Uses computational Diffie-Hellman problem (CDHP) directly
- No random oracle assumptions
- Key: $PK_i = x_iP$, $D_i = sH(ID_i)$
- Sign: $\sigma_i = r_i + c_i \cdot x_i + D_i \mod q$ where $c_i$ derived from deterministic functions
- Aggregate: $\sigma = \sum \sigma_i$
- Verify: $e(\sigma P, P) = e(R, P) \cdot \prod e(c_i PK_i + D_i, P_{pub})$

---

## A Privacy-Preserving Certificate-Less Aggregate Signature Scheme with Detectable Invalid Signatures for VANETs
*Source: [wang2025-detectable](wang2025-detectable.md)*

**CLAS with detection:**
- Standard key generation: $D_i = sH(ID_i)$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$, $R = \sum R_i$
- Verify: $e(\sigma P, P) \stackrel{?}{=} e(R, P) \cdot \prod e(h_i PK_i + D_i, P_{pub})$
- **Detection**: If verification fails, test individual $\sigma_i$ values by checking $e(\sigma_i P, P) \stackrel{?}{=} e(R_i, P) \cdot e(h_i PK_i + D_i, P_{pub})$

---

## ECAE: An Efficient Certificateless Aggregate Signature Scheme Based on Elliptic Curves for NDN-IoT Environments
*Source: [wang2025-ecae](wang2025-ecae.md)*

**ECC-based construction:**
- KGC: $s$, $P_{pub} = sP$
- Partial key: $D_i = sH(ID_i)$
- Secret value $x_i$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$
- Verify: $e(\sigma P, P) = e(R, P) \cdot \prod e(h_i PK_i + D_i, P_{pub})$

---

## A New Efficient and Provably Secure Certificateless Signature Scheme Without Bilinear Pairings for the Internet of Things
*Source: [wei2025](wei2025.md)*

**Attack on existing PF-CLS:**
- Adversary uses forged signature with manipulated random values
- Type I attack: adversary replaces public key and exploits verification equation structure

**Enhanced scheme:**
- KGC: $s$, $P_{pub} = sP$
- Partial key: $D_i = sH(ID_i)$
- Secret value $x_i$, $PK_i = x_iP$
- Sign: Modified algorithm resisting Type I attacks
- Verification: Pairing-free equation

---

## An Efficient Certificateless Aggregate Signature Scheme Resistant to Collusion Attacks for VANETs
*Source: [wu2025-collusion](wu2025-collusion.md)*

**ECC-based CLAS (collusion-resistant):**
- KGC: $s$, $P_{pub} = sP$
- User: $D_i = sH(ID_i)$, $x_i$, $PK_i = x_iP$
- Sign: Modified algorithm preventing collusion
- Aggregate: $\sigma = \sum \sigma_i$
- Verification: Pairing-free equation

**Type III resistance mechanism:**
- Additional binding between KGC-issued key and user's secret value
- Prevents KGC from colluding with user to forge signatures

---

## A Secure and Efficient Certificateless Aggregate Signature Authentication Scheme With Pseudonyms for VANETs
*Source: [wu2025-pseudonyms](wu2025-pseudonyms.md)*

**ECC-based CLAS with pseudonyms:**
- KGC: $s$, $P_{pub} = sP$
- Pseudonym: $PID_i = H(ID_i \| r_i)$ for temporary identity
- Partial key: $D_i = sH(PID_i)$
- Secret value $x_i$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$

**Forking lemma application:**
- Security proof uses generalized forking lemma
- Reduces forgery to solving ECDLP
- Transparent proof process

---

## A Security-Enhanced Certificateless Aggregate Signcryption Scheme for Vehicular Ad Hoc Networks
*Source: [wu2025-signcryption](wu2025-signcryption.md)*

**Attack on Dai et al.:**
- Adversary replaces public key: $PK_i' = PK_i + \Delta$
- Algebraic manipulation allows signature forgery during unsigncrypt

**Enhanced CLASC:**
- Signcrypt: Encrypt and sign simultaneously using ECC
- Aggregate signcrypt: $\sigma_{agg} = \sum \sigma_i$
- Unsigncrypt + verify: Combined decryption and verification

---

## A Security-Enhanced Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme for VANETs
*Source: [xu2023](xu2023.md)*

**Enhanced ECC-based CLAS:**
- KGC: $s$, $P_{pub} = sP$
- User: $D_i = sH(ID_i)$, $x_i$, $PK_i = x_iP$
- Sign: Enhanced algorithm with security bindings
- Aggregate: $\sigma = \sum \sigma_i$
- Verify: Pairing-free equation

---

## A New Conditional Privacy-Preserving Certificateless Aggregate Signature Scheme in the Standard Model for VANETs
*Source: [yuan2023](yuan2023.md)*

**Attack analysis:**
- KGC attack: Malicious KGC uses master key to forge signatures
- Public key replacement: Adversary manipulates $PK_i$

**Improved scheme (standard model):**
- Uses deterministic hash functions instead of random oracles
- KGC: $s$, $P_{pub} = sP$
- Enhanced key generation preventing KGC attacks
- Standard model verification equation

---

## A Lightweight Certificateless Aggregate Signature Scheme without Pairing for VANETs
*Source: [yue2025](yue2025.md)*

**Rogue key attack on Zheng et al.:**
- Adversary generates ephemeral rogue key: $PK_{rogue} = \Delta P$
- Uses random numbers in signatures to create valid-looking forgery
- Forged aggregate passes verification

**Countermeasure (aggregator signature):**
- Aggregator signs the aggregation: $\sigma_{agg\_sign} = r_{agg} + h_{agg}(x_{agg} + D_{agg}) \mod q$
- Verification checks both: $\sigma_{agg}$ AND $\sigma_{agg\_sign}$ simultaneously

---

## Notes on the Security of Certificateless Aggregate Signature Schemes
*Source: [zhang2014](zhang2014.md)*

**Attacks on Xiong et al.:**

1. **Honest-but-curious KGC attack**: KGC observes partial keys and can deduce information
2. **Malicious-but-passive KGC attack**: KGC uses master key $s$ to compute $D_i = sH(ID_i)$ for any user and forge signatures
3. **Inside signer collusion**: Multiple signers combine their partial information
4. **Insider + malicious KGC**: Most destructive — KGC collaborates with one signer to forge for all

**New secure scheme:**
- Aggregate signature $\sigma_{agg}$ is valid $\iff$ every $\sigma_i$ is individually valid
- Bilinear map construction

---

## Efficient Pairing-Free Certificateless Signcryption Scheme for Secure Data Transmission in IoMT
*Source: [zhang2024](zhang2024.md)*

**Zero-knowledge CLSC:**
- Signcrypt: $\sigma = (c, S)$ where $c$ is ciphertext and $S$ is signature
- Uses ECC scalar multiplication only
- No bilinear pairings
- Public verification of signature component

---

## A Security-Enhanced Pairing-Free Certificateless Aggregate Signature for Vehicular Ad-Hoc Networks
*Source: [zheng2023](zheng2023.md)*

**Pairing-free ECC CLAS:**
- KGC: $s$, $P_{pub} = sP$
- User: $D_i = sH(ID_i)$, $x_i$, $PK_i = x_iP$
- Sign: $\sigma_i = r_i + h_i(x_i + D_i) \mod q$
- Aggregate: $\sigma = \sum \sigma_i$, $R = \sum R_i$
- Verify: $e(\sigma P, P) = e(R, P) \cdot \prod e(h_i PK_i + D_i, P_{pub})$

---

