# OCLM Phase 2 正式公開

WonderMetanism Inc.は、Hirofumi Kureha（HiRO）が構想・設計したOracle–Child Lineage Model（OCLM）のPhase 2を正式公開しました。

## OCLM Phase 2

**正統系譜の非置換性に対する敵対的形式検証**

OCLMは、記録や多数決によって「真実そのもの」が新しく作られるという前提を採りません。

異なる記録、識別子、証明書、台帳履歴、または合意結果は、単に記録・承認されたという理由だけで、既存のChildの正統系譜にはなりません。正統な連続性には、認証された起源と継承関係が必要です。

Phase 2では、Phase 1で構築した17のTamarin形式モデルに対し、80の象徴的攻撃クラスと8つの健全性・到達可能性検証を実施しました。

## 最終結果

- 80/80の象徴的攻撃クラスを、明示したモデルと前提の下で排除
- 反例トレース 0
- 未解決攻撃クラス 0
- 健全性・到達可能性 8/8
- A48の3補助lemmaと最終命題を、同一Tamarin実行で検証

## ブロックチェーンとの関係

OCLMはブロックチェーンを置き換えるものではありません。

各ブロックチェーンが「そのチェーンでどの状態を受け入れたか」を決定するのに対し、OCLMは「その状態が、主張する起源と正統系譜に属するか」を上位層から判定します。

複数のブロックチェーン、台帳、証拠システムを捨てずに、正統系譜によって束ねるための形式的基盤です。

## 公開資料

- GitHub Release: `{{GITHUB_RELEASE_URL}}`
- Zenodo DOI: `{{ZENODO_DOI_URL}}`
- 公式OCLMページ: `{{OFFICIAL_PHASE2_PAGE_URL}}`

## Attribution

Oracle–Child Lineage Model (OCLM)  
Conceived and designed by Hirofumi Kureha (HiRO).  
First published by WonderMetanism Inc.

Copyright © 2026 Hirofumi Kureha (HiRO).  
Licensed and administered by WonderMetanism Inc.
