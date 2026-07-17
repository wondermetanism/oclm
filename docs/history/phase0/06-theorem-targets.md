# Theorem Targets v0.1

## Theorem 1 — OCLM Time–Space Lineage Substitution Resistance

真正な Oracle root を保持する検証者が存在し、
対象 issuance の発行時秘密状態が侵害されておらず、
使用する署名・コミットメント・ハッシュ・一回性機構が安全ならば、
Parent A、Parent B、および全 Consensus / 保存ノードを支配する
任意の確率的多項式時間攻撃者は、元と異なる Parent、Child、
生成時刻、因果空間、生成規則または系譜を持つ代替存在を、
元と同一の正規 Child として受理させることができない。
その成功確率は security parameter に対して negligible である。

## Theorem 2 — Claim-Collapse Independence

前提崩壊後、任意の Parent 申告およびノード投票の変更は、
固定された Oracle root と Child lineage proof に対する
正規検証結果を変化させない。

## Theorem 3 — No-Oracle-Lineage Impossibility

全 Parent と全 Consensus ノードが悪意を持ち得る環境で、
現在の申告と投票だけを入力とする検証者は、
観測可能情報が同一な二つの競合過去を区別できない。

## 証明順序

1. Theorem 3 の識別不能性を示す
2. OCLM の追加情報を定義する
3. Theorem 2 を構文的に示す
4. Theorem 1 を記号モデルで検証する
5. 具体構成後に計算量的帰着を行う
