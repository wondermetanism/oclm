# Entities and State v0.1

## Oracle

Oracle は結果を決定しない。
生成前に、以下を固定する。

- issuance_id
- relation_id
- complementary credential pair
- Parent への割当束縛
- allowed_time_window
- allowed_causal_space
- generation_rule_version
- one-time-use policy
- issuance commitment/root

Oracle は Child の内容を事前決定しない。

## Parent A / Parent B

Parent は主体の永久的な雄・雌属性を持たない。
各 issuance において動的に割り当てられた相補資格を保持する。

Parent の役割:

- 自身の資格を正当に行使する
- 生成への参加を認証する
- 自身の観測時刻・文脈を束縛する
- Child 生成に固有入力を与える

## Child

Child は生成後に独立した正規存在となる。
最低限、以下への暗号学的束縛を持つ。

- issuance_id
- Oracle root
- Parent A credential commitment
- Parent B credential commitment
- Parent A participation commitment
- Parent B participation commitment
- generation time
- allowed time window
- causal space
- interaction commitment
- generation rule version
- unique child identifier
- lineage proof

## Time–Space

Time は単なる表示時刻ではなく生成可能性の制約である。

Space は初期段階では因果空間を意味する。

- relation_id
- issuance_id
- Parent states
- protocol session
- generation sequence
- application domain

物理位置の証明は別拡張とし、Phase 0 では必須としない。
