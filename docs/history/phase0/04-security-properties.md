# Security Properties v0.1

## SP-1 Lineage Unforgeability

Oracle が正規発行していない相補関係から、
検証を通過する Child を生成できない。

## SP-2 Parent-Pair Binding

一つの Child を、異なる Parent 組または異なる issuance に
正規に帰属させることができない。

## SP-3 Ontological Non-Malleability

Child またはその系譜要素を変更しながら、
変更前と同一の正規存在として検証を成立させることができない。

## SP-4 Claim Independence

Parent の申告、証人の証言、Consensus 投票の内容は、
同一の Oracle root・Child・proof に対する Verify 結果を変更しない。

## SP-5 Time–Space Binding

異なる生成時刻、許容時間窓、因果空間または世代順序を持つ対象を、
同一 Child として成立させることができない。

## SP-6 Single-Use Complementarity

同じ相補資格を、二つ以上の正規 Child 生成に使用できない。

## SP-7 Oracle Non-Equivocation / Accountability

同一 issuance_id に異なる二つの root を正規提示できない。
防止できない構成では、二枚舌を公開証拠として必ず検出できる。

## SP-8 Forward Lineage Integrity

将来の鍵侵害によって、侵害前に確定した Child の系譜を
正規性を維持したまま置換できない。

## SP-9 Consensus-Independent Authenticity

全 Consensus ノードが悪意を持っていても、
真正な Oracle root を持つ検証者へ偽 Child を正規受理させられない。
