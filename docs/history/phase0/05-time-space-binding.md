# Time–Space Lineage Binding v0.1

## 四つの時間認識

Child 生成事象は、次の四点へ束縛される。

1. Parent A の参加時刻コミットメント
2. Parent B の参加時刻コミットメント
3. Child の生成時刻
4. Oracle が生成前に固定した許容時間窓

## 因果順序

Oracle issuance
  < Parent A participation
  < Child generation

Oracle issuance
  < Parent B participation
  < Child generation

Child generation ∈ allowed_time_window

## Space

Phase 0 における Space は因果空間である。

- どの relation か
- どの issuance か
- どの Parent state か
- どの protocol session か
- どの世代か
- どの rule version か

## 目標

攻撃者は、元と異なる時間または因果空間を持つ代替 Child を、
元と同一の正規 Child として成立させられない。
