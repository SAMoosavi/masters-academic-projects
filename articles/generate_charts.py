#!/usr/bin/env python3
"""Generate comparison charts for CLAS/VANET papers."""
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
import os

OUTPUT_DIR = "/home/sam/Desktop/masters-academic-projects/articles/comparison-charts"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Color palette
COLORS = ['#2196F3', '#FF9800', '#4CAF50', '#F44336', '#9C27B0',
          '#00BCD4', '#FF5722', '#607D8B', '#E91E63', '#3F51B5',
          '#009688', '#FFC107', '#795548', '#8BC34A', '#673AB7']

plt.rcParams.update({
    'font.size': 11,
    'axes.titlesize': 14,
    'axes.labelsize': 12,
    'figure.facecolor': 'white',
    'axes.facecolor': '#f8f9fa',
    'axes.grid': True,
    'grid.alpha': 0.3,
})

# ─── Chart 1: Publication Timeline ───
def chart_timeline():
    papers = {
        'Zhang et al. (2014)': 2014,
        'Vallent et al. (2021)': 2021,
        'Cahyadi et al. (2022a)': 2022,
        'Cahyadi & Hwang (2022b)': 2022,
        'Dai & Xu (2022)': 2022,
        'Han et al. (2022)': 2022,
        'Wang et al. (2022)': 2022,
        'Gong et al. (2023)': 2023,
        'Iqbal et al. (2023)': 2023,
        'Shim (2023)': 2023,
        'Xu et al. (2023)': 2023,
        'Yuan et al. (2023)': 2023,
        'Zheng et al. (2023)': 2023,
        'Zhang et al. (2024)': 2024,
        'Wang et al. (2025a)': 2025,
        'Wang et al. (2025b)': 2025,
        'Wei et al. (2025)': 2025,
        'Wu & Ye (2025)': 2025,
        'Wu & Chen (2025)': 2025,
        'Wu & Heng (2025)': 2025,
        'Yue et al. (2025)': 2025,
        'Lode & Pinapati (2026)': 2026,
        'Shim & Kwon (2026)': 2026,
        'Tao & Cui (2026)': 2026,
    }

    fig, ax = plt.subplots(figsize=(14, 8))
    years = sorted(set(papers.values()))
    year_counts = {y: sum(1 for v in papers.values() if v == y) for y in years}

    bars = ax.bar(years, [year_counts[y] for y in years], color=COLORS[:len(years)],
                  edgecolor='white', linewidth=1.5, width=0.6)

    for bar, year in zip(bars, years):
        ax.text(bar.get_x() + bar.get_width()/2, bar.get_height() + 0.15,
                str(year_counts[year]), ha='center', va='bottom', fontweight='bold', fontsize=12)

    ax.set_xlabel('Publication Year')
    ax.set_ylabel('Number of Papers')
    ax.set_title('Publication Timeline of CLAS/VANET Papers (2014–2026)')
    ax.set_xticks(years)
    ax.set_xticklabels(years, rotation=0)
    ax.set_ylim(0, max(year_counts.values()) + 2)
    plt.tight_layout()
    plt.savefig(f'{OUTPUT_DIR}/timeline.png', dpi=200, bbox_inches='tight')
    plt.close()
    print("OK: timeline.png")


# ─── Chart 2: Security Features Comparison ───
def chart_security():
    schemes = [
        'Cahyadi (2022)', 'Dai (2022)', 'Gong (2023)', 'Han (2022)',
        'Iqbal (2023)', 'Shim (2023)', 'Tao (2026)', 'Wang H. (2022)',
        'Wang C. (2025)', 'Wang X. (2025)', 'Wu W. (2025a)', 'Wu W. (2025b)',
        'Xu (2023)', 'Yuan (2023)', 'Yue (2025)', 'Zheng (2023)',
        'Zhang J. (2024)', 'Zhang F. (2014)'
    ]

    # Features: Pairing-free, ECC-based, Standard Model, Batch Verify, Conditional Privacy, Type III
    features = np.array([
        [1, 1, 0, 1, 1, 0],  # Cahyadi
        [1, 1, 0, 1, 1, 0],  # Dai
        [1, 1, 0, 1, 1, 0],  # Gong
        [1, 1, 0, 1, 1, 0],  # Han
        [0, 0, 0, 1, 1, 0],  # Iqbal (HECC, not ECC pairing-free)
        [0, 0, 0, 0, 1, 0],  # Shim (cryptanalysis)
        [1, 1, 0, 1, 1, 0],  # Tao
        [1, 1, 1, 1, 1, 0],  # Wang H.
        [1, 1, 0, 1, 1, 0],  # Wang C.
        [1, 1, 0, 1, 1, 0],  # Wang X.
        [1, 1, 0, 1, 1, 1],  # Wu (Type III)
        [1, 1, 0, 1, 1, 1],  # Wu (Type III)
        [1, 1, 0, 1, 1, 0],  # Xu
        [1, 1, 1, 1, 1, 0],  # Yuan
        [1, 1, 0, 1, 1, 1],  # Yue
        [1, 1, 0, 1, 1, 0],  # Zheng
        [1, 1, 0, 0, 0, 0],  # Zhang J. (signcryption, IoMT)
        [0, 0, 0, 0, 0, 0],  # Zhang F. (cryptanalysis)
    ])

    feature_names = ['Pairing-free', 'ECC-based', 'Standard Model', 'Batch Verify', 'Cond. Privacy', 'Type III Resist.']

    fig, ax = plt.subplots(figsize=(16, 10))
    im = ax.imshow(features, cmap='RdYlGn', aspect='auto', vmin=0, vmax=1)

    ax.set_xticks(range(len(feature_names)))
    ax.set_xticklabels(feature_names, rotation=30, ha='right', fontsize=10)
    ax.set_yticks(range(len(schemes)))
    ax.set_yticklabels(schemes, fontsize=9)

    for i in range(len(schemes)):
        for j in range(len(feature_names)):
            text = '✓' if features[i, j] else '✗'
            color = 'white' if features[i, j] else '#666'
            ax.text(j, i, text, ha='center', va='center', fontsize=12, color=color, fontweight='bold')

    ax.set_title('Security Features Comparison Across CLAS Schemes', pad=15)
    plt.tight_layout()
    plt.savefig(f'{OUTPUT_DIR}/security-comparison.png', dpi=200, bbox_inches='tight')
    plt.close()
    print("OK: security-comparison.png")


# ─── Chart 3: Attack Resistance ───
def chart_attacks():
    schemes = [
        'Cahyadi (2022)', 'Gong (2023)', 'Han (2022)', 'Iqbal (2023)',
        'Tao (2026)', 'Wang H. (2022)', 'Wu W. (2025a)', 'Wu W. (2025b)',
        'Xu (2023)', 'Yuan (2023)', 'Yue (2025)', 'Zheng (2023)'
    ]

    # Attacks: Type I, Type II, Type III, Forgery, Replay, KGC
    attacks = np.array([
        [1, 1, 0, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
        [1, 1, 1, 1, 1, 1],
        [1, 1, 0, 1, 1, 1],
    ])

    attack_names = ['Type I', 'Type II', 'Type III', 'Forgery', 'Replay', 'KGC Attack']

    fig, ax = plt.subplots(figsize=(14, 8))
    im = ax.imshow(attacks, cmap='RdYlGn', aspect='auto', vmin=0, vmax=1)

    ax.set_xticks(range(len(attack_names)))
    ax.set_xticklabels(attack_names, fontsize=11)
    ax.set_yticks(range(len(schemes)))
    ax.set_yticklabels(schemes, fontsize=10)

    for i in range(len(schemes)):
        for j in range(len(attack_names)):
            text = '✓' if attacks[i, j] else '✗'
            color = 'white' if attacks[i, j] else '#666'
            ax.text(j, i, text, ha='center', va='center', fontsize=13, color=color, fontweight='bold')

    ax.set_title('Attack Resistance Comparison', pad=15)
    plt.tight_layout()
    plt.savefig(f'{OUTPUT_DIR}/attack-resistance.png', dpi=200, bbox_inches='tight')
    plt.close()
    print("OK: attack-resistance.png")


# ─── Chart 4: Approach Categories ───
def chart_categories():
    categories = {
        'Proposed Scheme': 14,
        'Cryptanalysis/Attack': 5,
        'Survey/Review': 3,
        'Signcryption': 3,
    }

    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 6))

    # Pie chart
    colors_pie = ['#2196F3', '#FF9800', '#4CAF50', '#F44336']
    wedges, texts, autotexts = ax1.pie(
        categories.values(), labels=categories.keys(),
        colors=colors_pie, autopct='%1.0f%%', startangle=90,
        textprops={'fontsize': 11}, pctdistance=0.8
    )
    for t in autotexts:
        t.set_fontweight('bold')
    ax1.set_title('Paper Categories')

    # Bar chart by year and type
    years = [2014, 2021, 2022, 2023, 2024, 2025, 2026]
    proposed = [0, 1, 4, 4, 1, 5, 2]
    crypto = [1, 0, 0, 1, 0, 0, 1]
    survey = [0, 0, 1, 0, 0, 0, 1]

    x = np.arange(len(years))
    w = 0.25
    ax2.bar(x - w, proposed, w, label='Proposed Scheme', color='#2196F3')
    ax2.bar(x, crypto, w, label='Cryptanalysis', color='#FF9800')
    ax2.bar(x + w, survey, w, label='Survey/Review', color='#4CAF50')

    ax2.set_xlabel('Year')
    ax2.set_ylabel('Number of Papers')
    ax2.set_title('Papers by Year and Category')
    ax2.set_xticks(x)
    ax2.set_xticklabels(years)
    ax2.legend()

    plt.tight_layout()
    plt.savefig(f'{OUTPUT_DIR}/categories.png', dpi=200, bbox_inches='tight')
    plt.close()
    print("OK: categories.png")


if __name__ == '__main__':
    chart_timeline()
    chart_security()
    chart_attacks()
    chart_categories()
    print("\nAll charts generated.")
