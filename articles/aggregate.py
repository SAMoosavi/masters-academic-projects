#!/usr/bin/env python3
"""Aggregate math notation and protocols from paper summaries."""
import re
import os

SUMMARIES_DIR = "/home/sam/Desktop/masters-academic-projects/articles/summaries"
OUTPUT_DIR = "/home/sam/Desktop/masters-academic-projects/articles"

def extract_section(content, section_name):
    """Extract a markdown section by heading name."""
    pattern = rf'## {re.escape(section_name)}\s*\n(.*?)(?=\n## |\Z)'
    match = re.search(pattern, content, re.DOTALL)
    return match.group(1).strip() if match else None

def main():
    summaries = sorted([f for f in os.listdir(SUMMARIES_DIR) if f.endswith('.md')])

    math_sections = []
    protocol_sections = []

    for fname in summaries:
        with open(os.path.join(SUMMARIES_DIR, fname), 'r') as f:
            content = f.read()

        title_match = re.search(r'^title:\s*"(.+)"', content, re.MULTILINE)
        title = title_match.group(1) if title_match else fname.replace('.md', '')
        key = fname.replace('.md', '')

        math = extract_section(content, 'Mathematical Notation')
        if math and math.strip() not in ('', '{All key formulas in LaTeX}', '{extract all key formulas}'):
            math_sections.append((key, title, math))

        protocol = extract_section(content, 'Protocol / Scheme')
        if protocol and protocol.strip() not in ('', '{Step-by-step if applicable: Setup, KeyGen, Sign, Aggregate, Verify}', '{Step-by-step protocol description}'):
            protocol_sections.append((key, title, protocol))

    # Write math-notation.md
    with open(os.path.join(OUTPUT_DIR, 'math-notation.md'), 'w') as f:
        f.write('# Mathematical Notation — CLAS/VANET Papers\n\n')
        f.write('> Aggregated from all paper summaries. LaTeX notation.\n\n')
        for key, title, math in math_sections:
            f.write(f'## {title}\n')
            f.write(f'*Source: [{key}]({key}.md)*\n\n')
            f.write(math + '\n\n---\n\n')
    print(f"math-notation.md: {len(math_sections)} papers")

    # Write protocols.md
    with open(os.path.join(OUTPUT_DIR, 'protocols.md'), 'w') as f:
        f.write('# Protocol Descriptions — CLAS/VANET Schemes\n\n')
        f.write('> Aggregated scheme descriptions from all paper summaries.\n\n')
        for key, title, protocol in protocol_sections:
            f.write(f'## {title}\n')
            f.write(f'*Source: [{key}]({key}.md)*\n\n')
            f.write(protocol + '\n\n---\n\n')
    print(f"protocols.md: {len(protocol_sections)} papers")

if __name__ == '__main__':
    main()
