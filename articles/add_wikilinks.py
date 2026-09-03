#!/usr/bin/env python3
"""Add Obsidian [[wikilinks]] to paper summaries."""
import re
import os

SUMMARIES_DIR = "/home/sam/Desktop/masters-academic-projects/articles/summaries"

# Map citation keys to Obsidian note names
PAPER_LINKS = {
    'cahyadi2022-clas-scheme': 'cahyadi2022-clas-scheme',
    'cahyadi2022-survey': 'cahyadi2022-survey',
    'dai2022': 'dai2022',
    'gong2023': 'gong2023',
    'han2022': 'han2022',
    'iqbal2023': 'iqbal2023',
    'lode2026': 'lode2026',
    'shim2026': 'shim2026',
    'shim2023': 'shim2023',
    'tao2026': 'tao2026',
    'vallent2021': 'vallent2021',
    'wang2022': 'wang2022',
    'wang2025-ecae': 'wang2025-ecae',
    'wang2025-detectable': 'wang2025-detectable',
    'wei2025': 'wei2025',
    'wu2025-pseudonyms': 'wu2025-pseudonyms',
    'wu2025-signcryption': 'wu2025-signcryption',
    'wu2025-collusion': 'wu2025-collusion',
    'xu2023': 'xu2023',
    'yuan2023': 'yuan2023',
    'yue2025': 'yue2025',
    'zhang2024': 'zhang2024',
    'zhang2014': 'zhang2014',
    'zheng2023': 'zheng2023',
}

# Cross-reference rules: which papers should link to which in their "Relevance" or text
CROSS_REFS = {
    'tao2026': ['gong2023', 'wang2022', 'yuan2023', 'wu2025-pseudonyms', 'wu2025-collusion'],
    'gong2023': ['iqbal2023', 'cahyadi2022-clas-scheme'],
    'shim2026': ['zhang2014', 'shim2023', 'wang2022'],
    'shim2023': ['wang2022', 'zhang2014'],
    'wu2025-pseudonyms': ['tao2026', 'wu2025-collusion', 'zheng2023', 'xu2023'],
    'wu2025-collusion': ['tao2026', 'wu2025-pseudonyms', 'yue2025', 'zheng2023'],
    'wu2025-signcryption': ['dai2022'],
    'yue2025': ['zheng2023', 'wu2025-collusion', 'wu2025-pseudonyms'],
    'wang2025-detectable': ['tao2026', 'wu2025-pseudonyms'],
    'wang2025-ecae': ['tao2026', 'han2022'],
    'han2022': ['cahyadi2022-clas-scheme', 'cahyadi2022-survey'],
    'cahyadi2022-clas-scheme': ['cahyadi2022-survey', 'zhang2014'],
    'cahyadi2022-survey': ['cahyadi2022-clas-scheme', 'lode2026'],
    'lode2026': ['cahyadi2022-survey', 'tao2026', 'shim2026'],
    'xu2023': ['shim2023', 'wang2022', 'yuan2023'],
    'yuan2023': ['wang2022', 'shim2023', 'xu2023'],
    'zhang2014': ['zhang2024', 'shim2023', 'shim2026'],
    'zheng2023': ['yue2025', 'wu2025-pseudonyms', 'wu2025-collusion'],
    'wei2025': ['iqbal2023', 'han2022'],
    'vallent2021': ['cahyadi2022-clas-scheme'],
    'iqbal2023': ['cahyadi2022-clas-scheme', 'wei2025'],
    'zhang2024': ['dai2022', 'wu2025-signcryption'],
    'dai2022': ['wu2025-signcryption', 'zhang2024'],
}

def add_wikilinks(content, key):
    """Add [[wikilinks]] for cross-referenced papers."""
    refs = CROSS_REFS.get(key, [])

    # Add a "Related Work" section with wikilinks at the end
    if refs:
        related_section = "\n## Related Work\n\n"
        for ref_key in refs:
            ref_file = SUMMARIES_DIR + f"/{ref_key}.md"
            if os.path.exists(ref_file):
                # Get the title from the target file
                with open(ref_file, 'r') as f:
                    target = f.read()
                title_match = re.search(r'^title:\s*"(.+)"', target, re.MULTILINE)
                title = title_match.group(1) if title_match else ref_key
                related_section += f"- [[{ref_key}|{title}]]\n"

        # Insert before the last section or append
        content = content.rstrip() + "\n" + related_section

    return content

def main():
    count = 0
    for fname in sorted(os.listdir(SUMMARIES_DIR)):
        if not fname.endswith('.md'):
            continue
        key = fname.replace('.md', '')
        filepath = os.path.join(SUMMARIES_DIR, fname)

        with open(filepath, 'r') as f:
            content = f.read()

        # Skip if already has Related Work section
        if '## Related Work' in content:
            continue

        content = add_wikilinks(content, key)

        with open(filepath, 'w') as f:
            f.write(content)

        count += 1
        print(f"  ✓ {fname}")

    print(f"\nUpdated {count} files with [[wikilinks]]")

if __name__ == '__main__':
    main()
